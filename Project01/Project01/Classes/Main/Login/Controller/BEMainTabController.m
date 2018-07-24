//
//  BEMainTabController.m
//  Project01
//
//  Created by George.tan on 2018/7/20.
//  Copyright © 2018年 George.tan. All rights reserved.
//

#import "BEMainTabController.h"

@interface BEMainTabController ()

@end

@implementation BEMainTabController

static BEMainTabController *_mainTabController = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewControllers];
}

-(void)addChildViewControllers{
    [self setUpChildViewController:[[BEBaseNavigationController alloc] initWithRootViewController:[[BEFamilyLetterController alloc] init]] title:LocatizedStirngForkey(@"app_message") image:@"homeTabbar_message_default" selectedImage:@"homeTabbar_message_selected"];
    
    [self setUpChildViewController:[[BEBaseNavigationController alloc] initWithRootViewController:[[BEFamilyDeviceController alloc] init]] title:LocatizedStirngForkey(@"ifamily_device") image:@"homeTabbar_myApps_default" selectedImage:@"homeTabbar_myApps_selected"];
    
    [self setUpChildViewController:[[BEBaseNavigationController alloc] initWithRootViewController:[[BEMyFamilyNetoworkController alloc] init]] title:@"" image:@"homeTabbar_home_default" selectedImage:@"homeTabbar_home_selected"];
    
    [self setUpChildViewController:[[BEBaseNavigationController alloc] initWithRootViewController:[[BEShopViewController alloc] init]] title:LocatizedStirngForkey(@"wo_market") image:@"homeTabbar_shooping_default" selectedImage:@"homeTabbar_shooping_selected"];
    
    [self setUpChildViewController:[[BEBaseNavigationController alloc] initWithRootViewController:[[BESettingViewController alloc] init]] title:LocatizedStirngForkey(@"wo_settting") image:@"homeTabbar_myFamily_default" selectedImage:@"homeTabbar_myFamily_selected"];
}

/** 设置barItem中的控制器*/
- (void)setUpChildViewController:(UIViewController *) vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    vc.tabBarItem.title = title;
    vc.title = title;
    // 图片默认Xcode会给你渲染成蓝色，将图片设置为original image
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [vc.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : mainColor, NSFontAttributeName : [UIFont fontWithName:CUSTOM_FONT_NAME size:11] } forState:UIControlStateSelected];
    [self addChildViewController:vc];
}

+(instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mainTabController = [[BEMainTabController alloc] init];
    });
    return _mainTabController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
