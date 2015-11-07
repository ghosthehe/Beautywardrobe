//
//  NSString+Addition.h
//  GSDWebImage
//
//  Created by dfxgd on 15/9/24.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Addition)

-(NSString*)getFilePath;

+(NSString*)getDirectoryPath:(NSString*)dPath withFilePath:(NSString*)filePath;
@end
