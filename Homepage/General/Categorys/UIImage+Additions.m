//
//  UIImage+Additions.m
//  HYJFIOS
//
//  Created by zhaozq on 15/8/4.
//  Copyright (c) 2015年 HYJF. All rights reserved.
//

#import "UIImage+Additions.h"
#import "ZQUtilsMacro.h"

@implementation UIImage (Additions)
+(UIImage*)imageWithUIColor:(UIColor *)color size:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *transparentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return transparentImage;
}

+ (NSString *)imageNameForCurrentDevice:(NSString *)name
{
    if (name && name.length > 0) {
        if (kDeviceIsiPhone6 || kDeviceIsiPhone6Plus) {
            name = [name stringByAppendingString:@"@3x"];
        }
        else
        {
            name = [name stringByAppendingString:@"@2x"];
        }
    }
    return name;
}

@end
