//
//  GDanLi.h
//  GSDWebImage
//
//  Created by dfxgd on 15/9/24.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GDanLi : NSObject
{
    NSOperationQueue *_oq;
}

@property(nonatomic,retain)NSMutableDictionary *dic;
//获取单例对象
+(id)shareGdanli;

//下载 从本地下载 从内存中查找
//下载
-(void)downloadImageWithImageUrl:(NSString*)urlStr imageView:(UIImageView*)aImage;

-(UIImage*)searchImageInDic:(NSString*)url;
-(NSData*)searchImageInFilePath:(NSString*)url;
@end
