//
//  WebViewController.m
//  smartmedicine
//
//  Created by kmgao on 14-1-8.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import "WebViewController.h"



@interface WebViewController ()<UIWebViewDelegate,UIScrollViewDelegate>
{
    UIWebView   *_webView;
    NSString    *_naviTitle;
    UIActivityIndicatorView *_active;
    
    UIScrollView  *_zoomView;
    
}
@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithTitle:(NSString*)title{
    self = [super init];
    if(self){
        _naviTitle = title;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.view.frame = CGRectMake(0, 0, kIPHONE_SCREEN_WIDTH, IPHONE_SCREEN_HEIGHT);
    
    [self.navBar SetNaviBackground:@"bg_top_bar_1.png"];
    
//    [self.navBar setTitle:_naviTitle withColor:[UIColor whiteColor]];
    [self.navBar setTitle:@"医学智能学习宝典" withColor:[UIColor whiteColor]];
    [self.navBar setLeftButton:@"btn_back_normal_2.png" andHight:@"btn_back_pressed_2.png"];
    [self.view addSubview:self.navBar];
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
//    [_active stopAnimating];
//    [_active removeFromSuperview];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_active stopAnimating];
    [_active removeFromSuperview];
    [webView stringByEvaluatingJavaScriptFromString:@"var script = document.createElement('script');"
     "script.type = 'text/javascript';"
     "script.text = \"function myFunction() { "
     "var field = document.getElementsByName('q')[0];"
     "field.value='朱祁林';"
     "document.forms[0].submit();"
     "}\";"
     "document.getElementsByTagName('head')[0].appendChild(script);"];
     [webView stringByEvaluatingJavaScriptFromString:@"myFunction();"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [_active stopAnimating];
    [_active removeFromSuperview];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)openURL:(NSURL*)url{
    if(_webView == nil){
        NSLog(@"web view request URL = %@",url);
        
         _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, kNAVIGATION_BARH-3, kIPHONE_SCREEN_WIDTH, IPHONE_SCREEN_HEIGHT-kNAVIGATION_BARH)];
         _webView.delegate = self;
        _webView.scalesPageToFit = YES;
        [self.view addSubview:_webView];
        
        _active = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_active startAnimating];
        _active.center = self.view.center;
        
        [self.view addSubview:_active];
 
        
        NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:url];
        [_webView loadRequest:urlRequest];
        
    }

}



@end
