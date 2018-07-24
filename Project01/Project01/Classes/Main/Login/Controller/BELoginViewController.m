//
//  BELoginViewController.m
//  Project01
//
//  Created by George.tan on 2018/7/7.
//  Copyright © 2018年 George.tan. All rights reserved.
//

#import "BELoginViewController.h"

@interface BELoginViewController ()<BEBgroundViewDelegate>

@property(nonatomic,strong) BEBgroundView *BE_bgView;

@property(nonatomic,strong) BECustomNavigationBar *navigationBar;

@end

@implementation BELoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.BE_bgView];
}

- (void)didReceiveMemoryWarning {
    NSLog(@"%s",__FUNCTION__);
    [super didReceiveMemoryWarning];
}

#pragma mark - BEGroundViewDelegate
-(void)BEBgroundView:(BEBgroundView*)view clickEvent:(EventType)eventType{
    switch (eventType) {
        case LoginClickEvent:
        {
            [UIApplication sharedApplication].keyWindow.rootViewController = [BEMainTabController shareInstance];
        }
            break;
        case RememberClickEvent:
            break;
        case FindPassClickEvent:
            break;
        case LocalClickEvent:
            break;
        default:
            break;
    }
}

#pragma mark - lazy load view
-(BEBgroundView *)BE_bgView{
    if (!_BE_bgView) {
        _BE_bgView = [[BEBgroundView alloc] initWithFrame:CGRectMake(0,BE_NavigationBar_Height,BE_WIDTH,BE_HEIHT)];
        _BE_bgView.delegate = self;
    }
    return _BE_bgView;
}

-(BECustomNavigationBar *)navigationBar{
    if (!_navigationBar) {
        _navigationBar = [[BECustomNavigationBar alloc] initWithFrame:CGRectMake(0,0,BE_WIDTH,BE_NavigationBar_Height)];
    }
    return _navigationBar;
}


@end
