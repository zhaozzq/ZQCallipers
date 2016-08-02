//
//  UIView+ZQPlus.m
//  winekar24th
//
//  Created by zhaozq on 15/6/3.
//  Copyright (c) 2015年 winekar. All rights reserved.
//

#import "UIView+ZQPlus.h"

@implementation UIView (ZQPlus)

-(CGFloat) x {
    return self.frame.origin.x;
}

-(void) setX:(CGFloat) newX {
    CGRect frame = self.frame;
    frame.origin.x = newX;
    self.frame = frame;
}

-(CGFloat) y {
    return self.frame.origin.y;
}

-(void) setY:(CGFloat) newY {
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
}

-(CGFloat) width {
    return self.frame.size.width;
}

-(void) setWidth:(CGFloat) newWidth {
    CGRect frame = self.frame;
    frame.size.width = newWidth;
    self.frame = frame;
}

-(CGFloat) height {
    return self.frame.size.height;
}

-(void) setHeight:(CGFloat) newHeight {
    CGRect frame = self.frame;
    frame.size.height = newHeight;
    self.frame = frame;
}

- (CGSize) size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)addGradientLayerWithColors:(NSArray *)cgColorArray locations:(NSArray *)floatNumArray startPoint:(CGPoint )startPoint endPoint:(CGPoint)endPoint{
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = self.bounds;
    if (cgColorArray && [cgColorArray count] > 0) {
        layer.colors = cgColorArray;
    }else{
        return;
    }
    if (floatNumArray && [floatNumArray count] == [cgColorArray count]) {
        layer.locations = floatNumArray;
    }
    layer.startPoint = startPoint;
    layer.endPoint = endPoint;
    [self.layer addSublayer:layer];
}


- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}
- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)borderWidth
{
    return self.layer.borderWidth;
}
- (void)setBorderWidth:(CGFloat)borderWidth
{
    self.layer.borderWidth = borderWidth;
    self.layer.masksToBounds = YES;
}

- (UIColor *)borderColor
{
    return [[UIColor alloc] initWithCGColor:self.layer.borderColor];
}
- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}
- (BOOL)masksToBounds
{
    return self.layer.masksToBounds;
}
- (void)setMasksToBounds:(BOOL)masksToBounds
{
    self.layer.masksToBounds = masksToBounds;
}
@end
