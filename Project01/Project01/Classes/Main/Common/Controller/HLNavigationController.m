//
//  HLNavigationController.m
//  HomeLinked
//
//  Created by xieshimin on 16/11/10.
//  Copyright © 2016年 Huawei. All rights reserved.
//

#import "HLNavigationController.h"

@interface HLNavigationController () <UIGestureRecognizerDelegate>

/** 全屏手势*/
@property(nonatomic, strong) UIPanGestureRecognizer *pan;

/** 返回按钮*/
@property(nonatomic, strong) UIButton *backButton;

@end

@implementation HLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setCommonNavigationStyle];
    
    // 获取系统自带滑动手势的对象
    id target = self.interactivePopGestureRecognizer.delegate;
    
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法handleNavigationTransition
    self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];

    // 设置手势代理，拦截手势触发
    self.pan.delegate = self;
    
    // 添加手势
    [self.view addGestureRecognizer:self.pan];
    
    // 取消系统自带的滑动
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)setCommonNavigationStyle {
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"background_main_color"] forBarMetrics:UIBarMetricsDefault];
    
    // 取消navigationBar的模糊效果
    self.navigationBar.translucent = NO;

    [self.navigationBar setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont fontWithName:CUSTOM_FONT_NAME size:UI_PX_2_PT(34.0f)] }];
}

#pragma marks - UIGestureRecognizerDelegate

/** 什么时候调用：每次触发手势之前都会询问下代理，是否触发。拦截手势触发*/
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
    for (UIViewController *viewController in self.viewControllers) {
        CGPoint translatedPoint = [pan translationInView:viewController.view];
        if (translatedPoint.x > 0) {
            if (self.viewControllers.count == 1) {
                // 表示用户在根控制器界面，就不需要触发滑动手势，
                return NO;
            }
            return YES;
        }
    }
    return NO;
}

/**
 *  重写这个方法的目的:为了拦截整个push过程,拿到所有push进来的子控制器
 *
 *  @param viewController 是当前push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断当前控制器是不是第一级控制器时设置下放的控制栏和上方的导航条左侧按钮
    if (self.viewControllers.count > 0) {
        [self hideBottonBar:viewController];
        [self setLeftBarButton:viewController];
    }
    
    [super pushViewController:viewController animated:animated];
}

/** 判断为不是第一级控制器就隐藏下放的控制栏*/
- (void)hideBottonBar:(UIViewController *)viewController {
    viewController.hidesBottomBarWhenPushed = YES;
}

/** 判断为不是第一级控制器就设置导航条的左边按钮为返回图标*/
- (void)setLeftBarButton:(UIViewController *)viewController {
    /*
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"navigationBar_back"] forState:UIControlStateNormal];
    [button sizeToFit];
    button.backgroundColor = [UIColor redColor];
    [button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor clearColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    self.backButton = button;
    
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];*/
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigationBar_back"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
}

- (void)enabledPopGestureRecognizer {
    self.pan.enabled = YES;
}

- (void)disabledPopGestureRecognizer {
    self.pan.enabled = NO;
}

- (void)setBackButtonHidden {
    self.backButton.hidden = YES;
}

/** 返回*/
- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
