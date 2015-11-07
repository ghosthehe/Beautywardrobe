//
//  View1.m
//  Beautywardrobe
//
//  Created by dfxgd on 15/11/4.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "View1.h"
#import "AllHeader.pch"
@implementation View1

-(id)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        NSArray *arr = [[NSArray alloc]initWithObjects:@"签到",@"抽奖",@"热门", nil];
        for (int i = 0; i < 3; i ++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake((100 + (mainScreen_width - 300)/2) * i, 0, 100, 60);
            [btn setTitle:arr[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i + 1;
            [self addSubview:btn];
        }
    }
    return self;
}

-(void)btnClick:(UIButton*)btn
{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
