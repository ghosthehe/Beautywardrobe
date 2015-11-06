//
//  Setting.m
//  Beautywardrobe1
//
//  Created by dfxgd on 15/11/4.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "Setting.h"
//#import "SDWebImage/SDImageCache.h"
@interface Setting ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArr;
}

@end

@implementation Setting

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *arr1 = @[@"新人有利"];
    NSArray *arr2 = @[@"联系美丽衣橱",@"常见问题解答"];
    NSArray *arr3 = @[@"清楚本地图片缓存",@"关于"];
    _dataArr = [NSMutableArray arrayWithObjects:arr1,arr2,arr3, nil];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    if (section == 1)
    {
        return 2;
    }
    if (section == 2)
    {
        return 2;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    cell.textLabel.text = _dataArr[indexPath.section][indexPath.row];
//    if (indexPath.section == 2)
//    {
//        if (indexPath.row == 0)
//        {
//            NSString *str = _dataArr[indexPath.section][indexPath.row];
//            long long size = [[SDImageCache sharedImageCache]getSize];
//            double m = size / 1024.00 / 1024.00;
//            NSString *text = [NSString stringWithFormat:@"%@  %0.2f",str,m];
//            cell.textLabel.text = text;
//        }
//    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 2)
//    {
//        if (indexPath.section == 0)
//        {
//            [[SDImageCache sharedImageCache]clearDisk];
//            [_myTable reloadData];
//        }
//    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
