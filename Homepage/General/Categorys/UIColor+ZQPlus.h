//
//  UIColor+ZQPlus.h
//  winekar24th
//
//  Created by zhaozq on 15/7/1.
//  Copyright (c) 2015年 winekar. All rights reserved.
//

#import <UIKit/UIKit.h>

//RGB ∈ [0,255]
#define ZQColorWithRGB(R,G,B)     [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f]
//RGB ∈ [0,255] A ∈ [0,1]
#define ZQColorWithRGBA(R,G,B,A)  [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]
//@param hex looks like 0xFF0000 or 0XFF0000
#define ZQColorWithHex(hex)       [UIColor colorWithRed:((hex>>16)&0xFF)/255.0f green:((hex>>8)&0xFF)/255.0f blue:(hex&0xFF)/255.0f alpha:1.0f];

//@param hexString looks like @"0xFF0000" 、@"0XFF0000" 、@"FF0000" or @"#FF0000"
#define ZQColorWithHexString(hexString) [UIColor colorWithHexString: hexString]
//@param hexString looks like @"0xFF0000" 、@"0XFF0000" 、@"FF0000" or @"#FF0000"
#define ZQColorWithHexStringAndAlpha(hexString,alpha) [UIColor colorWithHexString: hexString andAlpha: alpha]

@interface UIColor (ZQPlus)
/**
 Creates a Color from a Hex representation string
 @param hexString   Hex string that looks like @"#FF0000" 、@"0xFF0000"or @"FF0000"
 @return    Color
 */
+ (instancetype)colorWithHexString:(NSString *)hexString;
+ (instancetype)colorWithHexString:(NSString *)hexString andAlpha:(CGFloat)alpha;
@end
