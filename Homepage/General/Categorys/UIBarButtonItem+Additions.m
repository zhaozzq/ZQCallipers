//
//  UIBarButtonItem+Additions.m
//  HYJFIOS
//
//  Created by zhaozq on 15/8/5.
//  Copyright (c) 2015年 HYJF. All rights reserved.
//

#import "UIBarButtonItem+Additions.h"

@implementation UIBarButtonItem (Additions)
//导航栏右侧btn
+ (UIBarButtonItem *)rectBarButtonItemWithTitle:(NSString *)title target:(id)target selector:(SEL)selector{
    return [self barButtonItemWithTitle:title
                                  image:[UIImage imageNamed:@""]
                         highlightImage:[UIImage imageNamed:@""]
                                 target:target
                               selector:selector];
}
+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                             highlightImage:(UIImage *)highlightImage
                                     target:(id)target
                                   selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    //    [button sizeToFit];
    [button setFrame:CGRectMake(0, 0, 44, 44)];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}




//公共返回按钮
+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target selector:(SEL)selector {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [button setFrame:CGRectMake(0, 0, 44, 44)];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"back_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"back_normal"] forState:UIControlStateHighlighted];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
//模态的关闭按钮
+ (UIBarButtonItem *)CloseBarButtonItemWithTarget:(id)target
                                         selector:(SEL)selector{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
   // [button setTitle:@"关闭" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [button setFrame:CGRectMake(0, 0, 44, 44)];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"cancelbtn"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"cancelbtn"] forState:UIControlStateHighlighted];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
