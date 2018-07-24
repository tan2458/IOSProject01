//
//  UIViewController+BECustomViewController.m
//  Project01
//
//  Created by George.tan on 2018/7/24.
//  Copyright © 2018年 George.tan. All rights reserved.
//

#import "UIViewController+BECustomViewController.h"

@implementation UIViewController (BECustomViewController)
+ (void)load
{
#ifdef DEBUG
#if kPrintPathLog == 1
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = [self class];
        Method m1 = class_getInstanceMethod(cls, @selector(viewDidLoad));
        Method m2 = class_getInstanceMethod(cls, @selector(ViewDidLoad_EverPath));
        method_exchangeImplementations(m1, m2);
    });
#endif
#endif
}

- (void)ViewDidLoad_EverPath
{
    [self ViewDidLoad_EverPath];
    printf("Ever_VC_Path:%s\n",NSStringFromClass(self.class).UTF8String);
}
@end
