//
//  UIColor+BECustom.h
//  Project01
//
//  Created by George.tan on 2018/7/24.
//  Copyright © 2018年 George.tan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (BECustom)
/**
 根据十六机制字符定制颜色
 */
+(UIColor *)colorWithHexString:(NSString *)hexColorString;
@end
