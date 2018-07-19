//
//  BEBgroundView.m
//  Project01
//
//  Created by George.tan on 2018/7/18.
//  Copyright © 2018年 George.tan. All rights reserved.
//

#import "BEBgroundView.h"

@interface BEBgroundView()<UITextFieldDelegate>

@property(nonatomic,strong) UIImageView* headerImage; // 头部视图

@property(nonatomic,strong) UITextField *accountTextField; // 账号输入框

@property(nonatomic,strong) UITextField *passwordTextField;// 密码输入框

@property(nonatomic,strong) UIView *rememberPasswordView; // 记住密码

@property(nonatomic,strong) UIButton* loginButton; // 登录按钮

@property(nonatomic,strong) UIButton* findPassButton; // 找回密码

@property(nonatomic,strong) UIButton* localManagerButton;// 本地管理

@property(nonatomic,strong) BELogiViewModel* viewModel;

@end

@implementation BEBgroundView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self layoutMasonrys];
        [self initProperitys];
    }
    return self;
}

-(void)setupUI{
     _headerImage = [[UIImageView alloc] init];
    [self addSubview:_headerImage];
    [_headerImage setImage:IMAGE(@"mainColor")];
    
    _accountTextField = [[UITextField alloc] init];
    [self addSubview:_accountTextField];
    
    _passwordTextField = [[UITextField alloc] init];
    [self addSubview:_passwordTextField];
    
    _rememberPasswordView = [[UIView alloc] init];
    [self addSubview:_rememberPasswordView];
    
    _loginButton = [[UIButton alloc] init];
    [self addSubview:_loginButton];
    
    _findPassButton = [[UIButton alloc] init];
    [self addSubview:_findPassButton];
    
    _localManagerButton = [[UIButton alloc] init];
    [self addSubview:_localManagerButton];
}

-(void)layoutMasonrys{
    [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(150);
    }];
    
    [_accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self->_headerImage.mas_bottom);
    }];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self->_accountTextField.mas_bottom);
    }];
    
    [_rememberPasswordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.left.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(10);
        make.right.equalTo(self).mas_offset(-10);
        make.height.mas_equalTo(44);
        make.bottom.equalTo(self).mas_offset(-25);
    }];
    
    [_findPassButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(10);
        make.top.equalTo(self);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
        
    }];
    
    [_localManagerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.right.equalTo(self).mas_offset(-10);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(20);
    }];
}

-(void)initProperitys{
    _accountTextField.placeholder = @"请输入账号";
    _accountTextField.delegate = self;
    
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.delegate = self;
    
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor blueColor]];
    [_loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_findPassButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [_findPassButton addTarget:self action:@selector(findPassButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_localManagerButton setTitle:@"本地管理" forState:UIControlStateNormal];
    [_localManagerButton addTarget:self action:@selector(localManagerClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Events
-(void)loginButtonClick{
    
}

-(void)findPassButtonClick{
    
}

-(void)localManagerClick{
    
}

/**
 绑定视图模型
 */
-(void)BE_BindLoginViewModel:(BELogiViewModel*)viewModel{
    self.viewModel = viewModel;
}

@end
