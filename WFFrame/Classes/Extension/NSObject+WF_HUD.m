//
//  NSObject+WF_HUD.m
//  WFFrame
//
//  Created by 王飞 on 17/2/21.
//  Copyright © 2017年 chongqinjialetao. All rights reserved.
//

#import "NSObject+WF_HUD.h"
#import "WF_ProgressHUD.h"

@implementation NSObject (WF_HUD)
- (void)showText:(NSString *)aText
{
    [WF_ProgressHUD showWithStatus:aText];
}


- (void)showErrorText:(NSString *)aText
{
    [WF_ProgressHUD showErrorWithStatus:aText];
}

- (void)showSuccessText:(NSString *)aText
{
    [WF_ProgressHUD showSuccessWithStatus:aText];
}

- (void)showLoading
{
    [WF_ProgressHUD show];
    
//    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
//    1.view的背景颜色
//    [SVProgressHUD setBackgroundColor:[UIColor orangeColor]];
}


- (void)dismissLoading
{
    [WF_ProgressHUD dismiss];
}

- (void)showProgress:(NSInteger)progress
{
    [WF_ProgressHUD showProgress:progress/100.0 status:[NSString stringWithFormat:@"%li%%",(long)progress]];
}

- (void)showImage:(UIImage*)image text:(NSString*)aText
{
    [WF_ProgressHUD showImage:image status:aText];
}


@end
