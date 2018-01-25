//
//  ZifuchuanViewController.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2018/1/23.
//  Copyright © 2018年 Lan's Personal Company. All rights reserved.
//

#import "ZifuchuanViewController.h"
#import "Header.h"
@interface ZifuchuanViewController ()<UITextViewDelegate>
{
    UITextView *inputView;
    UITextField *inputField;
}
@end

@implementation ZifuchuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    inputField = [UITextField new];
//    inputField.delegate = self;
    [inputField becomeFirstResponder];
    inputField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:inputField];
    [inputField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(50);
        make.size.mas_equalTo(CGSizeMake(250, 50));
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"转一个" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(inputField.mas_bottom).with.offset(50);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    
    inputView = [UITextView new];
    inputView.delegate = self;
    inputView.layer.borderWidth = 1;
    inputView.text = @"在此显示想要复制的内容";
    [self.view addSubview:inputView];
    [inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(button.mas_bottom).with.offset(50);
        make.size.mas_equalTo(CGSizeMake(250, 250));
    }];
    
    
    
    
}
-(void)change{
    NSString *gongxiStr = @"恭喜";
    NSArray *iconArr = @[@"/:handclap", @"/:beer", @"/:strong", @"/:<O>", @"🎉", @"✌️", @"💪", @" 👍", @" 👏"];
    NSString *fuhaoStr = iconArr[arc4random() % iconArr.count];
    NSString *gongxiXXStr = [NSString stringWithFormat:@"%@%@", gongxiStr, inputField.text];
    NSString *finStr = fuhaoStr;
    for (NSInteger i = 1; i < 6; i++) {
        finStr = [finStr stringByAppendingString:fuhaoStr];
        NSLog(@"%@", finStr);
    }
    
    NSString *finStr2 = [gongxiXXStr stringByAppendingString:finStr];
    NSString *finalStr = finStr2;
    for (NSInteger i = 1; i < 6; i++) {
        finalStr = [finalStr stringByAppendingString:finStr2];
        NSLog(@"%@", finalStr);
    }
    
    inputView.text = finalStr;
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    //键盘高度216
    
    //滑动效果（动画）
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@ "ResizeForKeyboard"  context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动，以使下面腾出地方用于软键盘的显示
    self.view.frame = CGRectMake(0.0f, -100.0f, self.view.frame.size.width, self.view.frame.size.height); //64-216
    
    [UIView commitAnimations];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    //键盘高度216
    
    //滑动效果（动画）
    NSTimeInterval animationDuration = 0.20f;
    [UIView beginAnimations:@ "ResizeForKeyboard"  context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动，以使下面腾出地方用于软键盘的显示
    self.view.frame = CGRectMake(0.0f, 64.0f, self.view.frame.size.width, self.view.frame.size.height); //64-216
    
    [UIView commitAnimations];
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
