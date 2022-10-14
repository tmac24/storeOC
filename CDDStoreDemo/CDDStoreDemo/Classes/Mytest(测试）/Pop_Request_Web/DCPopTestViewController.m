//
//  DCPopTestViewController.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/20.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "DCPopTestViewController.h"
#import "DCTopPopView.h"
#import "DCTestPopSelectView.h"
#import "DCBottomPopView.h"
#import "DCCenterPopView.h"
#import "DCDrawerPopView.h"

@interface DCPopTestViewController ()

/* 弹框视图 */
@property (nonatomic, strong) UIView *popView;
/* 选择框弹框视图 */
@property (nonatomic, strong) DCTestPopSelectView *popSelectView;

@property (nonatomic, strong) UIView *popBottomView;

@end

@implementation DCPopTestViewController

#pragma mark - LazyLoad
- (UIView *)popView {
    if (!_popView) {
        _popView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
        _popView.backgroundColor = [UIColor whiteColor];
        UILabel *label = [UILabel quickInit:[UIColor blackColor] font:PFSFont(20) text:
                          @"我知道了"];
        label.frame = _popView.bounds;
        label.textAlignment = NSTextAlignmentCenter;
        [_popView addSubview:label];
    }
    return _popView;
}

- (DCTestPopSelectView *)popSelectView {
    if (!_popSelectView) {
        _popSelectView = [[DCTestPopSelectView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 170)];
        [_popSelectView setExtCorner:UIRectCornerTopLeft|UIRectCornerTopRight radii:15];
    }
    return _popSelectView;
}

#pragma mark - LifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
}

#pragma mark - initialize
- (void)setUpUI {
    self.title = @"弹框";
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithTitle:@"编辑" Target:self action:@selector(editClick)];
    
    for (int i=0; i<5; i++) {
        NSString *title = [NSString stringWithFormat:@"弹框样式🍌--%d",i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(23, navH+60*i, ScreenW, 60);
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.titleLabel.font = PFSFont(22);
        button.tag = i;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

#pragma mark - ButtonItem事件
- (void)buttonClick:(UIButton *)sender {
    int index = (int)sender.tag;
    NSLog(@"点击了第%d个",index);
    if (index == 0) {
//        if (self.popSelectView.superview != nil) {
//            [DCTopPopView dismiss];
//        }else {
//            [DCTopPopView showWithContent:self.popSelectView offsetY:navH enableGesture:true];
//        }
        [DCTopPopView showOrHideWithContent:self.popSelectView offsetY:navH+200];
    }else if (index == 1) {
//        if (self.popView.superview != nil) {
//            [DCCenterPopView dismiss];
//        }else {
//            [DCCenterPopView showWithContent:self.popView enableGesture:false];
//        }
        [DCCenterPopView showOrHideWithContent:self.popView enableGesture:true];
    }else if (index == 2) {
//        if (self.popSelectView.superview != nil) {
//            [DCBottomPopView dismiss];
//        }else {
//            [DCBottomPopView showWithContent:self.popSelectView enableGesture:true];
//        }
        [DCBottomPopView showOrHideWithContent:self.popSelectView];
    }else {
        [DCDrawerPopView showOrHideWithContent:self.popSelectView width:ScreenW*0.8];
    }
    
}


- (UIView *)popBottomView {
    if (!_popBottomView) {
        _popBottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 170)];
        _popBottomView.backgroundColor = [UIColor blueColor];
        [_popBottomView setExtCorner:UIRectCornerTopLeft|UIRectCornerTopRight radii:15];
    }
    return _popBottomView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //        if (self.popBottomView.superview != nil) {
    //            [DCBottomPopView dismiss];
    //        }else {
    //            [DCBottomPopView showWithContent:self.popBottomView enableGesture:true];
    //        }
    
    [DCBottomPopView showOrHideWithContent:self.popBottomView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
