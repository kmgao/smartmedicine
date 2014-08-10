//
//  ListViewController.m
//  smartmedicine
//
//  Created by kmgao on 14-1-8.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import "ListViewController.h"

#import "WebViewController.h"

#define  kTableViewCellH      80
#define  kTableViewSubCellH   50

enum
{
    E_Dir_None = -1,
    E_Dir_Add,
    E_Dir_Arrow
};

@interface TreeNde : NSObject

@property(nonatomic,strong) TreeNde   *parent;
@property(nonatomic,strong) NSArray   *subNodes;
@property(nonatomic,strong) NSDictionary   *objDic;
@property (nonatomic) BOOL  isExpanded;

@end

@implementation TreeNde

@end


@interface CustomTableViewCell : UITableViewCell

@property(nonatomic,copy)  NSString  *lablTitle;
@property(nonatomic,retain) NSArray  *subArray;
@property(nonatomic,retain) TreeNde  *node;

-(id)initWithIcon:(NSString*)identifier andIcon:(NSString*)iconName andTitle:(NSString*)title andDirIcon:(int)arrow isSubItem:(BOOL)isItem;

@end

@implementation CustomTableViewCell
@synthesize lablTitle;
@synthesize subArray;
@synthesize node = _node;

-(id)initWithIcon:(NSString*)identifier andIcon:(NSString*)iconName andTitle:(NSString*)title andDirIcon:(int)arrow isSubItem:(BOOL)isItem{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    if(self){
        
        self.lablTitle = title;
        
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleGray;
        UIImageView  *imgView = nil;
        if(!isItem)
        {
            imgView = [[UIImageView alloc] initWithImage:[BUtitle loadImage:@"btn_main_normal.png"]];
            UIImage *iconImag = [BUtitle loadImage:iconName];
            if(nil == iconImag)
            {
                iconImag = [BUtitle loadImage:@"t_26.png"];
            }
            UIImageView  *subView = [[UIImageView alloc] initWithImage:iconImag];
            imgView.frame = CGRectMake(10, 10, 60 , 60);
            subView.frame = CGRectMake(0, 0, 60, 60);
            [imgView addSubview:subView];
        }
        else
        {
            imgView = [[UIImageView alloc] initWithImage:[BUtitle loadImage:@"icon_unfold.png"]];
            imgView.frame = CGRectMake(40, 10, 12 , 29);
        }
        
        [self.contentView addSubview:imgView];
        
        UILabel  *lableText = [[UILabel alloc] init];
        lableText.textAlignment = NSTextAlignmentLeft;
        lableText.textColor = [UIColor blackColor];
        lableText.text = title;
        lableText.backgroundColor = [UIColor clearColor];
        lableText.font = [UIFont systemFontOfSize:14];
        [lableText sizeToFit];
        CGRect  _frame = lableText.frame;
        if(!isItem)
            _frame.origin.x = imgView.frame.origin.x + imgView.frame.size.width + 10;
        else
            _frame.origin.x = imgView.frame.origin.x + imgView.frame.size.width + 15;
        _frame.origin.y = imgView.frame.origin.y + imgView.frame.size.height/2 - 8;
        _frame.size.width = kIPHONE_SCREEN_WIDTH - 30 - _frame.origin.x;
        lableText.frame = _frame;
        
        [self.contentView addSubview:lableText];
        
        if(arrow != E_Dir_None){
            UIImageView *arrImg = [[UIImageView alloc] init];
            arrImg.frame = CGRectMake(self.frame.size.width-30, kTableViewCellH/2-12, 12, 29);
            if(arrow == E_Dir_Add){
                arrImg.image = [BUtitle loadImage:@"icon_unfold.png"];
            }
            if(arrow == E_Dir_Arrow){
                arrImg.image = [BUtitle loadImage:@"icon_fold.png"];
            }
            [self.contentView addSubview:arrImg];
        }
    }
    return self;
}

@end

@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView   *_listTable;
    NSString      *_naviTitle;
}

@property (strong, nonatomic) NSMutableArray *listNodes;
@property (strong, nonatomic) NSMutableArray *displayNodes;

@end

@implementation ListViewController

