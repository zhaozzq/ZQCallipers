//
//  UIColor+ZQPlus.m
//  winekar24th
//
//  Created by zhaozq on 15/7/1.
//  Copyright (c) 2015年 winekar. All rights reserved.
//

#import "UIColor+ZQPlus.h"

@implementation UIColor (ZQPlus)

#pragma mark - Color from Hex
+ (instancetype)colorWithHexString:(NSString *)hexString
{
    return [UIColor colorWithHexString:hexString andAlpha:1.0];
}

+ (instancetype)colorWithHexString:(NSString *)hexString andAlpha:(CGFloat)alpha
{
    if (!hexString || hexString.length == 0) {
        return nil;
    }
    unsigned rgbValue = 0;
    hexString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    if (![scanner scanHexInt:&rgbValue]) return nil;
    return [UIColor colorWithRed:((rgbValue>>16)&0xFF)/255.0f green:((rgbValue>>8)&0xFF)/255.0f blue:(rgbValue&0xFF)/255.0f alpha:alpha];
}

@end
