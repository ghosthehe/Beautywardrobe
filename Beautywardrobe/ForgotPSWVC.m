//
//  ForgotPSWVC.m
//  Beautywardrobe1
//
//  Created by dfxgd on 15/11/4.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ForgotPSWVC.h"
#import "SMS_SDK/SMS_SDK.framework/Headers/SMSSDK.h"
@interface ForgotPSWVC ()

@end

@implementation ForgotPSWVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


-(IBAction)retaintestAndVerify:(id)sender
{
    //这个参数可以选择是通过发送验证码还是语言来获取验证码
    //自定义短信模板标识
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS
                            phoneNumber:userTF.text zone:@"86"customIdentifier:nil
                                 result:^(NSError *error)
     {
         if (!error)
         {
             NSLog(@"block 获取验证码成功");
             
         }
         else
         {
             UIAlertView* alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"codesenderrtitle", nil) message:[NSString stringWithFormat:@"%@",[error.userInfo objectForKey:@"getVerificationCode"]]
                                                            delegate:self cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                   otherButtonTitles:nil, nil];
             [alert show];
             
         }
         
     }];
}
-(IBAction)registBtnClick:(id)sender
{
    //传获取到的区号
    [SMSSDK  commitVerificationCode:testAndVerifyTF.text
                        phoneNumber:userTF.text zone:@"86" result:^(NSError *error)
     {
         if (!error)
         {
             NSLog(@"验证成功");
             
         }
         else
         {
             NSLog(@"验证失败");
         }
         
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
