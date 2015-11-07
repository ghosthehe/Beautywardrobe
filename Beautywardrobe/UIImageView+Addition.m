//
//  UIImageView+Addition.m
//  GSDWebImage
//
//  Created by dfxgd on 15/9/24.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "UIImageView+Addition.h"
#import "GDanLi.h"

@implementation UIImageView (Addition)

//下载图片的方法
-(void)setGImageUrlWithString:(NSString*)urlStr
{
    //实现SDWebImage的缓存原理 必须设置一个管理者(全局唯一性:只要一创建出来 后期就不会再创建了)
    GDanLi *manager = [GDanLi shareGdanli];
    
    UIImage *image = [manager searchImageInDic:urlStr];
    if (image)
    {
        self.image = image;
    }
    
    NSData *data = [manager searchImageInFilePath:urlStr];
    image = [UIImage imageWithData:data];
    if (image)
    {
        GDanLi *manager = [GDanLi shareGdanli];
        [manager.dic setObject:image forKey:urlStr];
        self.image = image;
    }
    
    [manager downloadImageWithImageUrl:urlStr imageView:self];
}

-(void)setGImageUrlWithString:(NSString*)urlStr image:(UIImage*)ima
{
    self.image = ima;
    [self setGImageUrlWithString:urlStr];
    
    //抢资源
    //资源锁NSLocal
    //同步块@synchronized(self)
}
@end