@synthesize listItems = _listItems;
@synthesize naviTitle = _naviTitle;
@synthesize listNodes = _listNodes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)shareArrayDic:(NSArray*)keyArray originDic:(NSDictionary*)dic andDic:(NSMutableDictionary*)targetDic{
    int pos = 0;
    for(NSString *subKey in keyArray){
        if([subKey isEqualToString:@"url"]){
            break;
        }
        pos ++;
    }
    NSString *nameKey=nil,*urlKey = nil;
    if(pos > 0){
        nameKey = keyArray[0];
        urlKey = keyArray[1];
    }
    else{
        nameKey = keyArray[1];
        urlKey = keyArray[0];
    }
    NSString  *valueName = [dic objectForKey:nameKey];
    NSString  *urlName = [dic objectForKey:urlKey];
    NSLog(@"{%@ = %@ ; %@ = %@}",nameKey,valueName,urlKey,urlName);
    
    [targetDic setObject:valueName forKey:nameKey];
    [targetDic setObject:urlName forKey:urlName];
}

-(id)initWithArray:(NSArray*)listItems andTitle:(NSString*)title{
    self = [super init];
    if(self){
        _listItems = [listItems mutableCopy];
        _naviTitle = title;
        
         self.listNodes = [[NSMutableArray alloc] init];
        
        [self setMenuSections:_listItems];
    }
    return self;
}

- (void)setMenuSections:(NSArray *)menuSections{
    
    for (NSDictionary *sec in menuSections) {
        NSArray  *keys = [sec allKeys];
        
        TreeNde   *node = [TreeNde new];
        if(keys.count == 1)
        {//列表下面还挂有数组
            NSArray *subArays = [sec objectForKey:[sec allKeys][0]];
            NSMutableArray  *subNodes = [NSMutableArray new];
            
            NSString *dicKey = [sec allKeys][0];
            NSString *subKey = [dicKey substringToIndex:2];
            NSString *subName = [dicKey substringFromIndex:2];
            node.objDic = [[NSDictionary alloc] initWithObjectsAndKeys:subName,subKey,nil];
            
            for(NSDictionary *subDic in subArays)
            {
                TreeNde   *subNode = [TreeNde new];
                subNode.parent = node;
                subNode.objDic = [subDic copy];
                [subNodes addObject:subNode];
            }
            node.subNodes =[subNodes copy];
        }
        else
        {
            node.objDic = [sec copy];
        }
        [self.listNodes addObject:node];
    }
    
    [self fillDisplayNode];
    
    [_listTable reloadData];
}

-(void)fillDisplayNode
{
    self.displayNodes = [[NSMutableArray alloc] init];
    for(TreeNde *node in self.listNodes)
    {
        [self.displayNodes addObject:node];
        if(node.isExpanded){
            [self fillSubNode:node];
        }
    }
    
}


-(void)fillSubNode:(TreeNde*)node
{
    if(node.subNodes && node.subNodes.count > 0)
    {
        for(TreeNde *subNode in node.subNodes)
        {
            [self.displayNodes addObject:subNode];
            if(subNode.isExpanded)
            {
                [self fillSubNode:node];
            }
        }
    }
}

-(void)closeSubNode
{
    for(TreeNde *node in self.listNodes)
    {
        node.isExpanded = NO;
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.view.frame = CGRectMake(0, 0, kIPHONE_SCREEN_WIDTH, IPHONE_SCREEN_HEIGHT);
    
    [self.navBar SetNaviBackground:@"bg_top_bar_1.png"];
    [self.navBar setTitle:self.naviTitle withColor:[UIColor whiteColor]];

    [self.navBar setLeftButton:@"btn_back_normal_2.png" andHight:@"btn_back_pressed_2.png"];
    [self.view addSubview:self.navBar];
    
    _listTable = [[UITableView alloc] initWithFrame:CGRectMake(0, kNAVIGATION_BARH, kIPHONE_SCREEN_WIDTH, IPHONE_SCREEN_HEIGHT-kNAVIGATION_BARH) style:UITableViewStylePlain];
    _listTable.delegate = self;
    _listTable.dataSource = self;
    _listTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_listTable];
    
}

