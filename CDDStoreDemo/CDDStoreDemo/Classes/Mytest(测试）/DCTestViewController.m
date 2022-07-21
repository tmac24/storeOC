//
//  DCTestViewController.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/13.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "DCTestViewController.h"
#import "DCPopTestViewController.h"
#import "DCRequestTestViewController.h"
#import "DCWebViewController.h"
#import "DCBlock1ViewController.h"

@interface DCTestViewController ()<UITableViewDelegate, UITableViewDataSource>

/* tableView */
@property (nonatomic, strong) UITableView *tableView;
/* 数据源 */
@property (nonatomic, strong) NSArray *datas;

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
}

- (void)setUpData{
    self.datas = @[@"弹框test",@"网络请求test",@"网页交互",@"DCBlock1ViewController",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1",@"数据1"
        ];
    [self.tableView reloadData];
}

#pragma mark - UIBarButtonItem事件
- (void)editClick {
    

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
    UIViewController *vc = [[UIViewController alloc] init];
    vc.title = title;
    if (indexPath.row == 0) {
        vc = [[DCPopTestViewController alloc] init];
    }else if(indexPath.row == 1) {
        vc = [[DCRequestTestViewController alloc] init];
    }else if(indexPath.row == 2) {
        vc = [[DCWebViewController alloc] init];
    }else if (indexPath.row == 3) {
        vc = [[DCBlock1ViewController alloc] init];
    }
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:true];
}

@end
