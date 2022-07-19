//
//  DCTestPopSelectView.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/19.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "DCTestPopSelectView.h"

@interface DCTestPopSelectView()
/* 时间 */
@property (strong , nonatomic)UILabel *timeLabel;

@end

@implementation DCTestPopSelectView

#pragma mark - Intial
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {

        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    UIView *bacView = [[UIView alloc] initWithFrame:self.bounds];
    bacView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bacView];
    
    for (int i=0; i<5; i++) {
        NSString *title = [NSString stringWithFormat:@"香蕉🍌--%d",i];
        UILabel *label = [UILabel quickInit:[UIColor blackColor] font:PFRFont(14) text:title];
        label.frame = CGRectMake(23, 30*i, 100, 30);
        [self addSubview:label];
    }
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
}

@end
