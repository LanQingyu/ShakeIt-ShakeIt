//
//  YaoViewController.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2018/1/9.
//  Copyright © 2018年 Lan's Personal Company. All rights reserved.
//

#import "YaoViewController.h"
#import "Header.h"
@interface YaoViewController ()

@property(nonatomic, strong)UIScrollView *scrollView;

@end

@implementation YaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", _dataArray);
    
     [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithTitle:@"开始" style:UIBarButtonItemStylePlain target:self action:@selector(begin)]];
    
}
-(void)begin
{
    NSLog(@"开始");
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01   target:self selector:@selector(change) userInfo:nil repeats:YES];
    
}
-(void)change{
    NSInteger i = arc4random() % _dataArray.count;
    _scrollView.contentOffset = CGPointMake(ScreenWidth * i, 0);
}
-(void)loadView
{
    [super loadView];
    _scrollView = [[UIScrollView alloc]initWithFrame:ScreenFrame];
    _scrollView.contentSize = CGSizeMake(ScreenWidth * _dataArray.count, ScreenHeight);
    _scrollView.contentOffset = CGPointMake(0, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    
    for (NSInteger i = 0; i < _dataArray.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i * ScreenWidth, 0, ScreenWidth, ScreenHeight)];
//        imageView.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() %256 / 255.0 alpha:1];
        imageView.backgroundColor = [UIColor blackColor];
        imageView.image = _dataArray[i];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_scrollView addSubview:imageView];
    }
    
    [self.view addSubview:_scrollView];
    
}

-(void)getImage
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
