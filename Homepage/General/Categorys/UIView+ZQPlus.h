//
//  UIView+ZQPlus.h
//  winekar24th
//
//  Created by zhaozq on 15/6/3.
//  Copyright (c) 2015年 winekar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZQPlus)

@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
- (void)addGradientLayerWithColors:(NSArray *)cgColorArray locations:(NSArray *)floatNumArray startPoint:(CGPoint )startPoint endPoint:(CGPoint)endPoint;


@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign)IBInspectable CGFloat borderWidth; 
@property (nonatomic, strong)IBInspectable UIColor *borderColor;
@property (nonatomic, assign)IBInspectable BOOL masksToBounds;
@end
