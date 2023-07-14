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
#import "CDDStoreDemo-Swift.h"

@interface DCFlutterViewController ()
/// channel
@property (nonatomic, strong) FlutterMethodChannel *channel;

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
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 addTarget:self
               action:@selector(showFlutter2)
     forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"Show Flutter2!" forState:UIControlStateNormal];
    button1.backgroundColor = UIColor.blueColor;
    button1.frame = CGRectMake(80.0, 280.0, 160.0, 40.0);
    [self.view addSubview:button1];
}

- (void)showFlutter {
    FlutterEngine *flutterEngine =
        ((AppDelegate *)UIApplication.sharedApplication.delegate).flutterEngine;
    FlutterViewController *flutterViewController =
        [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    [self presentViewController:flutterViewController animated:YES completion:nil];
//    [self.navigationController pushViewController:flutterViewController animated:YES];
}

- (void)showFlutter2 {

    HostViewController *vc = [[HostViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
