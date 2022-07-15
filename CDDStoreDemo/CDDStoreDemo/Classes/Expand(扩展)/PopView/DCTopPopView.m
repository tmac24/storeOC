//
//  DCTopPopView.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/15.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "DCTopPopView.h"

@interface DCTopPopView ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) bool enableGes;

@end

@implementation DCTopPopView

- (bool)enableGes {
    return true;
}

+ (void)showWithContent:(UIView *)contentView offsetY:(CGFloat)offsetY enableGesture:(bool)enableGesture {
    DCTopPopView *topView = [[DCTopPopView alloc] init];
    [topView show:contentView offsetY:offsetY pView:[[UIApplication sharedApplication] delegate].window enableGesture:enableGesture tag:-2999];
}

- (void)show:(UIView *)contentView offsetY:(CGFloat)offsetY pView:(UIView *)pView enableGesture:(bool)enableGesture tag:(int)tag {
    self.contentView = contentView;
    self.tag = tag;
    self.frame = CGRectMake(0, offsetY, ScreenW, ScreenH-offsetY);
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPressed:)];
    tapGes.delegate = self;
    [self addGestureRecognizer:tapGes];
    
    CGFloat height = contentView.frame.size.height;
    self.contentView.frame = CGRectMake(0, 0, ScreenW, 0);
    [pView addSubview:self];
    
    [self addSubview:self.contentView];
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.contentView.frame = CGRectMake(0, 0, ScreenW, height);
        } completion:^(BOOL finished) {            
        }];
}

- (void)dismissPressed:(UITapGestureRecognizer *)tapGesture {
    [self dismissView];
}

+ (void)dismiss{
    UIWindow *window = [[UIApplication sharedApplication] delegate].window;
    DCTopPopView *topView = [window viewWithTag:-2999];
    [topView dismissView];
}

- (void)dismissView{
    CGFloat height = self.contentView.frame.size.height;
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.contentView.frame = CGRectMake(0, 0, ScreenW, 0);
        self.backgroundColor = [UIColor clearColor];
        
        } completion:^(BOOL finished) {
            self.contentView.frame = CGRectMake(0, 0, ScreenW, height);
            [self removeFromSuperview];
        }];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint point = [touch locationInView:self];
    bool isContains = CGRectContainsPoint(self.contentView.frame, point);
    return !isContains;
}

@end
