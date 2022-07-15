//
//  UILabel+DCExtension.h
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/15.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (DCExtension)
+ (UILabel *)quickInit:(UIColor *)color font:(UIFont *)font text:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
