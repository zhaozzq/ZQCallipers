//
//  ZQCallipers.m
//  Homepage
//
//  Created by zhaozq on 16/8/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "ZQCallipers.h"
#import "Masonry.h"

@interface ZQCallipers ()

@end

@implementation ZQCallipers

- (instancetype) initWithFrame:(CGRect)frame target:(id<ZQCallipersDelegate>)target maxValue:(NSInteger)maxValue
{
    self = [self initWithFrame:frame];
    if (self) {
        _maxValue = maxValue;
        _delegate = target;
        [self loadViewItems];
    }
    return self;
}

- (instancetype) initWithFrame:(CGRect)frame target:(id<ZQCallipersDelegate>)target
{
    self = [super initWithFrame:frame];
    if (self) {
        _maxValue = kDefaultMaxValue;
        _delegate = target;
        [self loadViewItems];
    }
    return self;
}
/**
 *  不要使用 initWithFrame: 和 init
 */
//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        _maxValue = kDefaultMaxValue;
//        [self loadViewItems];
//    }
//    return self;
//}
//
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        _maxValue = kDefaultMaxValue;
//        [self loadViewItems];
//    }
//    return self;
//}

- (void)awakeFromNib
{
    _maxValue = kDefaultMaxValue;
    [self loadViewItems];
}

- (void)setMaxValue:(NSInteger)maxValue
{
    if (_maxValue != maxValue)
    {
        _maxValue = maxValue;
        [self loadViewItems];
    }
}

- (void)loadViewItems
{
    if (_scrollView) {
        [_scrollView removeFromSuperview];
        [_pointer removeFromSuperview];
    }
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.delegate = self;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    //_pointer = [UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.bounds), 0, <#CGFloat width#>, <#CGFloat height#>)
    _pointer = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pointer"]];
    [self addSubview:_pointer];
    [_pointer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.centerX.equalTo(self);
    }];
    
    [self loadMarkLines];
}

- (void)loadMarkLines
{
    CGFloat startX = CGRectGetMidX(self.bounds) - 2 * (kStepLongth + 1);
    
    UIView *leftView = nil;
    for (NSInteger index = 0; index < _maxValue / 500 * 5 + 5; index ++) {
        UIView *line = [[UIView alloc] initWithFrame:CGRectZero];
        line.backgroundColor = [UIColor whiteColor];
        [_scrollView addSubview:line];
        if (index == 0) {
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(_scrollView).with.offset(startX);
                make.width.equalTo(@1);
                make.height.equalTo(@15);
                make.bottom.equalTo(_scrollView);
                make.top.equalTo(_scrollView).with.offset(CGRectGetHeight(_scrollView.frame) - 15);
            }];
        }
        else if (index % 5 != 2)
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(leftView.mas_right).with.offset(kStepLongth);
                make.width.equalTo(@1);
                make.height.equalTo(@15);
                make.bottom.equalTo(_scrollView);
            }];
        }
        else
        {
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(leftView.mas_right).with.offset(kStepLongth);
                make.width.equalTo(@1);
                make.height.equalTo(@24);
                make.bottom.equalTo(_scrollView);
            }];
            
            UILabel *markLabel = [[UILabel alloc] init];
            markLabel.textColor = [UIColor whiteColor];
            markLabel.font = [UIFont fontWithName:@"DINCond-Bold" size:15];
            markLabel.text = [NSString stringWithFormat:@"%zd",(index - 2) * 100];
            [_scrollView addSubview:markLabel];
            [markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(line);
                make.bottom.equalTo(line.mas_top).with.offset(-6);
            }];
            
        }
        leftView = line;
    }
    
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_scrollView).with.offset(-startX);
    }];
    
    _scrollView.contentOffset = CGPointMake(_maxValue / 500 / 2 * 5 * (kStepLongth + 1) + 1, 0);
    if ([_delegate respondsToSelector:@selector(callipers:valueChanged:)]) {
        [_delegate callipers:self valueChanged:_maxValue / 500 / 2 * 500];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger index = round((scrollView.contentOffset.x) / (kStepLongth + 1));
//    NSInteger index = floor((scrollView.contentOffset.x) / (kStepLongth + 1));
    
//    CGFloat t = scrollView.contentOffset.x - index * (kStepLongth + 1);
//    if (t > -2 || t < 2) {
//        scrollView.contentOffset = CGPointMake(index * (kStepLongth + 1), 0);
//    }
    
    if ([_delegate respondsToSelector:@selector(callipers:valueChanged:)]) {
        [_delegate callipers:self valueChanged:index * 100];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging %zd",decelerate);
    if (!decelerate) {
        
        NSInteger index = round((scrollView.contentOffset.x) / (kStepLongth + 1));
        
        scrollView.contentOffset = CGPointMake(index * (kStepLongth + 1), 0);

        if ([_delegate respondsToSelector:@selector(callipers:valueChanged:)]) {
            [_delegate callipers:self valueChanged:index * 100];
        }

    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidEndDragging");
    
    NSInteger index = round((scrollView.contentOffset.x) / (kStepLongth + 1));
    
//    CGFloat t = scrollView.contentOffset.x - index * (kStepLongth + 1);
//    if (t > -2 || t < 2) {
//        scrollView.contentOffset = CGPointMake(index * (kStepLongth + 1), 0);
//    }
    scrollView.contentOffset = CGPointMake(index * (kStepLongth + 1), 0);
    
    if ([_delegate respondsToSelector:@selector(callipers:valueChanged:)]) {
        [_delegate callipers:self valueChanged:index * 100];
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
