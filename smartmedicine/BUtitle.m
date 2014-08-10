//
//  BUtitle.m
//  smartmedicine
//
//  Created by kmgao on 13-12-29.
//  Copyright (c) 2013年 kmgao. All rights reserved.
//

#import "BUtitle.h"
#import "UIImage+Load.h"

@interface LineItem : NSObject

@property(nonatomic,copy) NSString  *title;
@property(nonatomic,copy) NSString  *titleType;
@property(nonatomic,copy) NSString  *url;

@end

@implementation LineItem

@synthesize title,titleType,url;

@end

@implementation BUtitle


static BUtitle *_instance = nil;
+(BUtitle*)getInstance
{
    if(_instance == nil){
        _instance = [[BUtitle alloc] init];
    }
    return _instance;
}


+(UIImage*)loadImage:(NSString*)imageName
{
   return [UIImage LoadImage:imageName];
}


+(NSURL*)makeURL:(NSString*)path{
    if(path == nil) return nil;
    NSString *webURL = [NSString stringWithFormat:@"http://www.hxyiyo.com/yiyoweb/%@",path];
    NSURL *mURL = [[NSURL alloc] initWithString:webURL];
    return mURL;
}

-(void)startRead{
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSString *resPath = [bundle pathForResource:@"category" ofType:@"txt"];
    NSLog(@"path = %@",resPath);
    
    NSFileManager  *fileMrg = [NSFileManager defaultManager];
    if([fileMrg fileExistsAtPath:resPath]){
        
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:resPath];
        NSData *fileDat = [fileHandle readDataToEndOfFile];
//        NSString *contentStr = [[NSString alloc] initWithData:fileDat encoding:NSUTF8StringEncoding];
        //        NSLog(@"content String = %@",contentStr);
        
        NSMutableArray *lines = [[NSMutableArray alloc] initWithCapacity:100];
        
        const Byte *dptr = (const Byte*)[fileDat bytes];
        const Byte *sptr = dptr;
        const Byte *eptr = dptr;
        int pos = 0 ;
        int len = 0;
        int dataLen = [fileDat length];
        while (pos < dataLen) {
            if((*eptr) == 0xA){//line break
                
                len = eptr - sptr;
                
                Byte *chunk = (Byte*)malloc(len);
                memset(chunk, 0, len);
                memcpy(chunk, sptr, len);
                
                NSData  *mData = [[NSData alloc] initWithBytes:chunk length:len];
                [lines addObject:mData];
                free(chunk);
                
                sptr = eptr+1;
                pos += len + 1;
            }
            eptr ++;
        }
        
        NSMutableArray  *lineArray = [[NSMutableArray alloc] initWithCapacity:100];
        for(int i = 0 ; i < lines.count ;i ++)
        {
            NSData  *data = lines[i];
            NSString *subString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            if([subString isEqualToString:@""]) continue;
            
            LineItem *item = [self HandleSingleLine:subString];
            if(item != nil)
                [lineArray addObject:item];
        }
        
        NSMutableDictionary  *dataDic = [NSMutableDictionary dictionaryWithCapacity:100];
        NSMutableArray  *subArray = nil;
        
        for(int j = 0 ; j < lineArray.count ;j++){
            
            LineItem *item = lineArray[j];
            
           if ([item.title isEqualToString:@"基础教程"]) {
               static BOOL isFirst = YES;
               if(isFirst){
                   isFirst = NO;
                   subArray = [[NSMutableArray alloc] init];
                   [dataDic setObject:subArray forKey:item.title];
               }
           }
           else if([item.title isEqualToString:@"临床教程"]){
               static BOOL isFirst = YES;
               if(isFirst){
                   isFirst = NO;
                   subArray = [[NSMutableArray alloc] init];
                   [dataDic setObject:subArray forKey:item.title];
               }
           }
           else if([item.title isEqualToString:@"临床技能"]){
               static BOOL isFirst = YES;
               if(isFirst){
                   isFirst = NO;
                   subArray = [[NSMutableArray alloc] init];
                   [dataDic setObject:subArray forKey:item.title];
               }
            }
            else if([item.title isEqualToString:@"临床手册"]){
               static BOOL isFirst = YES;
               if(isFirst){
                   isFirst = NO;
                   subArray = [[NSMutableArray alloc] init];
                   [dataDic setObject:subArray forKey:item.title];
               }
           }
            else if([item.title isEqualToString:@"疾病解析"]){
                static BOOL isFirst = YES;
                if(isFirst){
                    isFirst = NO;
                    subArray = [[NSMutableArray alloc] init];
                    [dataDic setObject:subArray forKey:item.title];
                }
            }
            
            NSString *str2 = nil;
            
            if(item.titleType.length >= 2)
            {
                str2 = [item.titleType substringToIndex:2];
            }
            
            if ([item.title isEqualToString:@"基础教程"]) {
                
                if([str2 isEqualToString:@"01"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"02"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"03"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"04"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"05"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"06"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"07"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"08"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"09"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"10"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"11"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"12"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"13"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                
            }
            else if ([item.title isEqualToString:@"临床教程"]) {
                
                if([str2 isEqualToString:@"01"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"02"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"03"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"04"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"05"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"06"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"07"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"08"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                
                if([str2 isEqualToString:@"09"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"10"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"11"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"12"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"13"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"14"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
            }
            else if ([item.title isEqualToString:@"临床技能"]) {
                if([str2 isEqualToString:@"01"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"02"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"03"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"04"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"05"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"06"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"07"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"08"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"09"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"10"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
                if([str2 isEqualToString:@"11"]){
                    static BOOL isNumFirst = YES;
                    [self HandleFirstNumberString:subArray andTile:item.titleType andURL:item.url isFirst:isNumFirst];
                    isNumFirst = NO;
                }
            }
            else if([item.title isEqualToString:@"临床手册"]){
                NSMutableDictionary *subDic = [NSMutableDictionary dictionary];
                [subDic setObject:item.url forKey:item.titleType];
                [subArray addObject:subDic];
            }
            else if([item.title isEqualToString:@"疾病解析"]){
                NSMutableDictionary *subDic = [NSMutableDictionary dictionary];
                [subDic setObject:item.url forKey:item.titleType];
                [subArray addObject:subDic];
            }
        }
        
        NSString *savePath = NSHomeDirectory();
        NSString *saveName = [savePath stringByAppendingPathComponent:@"Documents/xmlDic.plist"];
//        NSLog(@"the save file path = %@",saveName);
        [dataDic writeToFile:saveName atomically:YES];
        
        NSLog(@"the save file path = %@",dataDic);
        
    }
}

static NSMutableArray *numArr = nil;
static NSMutableArray *secondSubArr = nil;
static NSString     *preKey = nil;
-(void)HandleFirstNumberString:(NSMutableArray*)array andTile:(NSString*)title andURL:(NSString*)subURL isFirst:(BOOL)isFirst
{
    NSString *str2 = nil;
    if(title.length > 2)
    {
        str2 = [title substringToIndex:2];
        if(isFirst){
            numArr= [[NSMutableArray alloc]init];
            NSMutableDictionary *subDic = [NSMutableDictionary dictionary];
            [subDic setObject:numArr forKey:str2];
            [array addObject:subDic];
            
            secondSubArr = nil;
        }
        
        const char *cptr = [title cStringUsingEncoding:NSUTF8StringEncoding];
        int spCharNum[4]={0};
        int index = 0;
        int ii = 0;
        while ((*cptr++)) {
            index++;
            if(*cptr == '/'){
                spCharNum[ii++] = index;
            }
        }
        
        if(ii <= 1)
        {
            NSMutableDictionary *gSecDic= [[NSMutableDictionary alloc] init];
            [numArr addObject:gSecDic];
            
            NSString *secSub = [title substringFromIndex:str2.length+1];
            str2 = [secSub substringToIndex:2];
            NSString *titleCon = [secSub substringFromIndex:str2.length];
            [gSecDic setObject:titleCon forKey:str2];
            
            [gSecDic setObject:subURL forKey:@"url"];
            
             secondSubArr = nil;
        }
        else if(ii >= 2){//两个分割符号左右
            
            NSString *lastString = [title substringFromIndex:3];
            NSRange lastPos = [lastString rangeOfString:@"/"];

            NSString *subKey = [lastString substringWithRange:NSMakeRange(0, lastPos.location)];
            NSLog(@"last subKey = %@",subKey);
            
            if(secondSubArr == nil) {
                NSMutableDictionary *gSecDic= [[NSMutableDictionary alloc] init];
                [numArr addObject:gSecDic];
                
                secondSubArr = [[NSMutableArray alloc]init];
                [gSecDic setObject:secondSubArr forKey:subKey];
            }
            else if(![subKey isEqualToString:preKey]){
                NSMutableDictionary *gSecDic= [[NSMutableDictionary alloc] init];
                [numArr addObject:gSecDic];
                
                secondSubArr = [[NSMutableArray alloc]init];
                [gSecDic setObject:secondSubArr forKey:subKey];
            }
            
            preKey = subKey;
            NSString *thirdStr = [lastString substringFromIndex:lastPos.location+1];
            subKey = [thirdStr substringToIndex:2];
            NSMutableDictionary *subDic = [[NSMutableDictionary alloc] init];
            [subDic setObject:[thirdStr substringFromIndex:2] forKey:subKey];
            [subDic setObject:subURL forKey:@"url"];
            
            [secondSubArr addObject:subDic];
        }
    }
    else
    {//只有一个字典
        NSMutableDictionary *subDic = [NSMutableDictionary dictionary];
        [subDic setObject:subURL forKey:title];
        [array addObject:subDic];
    }
  
 
}


-(LineItem*)HandleSingleLine:(NSString*)lineString{
    
    if(nil == lineString) return nil;
    
    LineItem *item = [[LineItem alloc] init];
    
    NSRange  first = [lineString rangeOfString:@" "];
    NSString *firstStr = [lineString substringWithRange:NSMakeRange(0, first.location)];
    item.title = firstStr;
    
//    NSUInteger secondLen = lineString.length - first.location;
    
    NSString *tmpStr = [lineString substringFromIndex:first.location];
    //    NSLog(@"tempt String = %@",tmpStr);
    
    const char *charPtr = [tmpStr cStringUsingEncoding:NSUTF8StringEncoding];
    int skipos = 0;
    while((*charPtr++) == 0x20) skipos ++;
    tmpStr = [tmpStr substringFromIndex:skipos];
    //    NSLog(@"second string = %@",tmpStr);
    
    NSRange  second = [tmpStr rangeOfString:@" "];
    NSString *secondStr = [tmpStr substringWithRange:NSMakeRange(0, second.location)];
    item.titleType = secondStr;
    //    NSLog(@"substring second string = %@",secondStr);
    
    
    tmpStr = [tmpStr substringFromIndex:second.location];
    const char *charPtr1 = [tmpStr cStringUsingEncoding:NSUTF8StringEncoding];
    skipos = 0;
    while((*charPtr1++) == 0x20) skipos ++;
    
    NSString  *thirdStr = [tmpStr substringFromIndex:skipos];
    //    NSLog(@"sub string third string = %@",thirdStr);
    item.url = thirdStr;
    
//    NSLog(@"first=%@ ; second=%@ ; third=%@",firstStr,secondStr,thirdStr);
    
    
    
    return item;
    
}




@end
