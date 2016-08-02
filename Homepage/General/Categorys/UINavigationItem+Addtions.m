//
//  UINavigationItem+Addtions.m
//  HYJFIOS
//
//  Created by zhaozq on 15/8/5.
//  Copyright (c) 2015年 HYJF. All rights reserved.
//

#import "UINavigationItem+Addtions.h"
#import "ZQUtilsMacro.h"

@implementation UINavigationItem (Addtions)
+ (UILabel *)titleViewForTitle:(NSString *)title {
    UILabel *titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    //titleView.backgroundColor =[UIColor greenColor];
    titleView.center = CGPointMake(kScreenWidth/2, 22);
    titleView.font = [UIFont systemFontOfSize:18];
    titleView.textAlignment = NSTextAlignmentCenter;
    titleView.backgroundColor = [UIColor clearColor];
    titleView.textColor = [UIColor whiteColor];
    titleView.text = title;
    return titleView;
}


@end
