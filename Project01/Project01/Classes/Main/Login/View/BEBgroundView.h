//
//  BEBgroundView.h
//  Project01
//
//  Created by George.tan on 2018/7/18.
//  Copyright © 2018年 George.tan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BEBgroundView;
@class BELogiViewModel;

typedef NS_ENUM(NSInteger,EventType){
    LoginClickEvent, // 登录事件
    RememberClickEvent,// 记住密码事件
    FindPassClickEvent, // 找回密码事件
    LocalClickEvent, // 本地管理事件
};

@protocol BEBgroundViewDelegate<NSObject>
@optional

-(void)BEBgroundView:(BEBgroundView*)view clickEvent:(EventType)eventType;

@end

@interface BEBgroundView : UIView

@property(nonatomic,weak) id<BEBgroundViewDelegate> delegate;

/**
 绑定视图模型
 */
-(void)BE_BindLoginViewModel:(BELogiViewModel*)viewModel;

@end
