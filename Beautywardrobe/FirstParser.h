//
//  FirstParser.h
//  Beautywardrobe
//
//  Created by dfxgd on 15/11/6.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstParser : NSObject

@property(nonatomic,copy)NSString *background_pic_url;
@property(nonatomic,copy)NSString *en_taobao_title;
@property(nonatomic,copy)NSString *taobao_cid;
@property(nonatomic,copy)NSString *taobao_title;
@property(nonatomic,copy)NSString *method;
+(FirstParser*)parserDataWithDic:(NSDictionary *)dic;
@end
