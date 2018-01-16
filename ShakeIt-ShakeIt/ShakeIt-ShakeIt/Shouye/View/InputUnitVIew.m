//
//  InputUnitVIew.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2017/12/18.
//  Copyright © 2017年 Lan's Personal Company. All rights reserved.
//

#import "InputUnitVIew.h"
#import "Header.h"
@implementation InputUnitVIew

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _label = [UILabel new];
        _label.backgroundColor = [UIColor redColor];
        [self addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(5);
            make.top.equalTo(self).with.offset(5);
            make.size.mas_equalTo(CGSizeMake(70, 50));
        }];
        
        _textField = [UITextField new];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_label.mas_right).with.offset(5);
            make.top.equalTo(self).with.offset(5);
            make.size.mas_equalTo(CGSizeMake(200, 50));
        }];
    }
    return self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
//    UITextField *t1 = (UITextField *)[self.window viewWithTag:1000];
//    [t1 resignFirstResponder];
//    UITextField *t2 = (UITextField *)[self.window viewWithTag:1001];
//    [t2 becomeFirstResponder];
    return YES;
}

@end
