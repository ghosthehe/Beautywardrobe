//
//  GDanLi.m
//  GSDWebImage
//
//  Created by dfxgd on 15/9/24.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "GDanLi.h"

#import "GOperation.h"

#import "NSString+Addition.h"

#import "Base64.h"


static GDanLi *manager = nil;

@implementation GDanLi

//获取管理者对象
+(id)shareGdanli
{
    @synchronized(self)
    {
        if (manager == nil)
        {
            manager = [[self alloc]init];
        }
    }
    return manager;
}
+(id)alloc
{
    @synchronized(self)
    {
        if (nil == manager)
        {
            manager = [super alloc];
        }
    }
    return manager;
}
-(id)init
{
    @synchronized(self)
    {
        if (self == [super init])
        {
            //NSLog(@"初始化");
            _oq = [[NSOperationQueue alloc]init];
            //设置最大并发量,最大能同时控制几个operation
            _oq.maxConcurrentOperationCount = 2;
        
        }
    }
    return manager;
}
//实现下载
-(void)downloadImageWithImageUrl:(NSString*)urlStr imageView:(UIImageView*)aImage
{
    //要在分线程里面去下载
    //线程 需要放到 NSOperationQueue 里面去
    //NSOperationQueue 线程管理者
    //NSOperation
    GOperation *operation = [GOperation     operationWithUrlString:urlStr imageView:aImage];
    
    [_oq addOperation:operation];
}
-(UIImage*)searchImageInDic:(NSString*)url
{
    UIImage *image = [_dic objectForKey:url];
    return image;
}
-(NSData*)searchImageInFilePath:(NSString*)url
{
    NSData *data = [[NSData alloc]initWithContentsOfFile:[NSString getDirectoryPath:@"Documents/cache" withFilePath:[url base64EncodedString]]];
    return data;
}
@end
