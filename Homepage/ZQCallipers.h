//
//  ZQCallipers.h
//  Homepage
//
//  Created by zhaozq on 16/8/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kStepLongth 15 //两线之间的间隔
#define kDefaultMaxValue 5500
@class ZQCallipers;
@protocol ZQCallipersDelegate <NSObject>

- (void)callipers:(ZQCallipers *)callipers valueChanged:(NSInteger)value;

@end


@interface ZQCallipers : UIView <UIScrollViewDelegate>

- (instancetype) initWithFrame:(CGRect)frame target:(id<ZQCallipersDelegate>)target maxValue:(NSInteger)maxValue;
- (instancetype)initWithFrame:(CGRect)frame target:(id<ZQCallipersDelegate>)target;

@property (strong, nonatomic) UIScrollView *scrollView;

@property (weak, nonatomic) id<ZQCallipersDelegate> delegate;
/**
 *  尺度 （500*n）
 */
@property (assign, nonatomic) NSInteger maxValue;

@property (strong, nonatomic) UIImageView *pointer;

@end
