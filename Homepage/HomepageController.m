//
//  ViewController.m
//  Homepage
//
//  Created by zhaozq on 16/8/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "HomepageController.h"
#import "Masonry.h"
#import "UIImage+Additions.h"
#import "UINavigationItem+Addtions.h"
#import "UIColor+ZQPlus.h"
#import "UIView+ZQPlus.h"
#import "ZQCallipers.h"
#import "ZQUtilsMacro.h"

#define kWaveMovingrange 150
@interface HomepageController () <ZQCallipersDelegate>
@property (strong, nonatomic) UIImageView *wave;
@property (assign, nonatomic) BOOL isAppearing;

@property (strong, nonatomic) UILabel *amountLabel;
@end

@implementation HomepageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.titleView = [UINavigationItem titleViewForTitle:@"首页"];
    
    [self loadBackground];
    [self loadViewItems];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)loadViewItems
{
    NSString *path = [[NSBundle mainBundle] pathForResource:[UIImage imageNameForCurrentDevice:@"buildingBg"] ofType:@"png"];
    UIImage *buildImage = [[UIImage alloc] initWithContentsOfFile:path];
    UIImageView *building = [[UIImageView alloc] initWithImage:buildImage];
    [self.view addSubview:building];
    
    _wave = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wave"]];
    [self.view addSubview:_wave];
    CGFloat offset = ZQValueFor6P6Default(80, 30, 20);
    [_wave mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.trailing.equalTo(self.view);
        make.height.equalTo(@(_wave.image.size.height + offset));
        make.width.equalTo(self.view).with.offset(kWaveMovingrange);
    }];
    
    UILabel *amountDes = [[UILabel alloc] init];
    amountDes.text = @"借贷金额";
    amountDes.font = [UIFont systemFontOfSize:18];
    amountDes.textColor = [UIColor colorWithHexString:@"ffffff"];
    [self.view addSubview:amountDes];
    offset = ZQValueFor6P6Default(35, 25, 25);
    [amountDes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(64 + offset);   //(64 + 50 / 2.0f);
    }];
    
    UIImageView *line = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line"]];
    [self.view addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(1));
        make.width.centerX.equalTo(self.view);
        make.centerY.equalTo(amountDes);
    }];
    
    _amountLabel = [[UILabel alloc] init];
    _amountLabel.text = @"3000";
    _amountLabel.font = [UIFont fontWithName:@"DINCond-Bold" size:70];
    _amountLabel.textColor = [UIColor colorWithHexString:@"ffffff"];
    [self.view addSubview:_amountLabel];
    [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(amountDes).with.offset(ZQValueFor6P6Default(55, 45, 30));
    }];

    UILabel *yuan = [[UILabel alloc] init];
    yuan.text = @"元";
    yuan.font = [UIFont systemFontOfSize:18];
    yuan.textColor = [UIColor colorWithHexString:@"ffffff"];
    [self.view addSubview:yuan];
    [yuan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.baseline.equalTo(_amountLabel).with.offset(-4);
        make.left.equalTo(_amountLabel.mas_right).with.offset(10);
    }];

    ZQCallipers *callipers = [[ZQCallipers alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 75) target:self maxValue:6500];
    //callipers.delegate = self;
    callipers.backgroundColor = [UIColor clearColor];
    [self.view addSubview:callipers];
    [callipers mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(75));
        make.width.centerX.equalTo(self.view);
        make.top.equalTo(_amountLabel.mas_bottom).with.offset(ZQValueFor6P6Default(20, 20, 5));
    }];
    
    UIButton *apply = [UIButton buttonWithType:UIButtonTypeCustom];
    //[apply setTitle:@"马上申请" forState:UIControlStateNormal];
    NSMutableAttributedString *applyTitle = [[NSMutableAttributedString alloc] initWithString:@"马上申请" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [apply setAttributedTitle:applyTitle forState:UIControlStateNormal];
    [apply setBackgroundColor:[UIColor colorWithHexString:@"f8ab16"]];
    apply.cornerRadius = 4;
    [apply addTarget:self action:@selector(applyAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:apply];
    [apply mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(callipers.mas_bottom).with.offset(ZQValueFor6P6Default(25, 17, 15));
        make.width.equalTo(self.view).with.offset(-30);
        make.height.equalTo(@(44));
        make.centerX.equalTo(self.view);
    }];
    
    UIImageView *time = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"time"]];
    [self.view addSubview:time];
    
    UIImageView *pledge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pledge"]];
    [self.view addSubview:pledge];
    
    UIImageView *charge = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lowCharge"]];
    [self.view addSubview:charge];
    
    [pledge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(apply.mas_bottom).with.offset(ZQValueFor6P6Default(50, 40, 20));
    }];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(pledge);
        make.leading.equalTo(self.view).with.offset(43);
    }];
    [charge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(pledge);
        make.trailing.equalTo(self.view).with.offset(-43);
    }];
    
    UILabel *timeDes = [[UILabel alloc] initWithFrame:CGRectZero];
    timeDes.numberOfLines = 2;
    timeDes.text = @"56秒到账";
    timeDes.textColor = [UIColor colorWithHexString:@"ffffff"];
    timeDes.font = [UIFont systemFontOfSize:16];
    timeDes.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:timeDes];
    [timeDes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(time.mas_bottom).with.offset(15);
        make.centerX.equalTo(time);
    }];
    
    UILabel *pledgeDes = [[UILabel alloc] initWithFrame:CGRectZero];
    pledgeDes.numberOfLines = 2;
    pledgeDes.text = @"无抵押无担保\n简单快捷";
    pledgeDes.textColor = [UIColor colorWithHexString:@"ffffff"];
    pledgeDes.font = [UIFont systemFontOfSize:16];
    pledgeDes.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:pledgeDes];
    [pledgeDes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(timeDes);
        make.centerX.equalTo(self.view);
    }];
    
    UILabel *chargeDes = [[UILabel alloc] initWithFrame:CGRectZero];
    chargeDes.numberOfLines = 2;
    chargeDes.text = @"手续费比行业\n平均低29.8%";
    chargeDes.textColor = [UIColor colorWithHexString:@"ffffff"];
    chargeDes.font = [UIFont systemFontOfSize:16];
    chargeDes.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:chargeDes];
    [chargeDes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(timeDes);
        make.centerX.equalTo(charge);
    }];
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [testBtn setBackgroundImage:[UIImage imageNamed:@"test"] forState:UIControlStateNormal];
    [testBtn setBackgroundImage:[UIImage imageNamed:@"test"] forState:UIControlStateHighlighted];

    [self.view addSubview:testBtn];
    [testBtn addTarget:self action:@selector(testAction) forControlEvents:UIControlEventTouchUpInside];
    [testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(apply);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-16);
        make.height.equalTo(@(ZQValueFor6P6Default(110, 100, 80)));
    }];
    
    UILabel *testDes = [[UILabel alloc] initWithFrame:CGRectZero];
    testDes.text = @"测试我的借款额度";
    testDes.font = [UIFont systemFontOfSize:18];
    testDes.textColor = [UIColor colorWithHexString:@"ffffff"];
    [self.view addSubview:testDes];
    [testDes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(testBtn);
        make.right.equalTo(testBtn).with.offset(-20);
    }];
}

