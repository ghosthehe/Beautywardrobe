//
//  GOperation.m
//  GSDWebImage
//
//  Created by dfxgd on 15/9/24.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "GOperation.h"

#import "GDanLi.h"

#import "NSString+Addition.h"

#import "Base64.h"

@implementation GOperation

-(id)initWithUrlString:(NSString*)urlStr image:(UIImageView*)imageView
{
    if (self = [super init])
    {
        self.urlString = urlStr;
        self.imageView = imageView;
    }
    return self;
}

+(id)operationWithUrlString:(NSString*)urlStr imageView:(UIImageView*)imageView
{
    return [[self alloc]initWithUrlString:urlStr image:imageView];
    
}
//init初始化的时候会调用
-(void)main
{
    //下载
    //分线程运行
    NSData *data = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:self.urlString]];
    if (data)
    {
        UIImage *image = [[UIImage alloc]initWithData:data];
        
        if (image)
        {
            [self performSelectorOnMainThread:@selector(reloadImageView:) withObject:image waitUntilDone:YES];
            
            GDanLi *manager = [GDanLi shareGdanli];
            manager.dic = [[NSMutableDictionary alloc]init];
            
            [manager.dic setObject:image forKey:self.urlString];
            NSString *filePath = [NSString getDirectoryPath:@"Documents/cache" withFilePath:self.urlString];
            
            [data writeToFile:filePath atomically:YES];
        }
    }
    
    
}
-(void)reloadImageView:(UIImage*)image
{
    self.imageView.image = image;
    
}
@end
