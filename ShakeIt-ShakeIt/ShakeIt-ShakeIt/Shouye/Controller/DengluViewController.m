//
//  DengluViewController.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2017/12/18.
//  Copyright © 2017年 Lan's Personal Company. All rights reserved.
//

#import "DengluViewController.h"
#import <Masonry.h>
#import "InputUnitVIew.h"
@interface DengluViewController ()

@end

@implementation DengluViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"登录页面";
}
-(void)loadView
{
    [super loadView];
    InputUnitVIew *yonghuming = [InputUnitVIew new];
    yonghuming.backgroundColor = [UIColor blueColor];
    yonghuming.label.text = @"用户名";
    yonghuming.textField.placeholder = @"请输入用户名";
    [self.view addSubview:yonghuming];
    [yonghuming mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(50);
        make.left.equalTo(self.view).with.offset(50);
        make.right.equalTo(self.view).with.offset(-50);
        make.height.mas_equalTo(60);
    }];
    
    InputUnitVIew *mima = [InputUnitVIew new];
    mima.backgroundColor = [UIColor blueColor];
    mima.label.text = @"密码";
    mima.textField.placeholder = @"请输入密码";
    [self.view addSubview:mima];
    [mima mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(yonghuming.mas_bottom).with.offset(5);
        make.left.equalTo(self.view).with.offset(50);
        make.right.equalTo(self.view).with.offset(-50);
        make.height.mas_equalTo(60);
    }];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:25];
    loginButton.backgroundColor = [UIColor redColor];
    [loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.left.equalTo(self.view).with.offset(50);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
    UIButton *rigistButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [rigistButton setTitle:@"注册" forState:UIControlStateNormal];
    rigistButton.titleLabel.font = [UIFont systemFontOfSize:25];
    rigistButton.backgroundColor = [UIColor redColor];
    [rigistButton addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rigistButton];
    [rigistButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(loginButton);
        make.left.equalTo(loginButton.mas_right).with.offset(50);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
    
}
-(void)login
{
    NSLog(@"登录");
}
-(void)regist
{
    NSLog(@"注册");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
