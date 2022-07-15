//
//  DCProgressHUD.h
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/15.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "SVProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^ToastHUDDismissCompletion)(void);

@interface DCProgressHUD : SVProgressHUD

+(void)showToast:(NSString*)msg;
+(void)showToast:(NSString*)msg andDuration:(CGFloat)duration;
+(void)showToast:(NSString*)msg completion:(nullable ToastHUDDismissCompletion)completion;
+(void)showToast:(NSString*)msg andDuration:(CGFloat)duration completion:(nullable ToastHUDDismissCompletion)completion;

@end

NS_ASSUME_NONNULL_END
