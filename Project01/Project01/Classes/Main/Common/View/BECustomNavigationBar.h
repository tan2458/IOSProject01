//
//  BECustomNavigationBar.h
//  Project01
//
//  Created by George.tan on 2018/7/20.
//  Copyright © 2018年 George.tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BECustomNavigationBar : UIView

@property(nonatomic,strong) UIFont *titleFont;

@property(nonatomic,copy) void(^backActionBlock)();

@end
