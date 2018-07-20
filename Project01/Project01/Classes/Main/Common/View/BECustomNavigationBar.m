//
//  BECustomNavigationBar.m
//  Project01
//
//  Created by George.tan on 2018/7/20.
//  Copyright © 2018年 George.tan. All rights reserved.
//

#import "BECustomNavigationBar.h"

@interface BECustomNavigationBar()
@property(nonatomic,strong) UIButton* backButton;
@property(nonatomic,strong) UIImageView* backGroundView;
@property(nonatomic,strong) UILabel* titltLb;
@end

@implementation BECustomNavigationBar

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self initProperites];
        [self layoutMasonry];
    }
    return self;
}

-(void)setupUI{
    _backGroundView = [[UIImageView alloc] init];
    [self addSubview:_backGroundView];
    
    _backButton = [[UIButton alloc] init];
    [self addSubview:_backButton];
    
    _titltLb = [[UILabel alloc] init];
    [_titltLb setTextAlignment:NSTextAlignmentCenter];
    [self addSubview:_titltLb];
}

-(void)layoutMasonry{
    [_backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(5);
        make.height.mas_equalTo(self.bounds.size.height*0.8);
        make.centerY.equalTo(self);
        make.width.equalTo(@(30));
    }];
    
    [_titltLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

-(void)initProperites{
    [_backButton setImage:IMAGE(@"back") forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    [_backGroundView setImage:IMAGE(@"mainColor")];
    
    [_titltLb setText:@"登录"];
    [_titltLb setTextColor:[UIColor whiteColor]];
    _titltLb.font = self.titleFont;
}

-(void)backAction{
    SAFE_BLOCK(self.backActionBlock);
}

@end
