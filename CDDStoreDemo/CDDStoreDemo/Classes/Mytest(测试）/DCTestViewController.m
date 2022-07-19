//
//  DCTestViewController.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/13.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "DCTestViewController.h"
#import "DCTopPopView.h"
#import "DCTestPopSelectView.h"
#import "DCBottomPopView.h"
#import "DCCenterPopView.h"
#import "DCDrawerPopView.h"

@interface DCTestViewController ()<UITableViewDelegate, UITableViewDataSource>

/* tableView */
@property (nonatomic, strong) UITableView *tableView;
/* 数据源 */
@property (nonatomic, strong) NSArray *datas;
/* 弹框视图 */
@property (nonatomic, strong) UIView *popView;
/* 选择框弹框视图 */
@property (nonatomic, strong) DCTestPopSelectView *popSelectView;

@end

static NSString *const DCTestViewCellID = @"DCTestViewCellID";

@implementation DCTestViewController

#pragma mark - LazyLoad
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:DCTestViewCellID];
    }
    return _tableView;
}

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
        _popSelectView = [[DCTestPopSelectView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 150)];
    }
    return _popSelectView;
}

#pragma mark - LifeCyle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
    [self setUpData];
}

#pragma mark - initialize
- (void)setUpUI {
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.frame = CGRectMake(0, navH, ScreenW, ScreenH-navH-tabbarH);
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ItemWithTitle:@"编辑" Target:self action:@selector(editClick)];
}

- (void)setUpData{
    self.datas = @[@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1"
        ];
    [self.tableView reloadData];
}

#pragma mark - UIBarButtonItem事件
- (void)editClick {
//    if (self.popSelectView.superview != nil) {
//        [DCTopPopView dismiss];
//    }else {
//        [DCTopPopView showWithContent:self.popSelectView offsetY:navH enableGesture:true];
//    }
//    [DCTopPopView showOrHideWithContent:self.popSelectView offsetY:navH];
    
//    if (self.popView.superview != nil) {
//        [DCCenterPopView dismiss];
//    }else {
//        [DCCenterPopView showWithContent:self.popView enableGesture:false];
//    }
//    [DCCenterPopView showOrHideWithContent:self.popView enableGesture:true];
    
//    if (self.popSelectView.superview != nil) {
//        [DCBottomPopView dismiss];
//    }else {
//        [DCBottomPopView showWithContent:self.popSelectView enableGesture:true];
//    }
//    [DCBottomPopView showOrHideWithContent:self.popSelectView];
    
    [DCDrawerPopView showOrHideWithContent:self.popSelectView width:ScreenW*0.8];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DCTestViewCellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSString *title = _datas[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@--%d",title,(int)indexPath.row];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *title = _datas[indexPath.row];
    NSLog(@"DCTestViewController--%@",title);
    UIViewController *vc = [[UIViewController alloc] init];
    vc.title = title;
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:true];
}

@end
