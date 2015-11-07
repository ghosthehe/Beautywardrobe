//
//  GOperation.h
//  GSDWebImage
//
//  Created by dfxgd on 15/9/24.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface GOperation : NSOperation

@property(nonatomic,copy)NSString *urlString;
@property(nonatomic,strong)UIImageView *imageView;
//拓展的方法 目的为了接数据
+(id)operationWithUrlString:(NSString*)urlStr imageView:(UIImageView*)imageView;
-(id)initWithUrlString:(NSString*)urlStr image:(UIImageView*)imageView;
//分线程方法为main方法
@end
