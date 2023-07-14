//
//  DCFlutterViewController.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2023/7/14.
//  Copyright © 2023 RocketsChen. All rights reserved.
//

@import Flutter;
#import "AppDelegate.h"
#import "DCFlutterViewController.h"

@interface DCFlutterViewController ()

@end

@implementation DCFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Make a button to call the showFlutter function when pressed.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(showFlutter)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show Flutter!" forState:UIControlStateNormal];
    button.backgroundColor = UIColor.blueColor;
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
}

- (void)showFlutter {
    FlutterEngine *flutterEngine =
        ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    FlutterViewController *flutterViewController =
        [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    [self presentViewController:flutterViewController animated:YES completion:nil];
//    [self.navigationController pushViewController:flutterViewController animated:YES];
}

@end
