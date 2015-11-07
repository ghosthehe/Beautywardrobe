//
//  UIImageView+Addition.h
//  GSDWebImage
//
//  Created by dfxgd on 15/9/24.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Addition)

//用来构建图片管理类(3级下载)对象
-(void)setGImageUrlWithString:(NSString*)urlStr;

//1参 图片的url地址  2参 是url图片没显示出来签要显示的备选图
-(void)setGImageUrlWithString:(NSString*)urlStr image:(UIImage*)ima;
@end
