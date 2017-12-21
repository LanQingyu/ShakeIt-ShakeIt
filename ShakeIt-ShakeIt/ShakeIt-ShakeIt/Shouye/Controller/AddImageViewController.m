//
//  AddImageViewController.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2017/12/20.
//  Copyright © 2017年 Lan's Personal Company. All rights reserved.
//

#import "AddImageViewController.h"
#import <Masonry.h>


@interface AddImageViewController ()<UIActionSheetDelegate>

@end

@implementation AddImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"登录页面";
}
-(void)loadView
{
    [super loadView];
    [self addButton];
    
    UIImageView *imageView = [UIImageView new];
    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(50);
        make.right.equalTo(self.view).with.offset(-50);
        make.top.equalTo(self.view).with.offset(20);
        make.height.equalTo(@400);
    }];
    
}
-(void)addButton
{
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [addButton setTitle:@"添加" forState:UIControlStateNormal];
    addButton.titleLabel.font = [UIFont systemFontOfSize:25];
    addButton.backgroundColor = [UIColor redColor];
    [addButton addTarget:self action:@selector(pickerImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(50);
        make.left.equalTo(self.view).with.offset(50);
        make.right.equalTo(self.view).with.offset(-50);
        make.bottom.equalTo(addButton.mas_top).with.offset(-50);
        make.height.equalTo(@50);
    }];
    
}
- (void)pickerImage:(UIButton *)button
{
    NSLog(@"添加");
    UIAlertController *alert = [UIAlertController new];
    [alert addAction:[UIAlertAction actionWithTitle:@"用相机拍摄" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"拍摄照片");

    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"从手机相册选择");
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
