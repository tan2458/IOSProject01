//
//  HLNavigationController.h
//  HomeLinked
//
//  Created by xieshimin on 16/11/10.
//  Copyright © 2016年 Huawei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLNavigationController : UINavigationController

/** 使全屏滑动生效*/
- (void)enabledPopGestureRecognizer;

/** 禁用全屏滑动*/
- (void)disabledPopGestureRecognizer;

/** 隐藏左上角返回按钮*/
- (void)setBackButtonHidden;

@end
