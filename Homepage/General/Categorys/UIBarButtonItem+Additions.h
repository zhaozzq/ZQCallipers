//
//  UIBarButtonItem+Additions.h
//  HYJFIOS
//
//  Created by zhaozq on 15/8/5.
//  Copyright (c) 2015年 HYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Additions)  
+ (UIBarButtonItem *)rectBarButtonItemWithTitle:(NSString *)title
                                         target:(id)target
                                       selector:(SEL)selector;
+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                      image:(UIImage *)image
                             highlightImage:(UIImage *)highlightImage
                                     target:(id)target
                                   selector:(SEL)selector;
+ (UIBarButtonItem *)backBarButtonItemWithTarget:(id)target
                                        selector:(SEL)selector;

+ (UIBarButtonItem *)CloseBarButtonItemWithTarget:(id)target
                                        selector:(SEL)selector;
@end
