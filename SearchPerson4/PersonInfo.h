//
//  PersonInfo.h
//  SearchPerson4
//
//  Created by DolBy on 13-5-6.
//  Copyright (c) 2013年 Duxinfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonInfo : NSObject

@property(nonatomic,copy) NSString *source;
@property(nonatomic,strong) NSURL *url;
@property(nonatomic,copy) NSString *name;
@property(nonatomic) int age;
@property(nonatomic,copy) NSString *sex;
@property(nonatomic,copy) NSString *des;
@property(nonatomic,copy) NSString *phone;
@property(nonatomic,copy) NSString *remarks;
@property(nonatomic) int found;  //是否已找到 1表示已近找到；0表示尚未找到
@property(nonatomic) int input_time;
@property(nonatomic,copy) NSString *weibotext;
@property(nonatomic,copy) NSString *lastmod;
@property(nonatomic,copy) NSString *update_time;
@end
