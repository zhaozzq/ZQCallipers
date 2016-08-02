//
//  UIImage+Additions.h
//  HYJFIOS
//
//  Created by zhaozq on 15/8/4.
//  Copyright (c) 2015年 HYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Additions)
+ (UIImage *)imageWithUIColor:(UIColor *)color size:(CGSize )size;
+ (NSString *)imageNameForCurrentDevice:(NSString *)name;
@end
