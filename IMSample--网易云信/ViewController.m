//
//  ViewController.m
//  IMSample-网易云信
//
//  Created by zero on 2017/3/15.
//  Copyright © 2017年 zero-zhou. All rights reserved.
//

#import "ViewController.h"
#import "RHSessionViewController.h"
#import "NIMKit.h"

#define NIMMyAccount   @"lilei"
#define NIMMyToken     @"123456"
#define NIMChatTarget  @"hanmeimei"

@interface ViewController ()
@property (nonatomic,strong) UIButton *signBtn;//

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.signBtn];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)loginAction:(UIButton *)btn{
    //请将 NIMMyAccount 以及 NIMMyToken 替换成您自己提交到此App下的账号和密码
    [[NIMSDK sharedSDK].loginManager login:NIMMyAccount token:NIMMyToken completion:^(NSError *error) {
        if (!error) {
            NSLog(@"登录成功");
            //创建session,这里聊天对象预设为韩梅梅，此账号也是事先提交到此App下的
            NIMSession *session = [NIMSession session:NIMChatTarget type:NIMSessionTypeP2P];

//            NIMSessionViewController *vc = [[NIMSessionViewController alloc] initWithSession:session];
//            [self.navigationController pushViewController:vc animated:YES];
            
//            RHSessionViewController *vc = [[RHSessionViewController alloc] initWithSession:session];
//            [self.navigationController pushViewController:vc animated:YES];
            NIMSessionListViewController *vc = [[NIMSessionListViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else{
            NSLog(@"登录失败");
        }
    }];
}

- (UIButton *)signBtn{
    if (!_signBtn) {
        _signBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _signBtn.size = CGSizeMake(80, 30);
        _signBtn.center = self.view.center;
        [_signBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_signBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _signBtn;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
