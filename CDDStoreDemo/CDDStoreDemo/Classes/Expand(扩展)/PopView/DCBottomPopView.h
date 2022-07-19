//
//  DCBottomPopView.h
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/19.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DCBottomPopView : UIView

+ (void)showWithContent:(UIView *)contentView enableGesture:(bool)enableGesture;
+ (void)dismiss;

/// 显示或隐藏弹框
/// @param contentView 弹框view
+ (void)showOrHideWithContent:(UIView *)contentView;
@end

NS_ASSUME_NONNULL_END
