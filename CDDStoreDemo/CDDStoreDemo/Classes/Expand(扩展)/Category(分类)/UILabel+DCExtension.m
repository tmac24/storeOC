//
//  UILabel+DCExtension.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/15.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "UILabel+DCExtension.h"

@implementation UILabel (DCExtension)

+ (UILabel *)quickInit:(UIColor *)color font:(UIFont *)font text:(NSString *)text {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textColor = color;
    label.textAlignment = NSTextAlignmentLeft;
    label.font = font;
    return label;
}
@end
