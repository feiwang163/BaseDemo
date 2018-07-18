//
//  BaseViewController.h
//  WFFrame
//
//  Created by 王飞 on 17/2/21.
//  Copyright © 2017年 chongqinjialetao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseViewControllerDataSource <NSObject>

@optional
//设置标题
-(NSMutableAttributedString*)setTitle;
//设置导航左边按钮
-(UIButton*)set_leftButton;
//设置导航右边按钮
-(UIButton*)set_rightButton;
//设置导航背景颜色
-(UIColor*)set_colorBackground;
//设置导航背景图
-(UIImage*)navBackgroundImage;
//是否隐藏导航下面的黑线
-(BOOL)hideNavigationBottomLine;
//设置导航左边按钮图片(系统)
-(UIImage*)set_leftBarButtonItemWithImage;
//设置导航右边按钮图片(系统)
-(UIImage*)set_rightBarButtonItemWithImage;

@end

@protocol BaseViewControllerDelegate <NSObject>

@optional
-(void)left_button_event:(UIButton*)sender;
-(void)right_button_event:(UIButton*)sender;
-(void)title_click_event:(UIView*)sender;
@end

@interface BaseViewController : UIViewController<BaseViewControllerDelegate,BaseViewControllerDataSource>
//改变导航Y值
-(void)changeNavigationBarTranslationY:(CGFloat)translationY;
//设置导航标题
-(void)set_Title:(NSMutableAttributedString *)title;

@end
