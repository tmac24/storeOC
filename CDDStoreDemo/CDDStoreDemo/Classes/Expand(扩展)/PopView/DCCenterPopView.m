//
//  DCCenterPopView.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/19.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "DCCenterPopView.h"

@interface DCCenterPopView ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *contentView;

@end

@implementation DCCenterPopView

- (bool)enableGes {
    return true;
}

+ (void)showOrHideWithContent:(UIView *)contentView enableGesture:(bool)enableGesture {
    if (contentView.superview != nil) {
        [DCCenterPopView dismiss];
    }else {
        [DCCenterPopView showWithContent:contentView enableGesture:enableGesture];
    }
}

+ (void)showWithContent:(UIView *)contentView enableGesture:(bool)enableGesture {
    DCCenterPopView *centerView = [[DCCenterPopView alloc] init];
    [centerView show:contentView pView:[[UIApplication sharedApplication] delegate].window enableGesture:enableGesture tag:-19999];
}

- (void)show:(UIView *)contentView pView:(UIView *)pView enableGesture:(bool)enableGesture tag:(int)tag {
    self.contentView = contentView;
    self.tag = tag;
    self.frame = pView.bounds;
    self.backgroundColor = [UIColor clearColor];
    if (enableGesture == true) {
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPressed:)];
        tapGes.delegate = self;
        [self addGestureRecognizer:tapGes];
    }
    
    CGFloat height = contentView.frame.size.height;
    CGFloat width = contentView.frame.size.width;

    self.contentView.frame = CGRectMake(0, 0, width, height);
    [pView addSubview:self];
    
    [self addSubview:self.contentView];
    self.contentView.center = CGPointMake(ScreenW/2, ScreenH/2);
    contentView.alpha = 1;
    contentView.transform = CGAffineTransformScale(contentView.transform, 1.15, 1.15);

    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.contentView.transform = CGAffineTransformIdentity;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
        } completion:^(BOOL finished) {
        }];
}

- (void)dismissPressed:(UITapGestureRecognizer *)tapGesture {
    [self dismissView];
}

+ (void)dismiss{
    UIWindow *window = [[UIApplication sharedApplication] delegate].window;
    DCCenterPopView *centerView = [window viewWithTag:-19999];
    [centerView dismissView];
}

- (void)dismissView{
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.contentView.alpha = 0;
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

