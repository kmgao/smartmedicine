//
//  LoginViewController.h
//  smartmedicine
//
//  Created by kmgao on 14-1-18.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import "BaseViewController.h"

@interface LoginViewController : BaseViewController


@property(nonatomic,strong) IBOutlet UITextField *userName;
@property(nonatomic,strong) IBOutlet UITextField *password;
@property(nonatomic,strong) IBOutlet UILabel *pwsLink;
@property(nonatomic,strong) IBOutlet UIButton *autoLogin;
@property(nonatomic,strong) IBOutlet UIButton *loginBtn;
@end
