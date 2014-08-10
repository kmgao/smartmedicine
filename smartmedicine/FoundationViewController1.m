//
//  FoundationViewController.m
//  smartmedicine
//
//  Created by kmgao on 13-12-30.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import "FoundationViewController1.h"
#import "GridScrollView.h"
#import "ListViewController.h"


@interface FoundationViewController1 ()<GridButtonItemDelegate>
{
    NSArray *itemTitleArrays;
}
@end

@implementation FoundationViewController1  

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.view.frame = CGRectMake(0, 0, 320, IPHONE_SCREEN_HEIGHT); 
    
    UIImage *image = nil;
    image = [UIImage imagePathed:@"bg_secondmenu.png"];
  
    UIImageView *bgImgage = [[UIImageView alloc] initWithImage:image];
    
    [bgImgage setFrame:self.view.frame];
    [self.view addSubview:bgImgage];
    
    [self.navBar setTitle:@"基础教程" withColor:[UIColor blackColor]];
    [self.navBar setLeftButton:@"btn_back_normal.png" andHight:@"btn_back_pressed.png"];
    [self.view addSubview:self.navBar];
    
    
    NSArray *btnArrays = [NSArray arrayWithObjects:@"a_01.png",@"a_02.png",@"a_03.png",
                          @"a_04.png",@"a_05.png",@"a_06.png",
                          @"a_07.png",@"a_08.png",@"a_09.png",
                          @"a_10.png",@"a_11.png",@"a_12.png",
                          @"a_13.png",nil];
    
    itemTitleArrays = [NSArray arrayWithObjects:@"病生理学",@"病理学",@"生理学",
                       @"生物化学",@"医学微生物学",@"系统解剖学",
                       @"医学免疫学",@"组织胚胎学",@"人体寄生虫学",
                       @"药理学",@"医学遗传学",@"医学心理学",
                       @"预防医学",nil];
    
    NSString *btnBgName = @"bg_book.png";//bg_courselist_item@2x
    NSString *gridBgName = @"bg_courselist_item.png";
    
    GridScrollView *gridView = [[GridScrollView alloc] initWithFrame:CGRectMake(0, kNAVIGATION_BARH, 320, IPHONE_SCREEN_HEIGHT-kNAVIGATION_BARH-kTabNaviBarH)];
    
    [gridView setWithPos:CGPointMake(0, kNAVIGATION_BARH) btnImages:btnArrays btnBgImg:btnBgName rowBg:gridBgName delegate:self];
    [self.view addSubview:gridView];
    
    
    [self addTabNaviBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} 

-(void)clickButtonItem:(int)index
{
    NSArray  *listArray = [[[AppDelegate shareInstance] dataModel] foundArray];
    NSDictionary  *listDic = [listArray objectAtIndex:index];
    NSArray    *subArray = [listDic allValues][0];
    
    ListViewController *listController = [[ListViewController alloc] initWithArray:subArray andTitle:itemTitleArrays[index]];
    [self.navigationController pushViewController:listController animated:YES];
    
//    for(NSDictionary *sub in subArray){
//        NSArray *keyArray = [sub allKeys];
//        int pos = 0;
//        for(NSString *subKey in keyArray){
//            if([subKey isEqualToString:@"url"]){
//                break;
//            }
//            pos ++;
//        }
//        NSString *nameKey=nil,*urlKey = nil;
//        if(pos > 0){
//            nameKey = keyArray[0];
//            urlKey = keyArray[1];
//        }
//        else{
//            nameKey = keyArray[1];
//            urlKey = keyArray[0];
//        }
//        NSString  *valueName = [sub objectForKey:nameKey];
//        NSString  *urlName = [sub objectForKey:urlKey];
//        NSLog(@"the Name = %@ ; the url = %@",valueName,urlName);
    
//    }
 
        
}



@end
