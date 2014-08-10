//
//  NDataModel.h
//  smartmedicine
//
//  Created by kmgao on 14-1-8.
//  Copyright (c) 2014年 kmgao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NDataModel : NSObject

@property(nonatomic,retain) NSMutableDictionary *dataDic;
@property(nonatomic,retain) NSMutableArray     *foundArray;
@property(nonatomic,retain) NSMutableArray     *clinicalArray;
@property(nonatomic,retain) NSMutableArray     *clinicalSkillArray;
@property(nonatomic,retain) NSMutableArray     *diseaseArray;
@property(nonatomic,retain) NSMutableArray     *handleBookArray;
@end
