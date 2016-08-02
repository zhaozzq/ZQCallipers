//
//  ZQUtilsMacro.h
//  QDNSHNEW
//
//  Created by zhaozq on 15/2/18.
//  Copyright © 2015年 PY. All rights reserved.
//

#ifndef ZQUtilsMacro_h
#define ZQUtilsMacro_h

#define OSVersionValue  [[[UIDevice currentDevice]systemVersion] floatValue]
#define AtLeastIOS7 (OSVersionValue >= 7.0)
#define AtLeastIOS8 (OSVersionValue >= 8.0)
#define AtLeastIOS9 (OSVersionValue >= 9.0)

#define kScreenHeight     [UIScreen mainScreen].bounds.size.height
#define kScreenWidth      [UIScreen mainScreen].bounds.size.width
#define kScreenBounds     [UIScreen mainScreen].bounds

#define kDeviceIsiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDeviceIsiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDeviceIsiPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDeviceIsiPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define ZQValueFor6P6Default(for6p,for6,default) kDeviceIsiPhone6Plus ? for6p : (kDeviceIsiPhone6 ? for6 : default)

#define ZQValueForD6PD6D5D4(for6p,for6,for5,default) kDeviceIsiPhone6Plus ? for6p : (kDeviceIsiPhone6 ? for6 : (kDeviceIsiPhone5 ? for5 : default))

#endif /* ZQUtilsMacro_h */
