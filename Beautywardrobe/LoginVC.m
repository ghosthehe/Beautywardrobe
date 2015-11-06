//
//  LoginVC.m
//  Beautywardrobe1
//
//  Created by dfxgd on 15/11/3.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "LoginVC.h"
#import "RegistVC.h"
#import "ForgotPSWVC.h"
@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    
}

-(IBAction)loginBtnClick:(id)sender
{
    
}
-(IBAction)registBtnClick:(id)sender
{
    RegistVC * vc = [[RegistVC alloc]init];
    vc.title = @"注册";
    [self.navigationController pushViewController:vc animated:YES];
}
-(IBAction)forgotPSW:(id)sender
{
    ForgotPSWVC *vc = [[ForgotPSWVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
