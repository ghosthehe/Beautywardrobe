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
        self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 120, 50)];
        label.text = @"本周人气TOP8";
        [self addSubview:label];
        
        FirstRequest *fre = [FirstRequest shareFirstRequest];
        [fre get8BtnImageUrlWithUrlString:@"http://api.yuike.com/beautymall/api/1.0/category/ranking_list.php?yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&yk_pid=1&yk_cbv=2.8.4.2"];
        fre.eightBtnImageBlock = ^(NSDictionary *dic)
        {
            NSLog(@"%@",dic);
            NSArray *arr = [dic objectForKey:@"categories"];
            
            for (int i = 0; i < arr.count; i ++)
            {
                NSDictionary *contentDic = arr[i];
                FirstParser *parser = [FirstParser parserDataWithDic:contentDic];
                
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(11 + ((mainScreen_width - 55)/4 + 11) * (i % 4), 50 + (50 + 10) * (i / 4), (mainScreen_width - 55) / 4, 50);
                btn.titleLabel.font = [UIFont systemFontOfSize:13];
                btn.titleLabel.numberOfLines = 0;
                [btn setTitle:[NSString stringWithFormat:@" %@\n%@",parser.taobao_title,parser.en_taobao_title] forState:UIControlStateNormal];
                [btn setBackgroundImage:[self getImage:[NSURL URLWithString:parser.background_pic_url]] forState:UIControlStateNormal];
                [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                btn.tag = i + 1;
                [self addSubview:btn];
            }
        };
      
    }
    return self;
}
-(UIImage*)getImage:(NSURL*)url
{
    NSData *data = [[NSData alloc]initWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc]initWithData:data];
    return image;
}
-(void)btnClick:(UIButton*)btn
{
    switch (btn.tag)
    {
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        case 7:
            
            break;
        case 8:
            
            break;
        default:
            break;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
