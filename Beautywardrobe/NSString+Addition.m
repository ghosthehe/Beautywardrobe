//
//  NSString+Addition.m
//  GSDWebImage
//
//  Created by dfxgd on 15/9/24.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "NSString+Addition.h"

@implementation NSString (Addition)

-(NSString*)getFilePath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:self];
}

+(NSString*)getDirectoryPath:(NSString*)dPath withFilePath:(NSString*)filePath
{
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *directory = [dPath getFilePath];
    if (![fm fileExistsAtPath:directory])
    {
        [fm createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *_filePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"%@/%@",dPath,filePath]];
    //NSLog(@"%@",_filePath);
    return _filePath;
}
@end
