//
//  BELoginViewController.m
//  Project01
//
//  Created by George.tan on 2018/7/7.
//  Copyright © 2018年 George.tan. All rights reserved.
//

#import "BELoginViewController.h"

@interface BELoginViewController ()

@property(nonatomic,strong) BEBgroundView *BE_bgView;

@end

@implementation BELoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.BE_bgView];
}

- (void)didReceiveMemoryWarning {
    NSLog(@"%s",__FUNCTION__);
    [super didReceiveMemoryWarning];
    
}

#pragma mark - lazy load view
-(BEBgroundView *)BE_bgView{
    if (!_BE_bgView) {
        _BE_bgView = [[BEBgroundView alloc] initWithFrame:self.view.bounds];
    }
    return _BE_bgView;
}


@end
