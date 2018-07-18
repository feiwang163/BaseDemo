//
//  WFProgressHUD.h
//  WFFrame
//
//  Created by 王飞 on 17/2/21.
//  Copyright © 2017年 chongqinjialetao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WFProgressHUD : NSObject


/**
 *  显示网络错误 -->（自动消失）
 */
+ (void)showNetworkError;

/**
 *  toast 显示消息，-->（自动消失，消失时间和msg的长短有关）
 *
 *  @param msg 消息
 */
+ (void)showToast:(NSString*)msg;

/**
 *  toast 显示消息
 *
 *  @param msg  消息，-->（参数time秒后消失）
 *  @param time 显示时长，单位s
 */
+ (void)showToast:(NSString*)msg time:(NSTimeInterval)time;

/**
 *  显示loading
 *
 *  @param msg 消息，-->（不会自动消失）
 */
+ (void)showLoading:(NSString*)msg;

/**
 *  显示loading
 *
 *  @param msg  消息，-->（参数time秒后消失）
 *  @param time 显示时长, 单位s
 */
+(void)showLoading:(NSString *)msg time:(NSTimeInterval)time;

/**
 *  隐藏所有浮层，包括loading和文本等
 */
+ (void)hideAllToast;

@end
