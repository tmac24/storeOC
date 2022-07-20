//
//  DCDrawerPopView.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/19.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "DCDrawerPopView.h"

@interface DCDrawerPopView ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *contentView;

@end

@implementation DCDrawerPopView


+ (void)showOrHideWithContent:(UIView *)contentView width:(CGFloat)width {
    if (contentView.superview != nil) {
        [DCDrawerPopView dismiss];
    }else {
        [DCDrawerPopView showWithContent:contentView width:width];
    }
}

+ (void)showWithContent:(UIView *)contentView width:(CGFloat)width {
    DCDrawerPopView *drawerPopView = [[DCDrawerPopView alloc] init];
    [drawerPopView show:contentView pView:[[UIApplication sharedApplication] delegate].window enableGesture:true width:width tag:-1999];
}

- (void)show:(UIView *)contentView pView:(UIView *)pView enableGesture:(bool)enableGesture width:(CGFloat)width tag:(int)tag {
    self.contentView = contentView;
    self.tag = tag;
    self.frame = pView.bounds;
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    
    if (enableGesture == true) {
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPressed:)];
        tapGes.delegate = self;
        [self addGestureRecognizer:tapGes];
        
//        //添加手势
//        UIPanGestureRecognizer *pan=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panEvent:)]; //滑动
//        pan.delegate = self;
//        [self addGestureRecognizer:pan];
    }
    
    CGFloat height = contentView.frame.size.height;
    self.contentView.frame = CGRectMake(ScreenW, 0, width, ScreenH);
    [pView addSubview:self];
    
    [self addSubview:self.contentView];
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.35];
        self.contentView.frame = CGRectMake(ScreenW-width, 0, ScreenW, ScreenH);
        self.contentView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
        }];
}

- (void)dismissPressed:(UITapGestureRecognizer *)tapGesture {
    [self dismissView];
}

+ (void)dismiss{
    UIWindow *window = [[UIApplication sharedApplication] delegate].window;
    DCDrawerPopView *drawerPopView = [window viewWithTag:-1999];
    [drawerPopView dismissView];
}

- (void)dismissView{
    CGFloat width = self.contentView.frame.size.width;
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.contentView.frame = CGRectMake(ScreenW, 0, width, ScreenH);
        self.contentView.transform = CGAffineTransformIdentity;

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

#pragma mark - 滑动手势事件
- (void)panEvent:(UIPanGestureRecognizer *)recognizer{
    
    CGPoint translation = [recognizer translationInView:self];
    
    if(UIGestureRecognizerStateBegan == recognizer.state || UIGestureRecognizerStateChanged == recognizer.state){
        
        if (translation.x > 0 ) {//右滑
            self.contentView.dc_x = ScreenW * 0.2 + translation.x;
        }else{//左滑
            
            if (self.contentView.dc_x < ScreenW * 0.2) {
                self.contentView.dc_x = self.contentView.dc_x - translation.x;
            }else{
                self.contentView.dc_x = ScreenW * 0.2;
            }
        }
    }else{
        
        [self dismissView];
    }
}

@end


