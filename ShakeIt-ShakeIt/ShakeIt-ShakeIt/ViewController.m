//
//  ViewController.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2017/12/4.
//  Copyright © 2017年 Lan's Personal Company. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationItem setBackBarButtonItem:[[UIBarButtonItem alloc]initWithTitle:nil style:UIBarButtonItemStylePlain target:nil action:nil]];
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
