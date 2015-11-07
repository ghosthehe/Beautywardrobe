//
//  FirstRequest.m
//  Beautywardrobe
//
//  Created by dfxgd on 15/11/6.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "FirstRequest.h"
#import "AFNetworking.h"
static FirstRequest *_fre;
@implementation FirstRequest

+(FirstRequest*)shareFirstRequest
{
    @synchronized(self)
    {
        if (_fre == nil)
        {
            _fre = [[FirstRequest alloc]init];
        }
    }
    return _fre;
}

#pragma mark --- 5张图片
-(void)get6ImageUrlWithUrlString:(NSString*)str
{
    __weak FirstRequest *fre = self;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        
        fre.sixImageBlock(responseObject);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"请求失败");
    }];
}
#pragma mark --- 8个按钮
-(void)get8BtnImageUrlWithUrlString:(NSString *)str
{
    __weak FirstRequest *fre = self;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:str parameters: nil success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSDictionary *dic = [responseObject objectForKey:@"data"];
         fre.eightBtnImageBlock(dic);
         
     }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"请求失败");
         
     }];
}
@end
