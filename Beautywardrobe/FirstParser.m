//
//  FirstParser.m
//  Beautywardrobe
//
//  Created by dfxgd on 15/11/6.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "FirstParser.h"

@implementation FirstParser
+(FirstParser*)parserDataWithDic:(NSDictionary *)dic
{
    FirstParser *parser = [[FirstParser alloc]init];

    [parser setValuesForKeysWithDictionary:dic];
    
    return parser;
}
@end
