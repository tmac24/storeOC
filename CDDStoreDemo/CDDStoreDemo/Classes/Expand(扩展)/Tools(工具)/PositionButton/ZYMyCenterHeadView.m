////
////  ZYMyCenterHeadView.m
////  QLStockHqModule
////
////  Created by cdql10103 on 2022/6/1.
////
//
//#import "ZYMyCenterHeadView.h"
//#import "ZYPositionButton.h"
//
//@interface ZYMyCenterHeadView ()
//
//@property (nonatomic, strong) UIImageView *photoView;
//@property (nonatomic, strong) UIView *headerView;
//@property (nonatomic, strong) UIButton *loginButton;
//@property (nonatomic, strong) UIImageView *tipImgView;
//@property (nonatomic, strong) UILabel *tipLabel;
//
//@property (nonatomic, strong) ZYPositionButton *orderButton;
//@property (nonatomic, strong) ZYPositionButton *zenButton;
//@property (nonatomic, strong) ZYPositionButton *skipButton;
//@property (nonatomic, strong) ZYPositionButton *contractButton;
//
//@end
//
//@implementation ZYMyCenterHeadView
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setUpUI];
//    }
//    return self;
//}
//
//- (void)setUpUI {
//    self.backgroundColor = [UIColor whiteColor];
//    
//    _headerView = [[UIView alloc] init];
//    _headerView.jsonTheme.backgroundColor(@"顶部背景色");
//    [self addSubview:_headerView];
//    
//    CGFloat photoViewWith = 80;
//    _photoView = [[UIImageView alloc] init];
//    _photoView.layer.cornerRadius = photoViewWith/2;
//    _photoView.layer.masksToBounds = YES;
//    _photoView.userInteractionEnabled = YES;
//    _photoView.layer.borderColor = [UIColor whiteColor].CGColor;
//    _photoView.layer.borderWidth = 2;
//    _photoView.image = [UIImage getQLimageNamed:@"default_avator.png"];
//    [_headerView addSubview:_photoView];
//    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
//    [_photoView addGestureRecognizer:tapGesture];
//    
//    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_loginButton setTitle:@"注册 / 登录" forState:UIControlStateNormal];
//    _loginButton.layer.borderWidth = 1;
//    _loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
//    _loginButton.titleLabel.font = [UIFont systemFontOfSize:14];
//    [_loginButton addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
//    [_headerView addSubview:_loginButton];
//    
//    _tipImgView = [[UIImageView alloc] init];
//    _tipImgView.backgroundColor = [UIColor orangeColor];
//    _tipImgView.layer.cornerRadius = 4;
//    _tipImgView.layer.masksToBounds = true;
//    [self addSubview:_tipImgView];
//    
//    _tipLabel = [[UILabel alloc] init];
//    _tipLabel.text = @"诱多还是诱空？教你一招识破主力”诡计“";
//    _tipLabel.font = [UIFont systemFontOfSize:16];
//    _tipLabel.textAlignment = NSTextAlignmentCenter;
//    [self addSubview:_tipLabel];
//    
//    _zenButton = [ZYPositionButton buttonWithType:UIButtonTypeCustom withSpace:0];
//    _zenButton.buttonStyle = ZYPButtonImageTop;
//    _zenButton.padding = 8;
//    [_zenButton setImage:[UIImage imageNamed:@"增值功能zy"] forState:UIControlStateNormal];
//    [_zenButton setTitle:@"增值功能" forState:UIControlStateNormal];
//    [_zenButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    _zenButton.titleLabel.textAlignment = NSTextAlignmentCenter;
//    _zenButton.titleLabel.font = [UIFont systemFontOfSize:14];
//    [_zenButton addTarget:self action:@selector(operationClick:) forControlEvents:(UIControlEventTouchUpInside)];
//    [self addSubview:_zenButton];
//    
//    _orderButton = [ZYPositionButton buttonWithType:UIButtonTypeCustom withSpace:0];
//    _orderButton.buttonStyle = ZYPButtonImageTop;
//    _orderButton.padding = 8;
//    [_orderButton setImage:[UIImage imageNamed:@"订单中心zy"] forState:UIControlStateNormal];
//    [_orderButton setTitle:@"订单中心" forState:UIControlStateNormal];
//    [_orderButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    _orderButton.titleLabel.textAlignment = NSTextAlignmentCenter;
//    _orderButton.titleLabel.font = [UIFont systemFontOfSize:14];
//    [_orderButton addTarget:self action:@selector(operationClick:) forControlEvents:(UIControlEventTouchUpInside)];
//    [self addSubview:_orderButton];
//    
//    _skipButton = [ZYPositionButton buttonWithType:UIButtonTypeCustom withSpace:0];
//    _skipButton.buttonStyle = ZYPButtonImageTop;
//    _skipButton.padding = 8;
//    [_skipButton setImage:[UIImage imageNamed:@"换肤设置zy"] forState:UIControlStateNormal];
//    [_skipButton setTitle:@"换肤设置" forState:UIControlStateNormal];
//    [_skipButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    _skipButton.titleLabel.textAlignment = NSTextAlignmentCenter;
//    _skipButton.titleLabel.font = [UIFont systemFontOfSize:14];
//    [_skipButton addTarget:self action:@selector(operationClick:) forControlEvents:(UIControlEventTouchUpInside)];
//    [self addSubview:_skipButton];
//    
//    _contractButton = [ZYPositionButton buttonWithType:UIButtonTypeCustom withSpace:0];
//    _contractButton.buttonStyle = ZYPButtonImageTop;
//    _contractButton.padding = 8;
//    [_contractButton setImage:[UIImage imageNamed:@"联系客服zy"] forState:UIControlStateNormal];
//    [_contractButton setTitle:@"联系客服" forState:UIControlStateNormal];
//    [_contractButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    _contractButton.titleLabel.textAlignment = NSTextAlignmentCenter;
//    _contractButton.titleLabel.font = [UIFont systemFontOfSize:14];
//    [_contractButton addTarget:self action:@selector(operationClick:) forControlEvents:(UIControlEventTouchUpInside)];
//    [self addSubview:_contractButton];
//    
//}
//
//
//- (void)layoutSubviews {
//    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(0);
//        make.height.equalTo(kNavbarHeight+80);
//    }];
//    
//    [_photoView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(0);
//        make.top.equalTo(11);
//        make.width.height.equalTo(80);
//    }];
//    
//    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.photoView.mas_bottom).offset(11);
//        make.width.equalTo(100);
//        make.height.equalTo(34);
//        make.centerX.equalTo(0);
//    }];
//    
//    [_tipImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.headerView.mas_bottom).offset(-22);
//        make.left.equalTo(23);
//        make.right.equalTo(-23);
//        make.height.equalTo(44);
//    }];
//    
//    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.centerY.width.height.equalTo(self.tipImgView);
//    }];
//    
//    CGFloat margin = SCREEN_WIDTH/375 * 24;
//    [_zenButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.tipImgView.mas_bottom).offset(11);
//        make.width.height.equalTo(60);
//        make.centerX.equalTo(-(60+margin)/2);
//    }];
//    
//    [_orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.top.equalTo(self.zenButton);
//        make.right.equalTo(self.zenButton.mas_left).offset(-margin);
//    }];
//    
//    [_skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.top.equalTo(self.zenButton);
//        make.centerX.equalTo((60+margin)/2);
//    }];
//    
//    [_contractButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.top.equalTo(self.zenButton);
//        make.left.equalTo(self.skipButton.mas_right).offset(margin);
//    }];
//}
//
//- (void)loginClick {
//    
//}
//
//- (void)tapGesture:(UITapGestureRecognizer *)tap {
//    
//}
//
//- (void)operationClick:(UIButton *)sender {
//    
//}
//
//@end
