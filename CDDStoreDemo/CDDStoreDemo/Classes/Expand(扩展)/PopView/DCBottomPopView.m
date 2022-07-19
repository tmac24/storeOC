//
//  DCBottomPopView.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/19.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "DCBottomPopView.h"

@interface DCBottomPopView ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *contentView;

@end

@implementation DCBottomPopView


+ (void)showOrHideWithContent:(UIView *)contentView {
    if (contentView.superview != nil) {
        [DCBottomPopView dismiss];
    }else {
        [DCBottomPopView showWithContent:contentView enableGesture:true];
    }
}

+ (void)showWithContent:(UIView *)contentView enableGesture:(bool)enableGesture {
    DCBottomPopView *bottomView = [[DCBottomPopView alloc] init];
    [bottomView show:contentView pView:[[UIApplication sharedApplication] delegate].window enableGesture:enableGesture tag:-9999];
}

- (void)show:(UIView *)contentView pView:(UIView *)pView enableGesture:(bool)enableGesture tag:(int)tag {
    self.contentView = contentView;
    self.tag = tag;
    self.frame = pView.bounds;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    
    if (enableGesture == true) {
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPressed:)];
        tapGes.delegate = self;
        [self addGestureRecognizer:tapGes];
    }
    
    CGFloat height = contentView.frame.size.height;
    self.contentView.frame = CGRectMake(0, ScreenH, ScreenW, height);
    [pView addSubview:self];
    
    [self addSubview:self.contentView];
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.contentView.frame = CGRectMake(0, ScreenH-height, ScreenW, height);
        } completion:^(BOOL finished) {
        }];
}

- (void)dismissPressed:(UITapGestureRecognizer *)tapGesture {
    [self dismissView];
}

+ (void)dismiss{
    UIWindow *window = [[UIApplication sharedApplication] delegate].window;
    DCBottomPopView *bottomView = [window viewWithTag:-9999];
    [bottomView dismissView];
}

- (void)dismissView{
    CGFloat height = self.contentView.frame.size.height;
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.contentView.frame = CGRectMake(0, ScreenH, ScreenW, height);
        self.backgroundColor = [UIColor clearColor];
        
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            [self.contentView removeFromSuperview];
        }];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint point = [touch locationInView:self];
    bool isContains = CGRectContainsPoint(self.contentView.frame, point);
    return !isContains;
}

@end