- (void)loadBackground
{
    NSString *path = [[NSBundle mainBundle] pathForResource:[UIImage imageNameForCurrentDevice:@"bkg"] ofType:@"png"];
    UIImage *bgImage = [[UIImage alloc] initWithContentsOfFile:path];
    UIImageView *bgImgView = [[UIImageView alloc] initWithImage:bgImage];
    [self.view addSubview:bgImgView];
    
    [bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];
}

#pragma mark ZQCallipersDelegate

- (void)callipers:(ZQCallipers *)callipers valueChanged:(NSInteger)value
{
    self.amount = value;
}

- (void)setAmount:(NSInteger)amount
{
    _amount = amount;
    _amountLabel.text = [NSString stringWithFormat:@"%zd",amount];
}

- (void)applyAction
{
    NSLog(@"applyAction");
}

- (void)testAction
{
    NSLog(@"testAction");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
        _isAppearing = YES;
        [self movingBigImageBackgroundView];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    _isAppearing = NO;
    [self.view.layer removeAllAnimations];
    
}

- (void)appDidEnterBackground
{
    _isAppearing = NO;
    [self.view.layer removeAllAnimations];
}

- (void)movingBigImageBackgroundView
{
    if (!_isAppearing) return;
        
    
    static NSInteger times = 0;
    CGFloat duration = 10;
    
    void (^animate1)(BOOL) =  ^(BOOL finished){
        [_wave mas_updateConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.view);
        }];
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction animations:^{
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            [self movingBigImageBackgroundView];
        }];
    };
    
    [_wave mas_updateConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.view).with.offset(kWaveMovingrange);
    }];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction animations:^{
        [self.view layoutIfNeeded];
    } completion:animate1];
    
    
    NSLog(@"times %zd",++times);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
