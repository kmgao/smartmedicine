//
//  NDataModel.m
//  smartmedicine
//
//  Created by kmgao on 14-1-8.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import "NDataModel.h"

#define kFoundKey     @"基础教程"
#define kClinicalKey  @"临床教程"
#define kClinicalSkillKey  @"临床技能"
#define kDiseaseKey  @"疾病解析"
#define kHandleBookKey  @"临床手册"
@implementation NDataModel

@synthesize dataDic = _dataDic;
@synthesize foundArray = _foundArray;
@synthesize clinicalArray = _clinicalArray;
@synthesize clinicalSkillArray = _clinicalSkillArray;
@synthesize diseaseArray = _diseaseArray;
@synthesize handleBookArray = _handleBookArray;


-(id) init{
    self = [super init];
    if(self){
        NSString  *datPath = [[NSBundle mainBundle] pathForResource:@"xmlDic" ofType:@"plist"];
        NSLog(@"dictionary file Path = %@",datPath);
        _dataDic = [[NSMutableDictionary alloc] initWithContentsOfFile:datPath];
//        NSLog(@"dictionary = %@",_dataDic);
        
        NSObject *obj = [_dataDic objectForKey:kFoundKey];
        
        if([obj isKindOfClass:[NSArray class]]){
            NSArray *array =(NSArray*)[_dataDic objectForKey:kFoundKey];
            _foundArray = [array mutableCopy];
        }
        
        obj = [_dataDic objectForKey:kClinicalKey];
        if([obj isKindOfClass:[NSArray class]]){
            NSArray *array =(NSArray*)[_dataDic objectForKey:kClinicalKey];
            _clinicalArray = [array mutableCopy];
        }
        
        obj = [_dataDic objectForKey:kClinicalSkillKey];
        if([obj isKindOfClass:[NSArray class]]){
            NSArray *array =(NSArray*)[_dataDic objectForKey:kClinicalSkillKey];
            _clinicalSkillArray = [array mutableCopy];
        }
        
        obj = [_dataDic objectForKey:kDiseaseKey];
        if([obj isKindOfClass:[NSArray class]]){
            NSArray *array =(NSArray*)[_dataDic objectForKey:kDiseaseKey];
            _diseaseArray = [array mutableCopy];
        }
        
        obj = [_dataDic objectForKey:kHandleBookKey];
        if([obj isKindOfClass:[NSArray class]]){
            NSArray *array =(NSArray*)[_dataDic objectForKey:kHandleBookKey];
            _handleBookArray = [array mutableCopy];
        } 
        
    }
    return self;
}

@end
