//
//  View2.m
//  Beautywardrobe
//
//  Created by dfxgd on 15/11/4.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "View2.h"

@implementation View2

-(id)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 120, 50)];
        label.text = @"本周人气TOP8";
        [self addSubview:label];
        for (int i = 0; i < 8; i ++)
        {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(11 + (80 + 11) * (i % 4), 50 + (50 + 10) * (i / 4), 80, 50);
            [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor whiteColor];
            //btn.backgroundColor = [UIColor colorWithRed:arc4random() / 255 / 255.0 green:arc4random() / 255 / 255.0 blue:arc4random() / 255 / 255.0 alpha:1];
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
