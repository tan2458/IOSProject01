//
//  BEBaseNavigationController.m
//  Project01
//
//  Created by George.tan on 2018/7/24.
//  Copyright © 2018年 George.tan. All rights reserved.
//

#import "BEBaseNavigationController.h"

@interface BEBaseNavigationController ()

@end

@implementation BEBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UINavigationBar appearance] setBarTintColor:mainColor];
    [[UINavigationBar appearance] setBarTintColor:mainColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor redColor], NSFontAttributeName : [UIFont fontWithName:CUSTOM_FONT_NAME size:UI_PX_2_PT(34.0f)] }];
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
