//
//  MainVC.m
//  Beautywardrobe
//
//  Created by dfxgd on 15/11/3.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "MainVC.h"
#import "MainCell.h"
#import "LoginVC.h"
#import "Setting.h"
@interface MainVC ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    NSMutableArray *_dataArr;
    UIImageView *bgView;
    UIButton *loginBtn;
}
@end

@implementation MainVC

-(void)viewWillAppear:(BOOL)animated
{
    
    _barView.alpha = 1;
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self createTableView];
    
}
-(void)createTableView
{
    [_myTable registerNib:[UINib nibWithNibName:@"MainCell" bundle:nil] forCellReuseIdentifier:@"mainCell"];
    NSArray *arr1 = @[@"全部订单"];
    NSArray *arr2 = [NSArray arrayWithObjects:@"我的收货地址",@"我的优惠卷",@"我的钱包",@"我的美丽币",@"签到中心", nil];
    NSArray *arr3 = [NSArray arrayWithObjects:@"我的宝贝",@"我的主题",@"我的品牌",@"我的专辑",@"我的分享",@"我的关注",@"我的粉丝", nil];
    NSArray *arr4 = [NSArray arrayWithObjects:@"给美丽衣橱打五分", nil];
    NSArray *arr5 = [NSArray arrayWithObjects:@"设置", nil];
    _dataArr = [[NSMutableArray alloc]initWithObjects:arr1,arr2,arr3,arr4,arr5, nil];
    
    bgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 120)];
    bgView.image = [UIImage imageNamed:@"我的bg2.jpg"];
    [self.view addSubview:bgView];
    
    UIImageView *head = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 120)];
    loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(175, 70, 60, 30);
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:loginBtn];
    bgView.userInteractionEnabled = YES;
    head.userInteractionEnabled = YES;
    _myTable.tableHeaderView = head;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int a = _myTable.contentOffset.y;
    if (a < 0 || a == 0)
    {
        bgView.frame = CGRectMake(0, 0, 375, 120 -a);
        loginBtn.frame = CGRectMake(175, 70 - a, 60, 30);
    }
    if (a > 0)
    {
        bgView.frame = CGRectMake(0, - a, 375, 120);
    }
}
-(void)loginBtnClick
{
    LoginVC *vc = [[LoginVC alloc]init];
    vc.title = @"登陆";
    _barView.alpha = 0;
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    if (section == 1)
    {
        return 5;
    }
    if (section == 2)
    {
        return 7;
    }
    else
    {
        return 1;
    }
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
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = _dataArr[0][0];

        }
        else
        {
            MainCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell" forIndexPath:indexPath];
            return cell;

        }
    }
    else
    {
        cell.textLabel.text = _dataArr[indexPath.section][indexPath.row];
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 4)
    {
        Setting *vc = [[Setting alloc]init];
        _barView.alpha = 0;
        self.navigationController.navigationBarHidden = NO;
        [self.navigationController pushViewController:vc animated:YES];
    }
    else
    {
        if ([loginBtn.titleLabel.text isEqualToString:@"登陆"])
        {
            LoginVC *vc = [[LoginVC alloc]init];
            vc.title = @"登陆";
            _barView.alpha = 0;
            self.navigationController.navigationBarHidden = NO;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
@end