-(void)setNaviBarTitle:(NSString *)title{
    [self.navBar setTitle:title withColor:[UIColor whiteColor]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-
#pragma mark - UITableViewDelegate--
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = [NSString stringWithFormat:@"item-%d-%d",(indexPath.section+1),(indexPath.row+1)];
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if(cell == nil)
    {
       TreeNde  *objID = [self.displayNodes objectAtIndex:indexPath.row];
       if(objID.parent == nil && objID.subNodes == nil)
       {
           NSDictionary *itemDic =  objID.objDic;
           
           NSString *keyName = [itemDic allKeys][0];
           id obj = [itemDic objectForKey:keyName];
           if([obj  isKindOfClass:[NSString class]]){
               if([keyName isEqualToString:@"url"]) {
                   keyName = [itemDic allKeys][1];
               }
               NSLog(@"dic key = %@",keyName);
               NSString *titleName = [itemDic objectForKey:keyName];
               NSString  *imgName = [NSString stringWithFormat:@"t_%@.png",keyName];
               cell = [[CustomTableViewCell alloc] initWithIcon:identifier andIcon:imgName andTitle:titleName andDirIcon:E_Dir_Add isSubItem:NO];
               cell.node = objID;
           }
           
       }
       else if(objID.parent == nil && objID.subNodes != nil)
       {
           NSDictionary *subDic = objID.objDic;
           NSString *keyName = [subDic allKeys][0];
           NSString *titleName = [subDic objectForKey:keyName];
           NSString  *imgName = [NSString stringWithFormat:@"t_%@.png",keyName];
           
           BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:imgName];
           if(isExist){
               imgName = @"t_26.png";
           }
           BOOL isExpand = objID.isExpanded ;
           cell = [[CustomTableViewCell alloc] initWithIcon:identifier andIcon:imgName andTitle:titleName andDirIcon:(isExpand ? E_Dir_Add : E_Dir_Arrow) isSubItem:NO];
           cell.node = objID;
       }
       else if(objID.parent != nil && objID.subNodes == nil)
       {
           NSDictionary *itemDic =  objID.objDic;
           NSString *keyName = [itemDic allKeys][0];
           id obj = [itemDic objectForKey:keyName];
           if([obj  isKindOfClass:[NSString class]]){
               if([keyName isEqualToString:@"url"]) {
                   keyName = [itemDic allKeys][1];
               }
               NSLog(@"dic key = %@",keyName);
               NSString *titleName = [itemDic objectForKey:keyName];
               NSString  *imgName = [NSString stringWithFormat:@"t_%@.png",keyName];
               cell = [[CustomTableViewCell alloc] initWithIcon:identifier andIcon:imgName andTitle:titleName andDirIcon:E_Dir_None isSubItem:YES];
               cell.node = objID;
           }
       }
     }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
//    CustomTableViewCell *cell = (CustomTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
//    TreeNde *node = cell.node;
    TreeNde *node = [self.displayNodes objectAtIndex:indexPath.row];
    NSDictionary *linkDic = node.objDic;
    
    if(node.parent == nil && node.subNodes != nil)
    {
//        if(node.isExpanded)
//        {
//           node.isExpanded = !node.isExpanded;
//        }
//        else
//        {
//            [self closeSubNode];
//            node.isExpanded = !node.isExpanded;
//         }
        
         node.isExpanded = !node.isExpanded;
         [self fillDisplayNode];
        
//        if(node.isExpanded)
         [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
//         [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
        
         [tableView reloadData];
    }
    else
    {
        CustomTableViewCell *cell = (CustomTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
        NSString  *mTitle = cell.lablTitle;
        
        WebViewController *webViewCtrl = [[WebViewController alloc] initWithTitle:mTitle];
        [self.navigationController pushViewController:webViewCtrl animated:YES];
        [webViewCtrl openURL:[BUtitle makeURL:[linkDic objectForKey:@"url"]]];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.displayNodes.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TreeNde *node = [self.displayNodes objectAtIndex:indexPath.row];
    if(node.parent == nil && node.subNodes == nil)
    {
        return kTableViewCellH;
    }
    else
    {
        if(node.parent ==nil && node.subNodes != nil && node.subNodes.count > 0)
        {
            return kTableViewCellH;
        }
        return kTableViewSubCellH;
    }
}





@end
