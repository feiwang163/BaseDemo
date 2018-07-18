//
//  UIColor+Ex.h
//  WFFrame
//
//  Created by 王飞 on 17/2/21.
//  Copyright © 2017年 chongqinjialetao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Ex)

- (BOOL)isRGBAWhiteColor;

+ (UIColor *)colorWithRGBHexString:(NSString *)rgbString;

+ (UIColor *)colorWithRGBHex: (unsigned int)hex;

+ (UIColor *)colorWithARGBHexString:(NSString *)argbString;

+ (UIColor *)colorWithARGBHex: (unsigned int)hex;

+ (UIColor *)colorWithHexString2: (NSString *)hexString;

- (UIImage *)pureColorImage;

- (UIImage *)pureColorImageWithSize:(CGSize)imageSize;

- (BOOL)isEqualToColor:(UIColor*)color;

@end
