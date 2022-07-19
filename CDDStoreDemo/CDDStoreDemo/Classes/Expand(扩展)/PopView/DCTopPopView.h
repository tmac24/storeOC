//
//  DCTopPopView.h
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/15.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DCTopPopView : UIView

+ (void)showWithContent:(UIView *)contentView offsetY:(CGFloat)offsetY enableGesture:(bool)enableGesture;

+ (void)dismiss;

/// 显示或隐藏弹框
/// @param contentView 弹框view
/// @param offsetY 弹框view位置
+ (void)showOrHideWithContent:(UIView *)contentView offsetY:(CGFloat)offsetY;

@end

NS_ASSUME_NONNULL_END
