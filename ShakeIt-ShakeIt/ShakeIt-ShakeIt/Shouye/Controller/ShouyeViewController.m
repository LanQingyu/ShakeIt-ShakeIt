//
//  ShouyeViewController.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2017/12/18.
//  Copyright © 2017年 Lan's Personal Company. All rights reserved.
//

#import "ShouyeViewController.h"
#import <Masonry.h>

#import "DengluViewController.h"
#import "ZhuceViewController.h"
#import "AddImageViewController.h"
@interface ShouyeViewController ()


@end

@implementation ShouyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"ShakeIt-ShakeIt";
}
-(void)loadView
{
    [super loadView];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"添加相片" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button2 setTitle:@"登录" forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:25];
    button2.backgroundColor = [UIColor redColor];
    [button2 addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(50);
        make.top.equalTo(self.view).with.offset(50);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button3 setTitle:@"注册" forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:25];
    button3.backgroundColor = [UIColor redColor];
    [button3 addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).with.offset(-50);
        make.top.equalTo(self.view).with.offset(50);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
}
-(void)login
{
    NSLog(@"登录");
    [self.navigationController pushViewController:[DengluViewController new] animated:YES];
}
-(void)regist
{
    NSLog(@"注册");
    [self.navigationController pushViewController:[ZhuceViewController new] animated:YES];
}
-(void)clickButton
{
    NSLog(@"添加照片");
    [self.navigationController pushViewController:[AddImageViewController new] animated:YES];
}

//+(NSString *)MD5ForLower32Bate:(NSString *)str{
//    const char* input = [str UTF8String];
//    unsigned char result[CC_MD5_DIGEST_LENGTH];
//    CC_MD5(input, (CC_LONG)strlen(input), result);
//
//    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
//    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
//        [digest appendFormat:@"%02x", result[i]];
//    }
//
//    return digest;
//}


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
