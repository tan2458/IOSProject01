//
//  Macros.h
//  Project01
//
//  Created by George.tan on 2018/7/18.
//  Copyright © 2018年 George.tan. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define IMAGE(imageName) [UIImage imageNamed:imageName]
#define SAFE_BLOCK(block,...) if(block){block(__VA_ARGS__);}
#define BE_WIDTH [UIScreen mainScreen].bounds.size.width
#define BE_HEIHT [UIScreen mainScreen].bounds.size.height
#define BE_NavigationBar_Height 64
#define CORLOR_WITH_RGB(r,g,b,alp) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:alp]
#define mainColor CORLOR_WITH_RGB(0, 179, 228,1.0)

#define CUSTOM_FONT_NAME  @"Heiti SC"

#define LocatizedStirngForkey(key) NSLocalizedString(key, nil)
#define UI_PX_2_PT(a) (CGFloat)((a)/([[UIScreen mainScreen] bounds].size.height >= 736.0f ? 2: 2))

#endif /* Macros_h */
