//
//  DCDrawerPopView.h
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/19.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DCDrawerPopView : UIView

/// 右边抽屉弹框
/// @param contentView 弹框内容
/// @param width 弹框宽度
+ (void)showOrHideWithContent:(UIView *)contentView width:(CGFloat)width;
@end

NS_ASSUME_NONNULL_END
