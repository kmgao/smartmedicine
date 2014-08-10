//
//  LoginViewController.m
//  smartmedicine
//
//  Created by kmgao on 14-1-18.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "ASIFormDataRequest.h"
#import "SBJson.h"
#import "MBProgressHUD.h"
#import  "OpenUDID.h"

/*****
 *accout: yyyy pasword:111
 *
 *accout: yyyy pasword:111
 */
//#define KLoginBaseURL  @"http://www.hxyiyo.com:8080/ebody/login?"
//#define KLoginBaseURL  @"http://yiyoyo.wicp.net:8012/quanke/loginios?"
#define KLoginBaseURL  @"http://www.hxyiyo.com:8080/eboma/ebo?"

@interface LoginViewController ()
{

    ASIFormDataRequest  *httpReq;
    UIActivityIndicatorView *_active;
    
    BOOL   isAutoLogin;
    
}
@end

@implementation LoginViewController

@synthesize userName,password,pwsLink,autoLogin,loginBtn;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:@"LoginViewController" bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancelTextFieldFocus)];
    [self.view addGestureRecognizer:tapGesture];
    
    [self.pwsLink setTextColor:[UIColor grayColor]];
    
//    CGRect _frame = [self.pwsLink frame];
//    _frame.origin.y += _frame.size.height+1;
//    _frame.size.height = 1;
//    UIImageView  *imgView = [[UIImageView alloc] initWithFrame:_frame];
//    [imgView setBackgroundColor:[UIColor grayColor]];
//    [self.view addSubview:imgView];
    
    
//    [self.loginBtn setShowsTouchWhenHighlighted:YES];
 
   [self.autoLogin setBackgroundImage:[BUtitle loadImage:@"cb_green_off.png"] forState: UIControlStateNormal];
   [self.autoLogin setBackgroundImage:[BUtitle loadImage:@"cb_green_on.png"] forState: UIControlStateSelected];
    
    NSString* uName = [[NSUserDefaults standardUserDefaults] objectForKey:@"userName"];
    NSString* pswWord = [[NSUserDefaults standardUserDefaults] objectForKey:@"passWord"];
    if(userName)
    {
        [self.userName setText:uName];
    }
    if(pswWord)
    {
        [self.password  setText:pswWord];
    }
    
//    NSString *isAutoLoing = [[NSUserDefaults standardUserDefaults] objectForKey:@"isAutoLogin"];
//    if(isAutoLoing && [isAutoLoing isEqualToString:@"1"])
//    {
//        [self loginBntClick:nil];
//    }
}

-(void)cancelTextFieldFocus
{
    [userName resignFirstResponder];
    [password resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)loginBntClick:(id)sender
{
    NSString *userNameStr = [self.userName text];
    NSString *passwordStr = [self.password text];
    
    if(userNameStr == nil || userNameStr.length <= 0) {
        UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"用户名不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return ;
    }
    if(passwordStr == nil || passwordStr.length <= 0)
    {
        UIAlertView  *alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"密码不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        return ;
    }
    
    NSURL *url = [[NSURL alloc] initWithString:KLoginBaseURL];
    httpReq = [[ASIFormDataRequest alloc] initWithURL:url];
    [httpReq setRequestMethod:@"POST"];
    [httpReq setDelegate:self];
    [httpReq addPostValue:@"ebodylogin" forKey:@"action"];
    [httpReq addPostValue:userNameStr forKey:@"useName"];
    [httpReq addPostValue:passwordStr forKey:@"passWord"];
//    [httpReq addPostValue:@"" forKey:@"info"];
    NSString *IMEI = [OpenUDID value];
    [httpReq addPostValue:IMEI forKey:@"imei"];
    
    [httpReq startAsynchronous];
    
    _active = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [_active startAnimating];
    _active.center = self.view.center;
    
}

-(void)showNetInfo:(NSString*)info
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"错误信息" message:info delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    
    [alertView show];
}


- (void) requestFinished:(ASIHTTPRequest *)request{
    
    NSMutableData *data =  request.postBody;
    NSString *datStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"post data  %@",datStr);
    
    
    [_active stopAnimating];
    [_active removeFromSuperview];
    
//    NSString *responseString = [request responseString];

    NSString  *utf8Str = [[NSString alloc] initWithData:[request responseData] encoding:NSUTF8StringEncoding];
    NSLog(@"%@",utf8Str);
    
    NSDictionary *parser = [utf8Str JSONValue];
    NSNumber  *status = [parser objectForKey:@"code"];
    if([status intValue] == 200)
    {
        NSString  *usrName1 = [parser objectForKey:@"useName"];
        NSString  *passWord = [parser objectForKey:@"passWord"];
        NSString  *info = [parser objectForKey:@"info"];
        
        [self saveUserInfo:usrName1 andPsw:passWord];
        
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:hud];
        hud.mode = MBProgressHUDModeText;
        hud.animationType = MBProgressHUDAnimationFade;
        hud.opacity = 0.7;
        hud.labelText = info;
        [hud showAnimated:YES whileExecutingBlock:^{
            sleep(2);
        } completionBlock:^{
            [hud removeFromSuperview];
            MainViewController *mainVC = [[MainViewController alloc] init];
            [self.navigationController pushViewController:mainVC animated:YES];
        }];
        
    }
    if([status intValue] == 204)
    {
        NSString  *info = [parser objectForKey:@"info"];
//        [self showNetInfo:info];
        
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:hud];
        hud.mode = MBProgressHUDModeText;
        hud.animationType = MBProgressHUDAnimationFade;
        hud.opacity = 0.7;
        hud.labelText = info;
        [hud showAnimated:YES whileExecutingBlock:^{
            sleep(2);
        } completionBlock:^{
            [hud removeFromSuperview];
        }];
    }
}


-(void)saveUserInfo:(NSString*)usrName andPsw:(NSString*)psword
{
    [[NSUserDefaults standardUserDefaults] setObject:usrName forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults] setObject:psword forKey:@"passWord"];
    if(isAutoLogin)
    {
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"isAutoLogin"];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (void) requestFailed:(ASIHTTPRequest *)request{
    NSError *error = [request error];
    NSLog(@"%@",error);
    
    [_active stopAnimating];
    [_active removeFromSuperview];
    
    [self requestFinished:request];
    
}

-(IBAction)passwordClickDown:(id)sender
{
    [self.pwsLink setTextColor:[UIColor blueColor]];
}


-(IBAction)passwordDownDrag:(id)sender
{
    [self.pwsLink setTextColor:[UIColor grayColor]];
}

-(IBAction)takeBackPws:(id)sender
{
    NSLog(@"find back password");
    
    [self.pwsLink setTextColor:[UIColor grayColor]];
    
    NSString  *urlPath = @"http://www.baidu.com/index.html";
    [[AppDelegate shareInstance] OpenURL:[NSURL URLWithString:urlPath]];
    
}

-(IBAction)autoClickDrag:(id)sender
{
    isAutoLogin = !isAutoLogin;
}

-(IBAction)autoClickDown:(id)sender
{
    isAutoLogin = !isAutoLogin;
}

-(IBAction)autoClickBtn:(id)sender
{  
    if(isAutoLogin)
    {
        [self.autoLogin setBackgroundImage:[BUtitle loadImage:@"cb_green_on.png"] forState: UIControlStateNormal];
    }
    else
    {
        [self.autoLogin setBackgroundImage:[BUtitle loadImage:@"cb_green_off.png"] forState: UIControlStateNormal];
    }
    
}

@end
