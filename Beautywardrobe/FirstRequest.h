//
//  FirstRequest.h
//  Beautywardrobe
//
//  Created by dfxgd on 15/11/6.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FirstRequest : NSObject

@property(nonatomic,strong)NSDictionary *dic;

@property(nonatomic,copy)void(^sixImageBlock)(NSDictionary *);
@property(nonatomic,copy)void(^eightBtnImageBlock)(NSDictionary *);

+(FirstRequest*)shareFirstRequest;
#pragma mark --- 5张图片
-(void)get6ImageUrlWithUrlString:(NSString*)str;

#pragma mark --- 8个按钮
-(void)get8BtnImageUrlWithUrlString:(NSString *)str;
@end
