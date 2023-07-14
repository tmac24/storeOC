//
//  AppDelegate.h
//  CDDMall
//
//  Created by apple on 2017/5/26.
//  Copyright © 2017年 RocketsChen. All rights reserved.
//

@import UIKit;
@import Flutter;

@interface AppDelegate : FlutterAppDelegate // More on the FlutterAppDelegate below.

/// 单个页面
@property (nonatomic,strong) FlutterEngine *flutterEngine;

/// engines多个页面切换
@property (nonatomic, strong) FlutterEngineGroup *engines;

@property (strong, nonatomic) UIWindow *window;

@end

