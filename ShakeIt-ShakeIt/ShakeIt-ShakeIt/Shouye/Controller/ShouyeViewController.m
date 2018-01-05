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
#import "LunboTingViewController.h"
@interface ShouyeViewController ()


@end

@implementation ShouyeViewController
-(UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // 判断前缀
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"ShakeIt-ShakeIt";
//    self.view.backgroundColor = [self colorWithHexString:@"#fa5a0d"];
}
-(void)loadView
{
    [super loadView];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"添加相片" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(addImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button4 setTitle:@"摇一摇" forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont systemFontOfSize:30];
    button4.backgroundColor = [UIColor redColor];
    [button4 addTarget:self action:@selector(shakeItshakeIt) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.mas_bottom).with.offset(50);
        make.centerX.equalTo(self.view);
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
    [self.navigationController pushViewController:[DengluViewController new] animated:YES];
}
-(void)regist
{
    [self.navigationController pushViewController:[ZhuceViewController new] animated:YES];
}
-(void)addImage
{
    [self.navigationController pushViewController:[AddImageViewController new] animated:YES];
}
-(void)shakeItshakeIt
{
    [self.navigationController pushViewController:[LunboTingViewController new] animated:YES];
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
