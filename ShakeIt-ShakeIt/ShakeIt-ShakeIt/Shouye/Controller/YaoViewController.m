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
{
    NSInvocation * invo;
}

@property(nonatomic, strong)UIScrollView *scrollView;
@property(nonatomic, assign)NSInteger i;
@property(nonatomic, strong)UIBarButtonItem *beginItem;
@property(nonatomic, strong)UIBarButtonItem *stopItem;
@property(nonatomic, strong)NSTimer *timer;



@end

@implementation YaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"摇起来";
    _beginItem = [[UIBarButtonItem alloc]initWithTitle:@"开始" style:UIBarButtonItemStylePlain target:self action:@selector(begin)];
    _stopItem = [[UIBarButtonItem alloc]initWithTitle:@"停" style:UIBarButtonItemStylePlain target:self action:@selector(begin)];
    self.navigationItem.rightBarButtonItem = _beginItem;
    _i = 1;
    invo = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:@selector(init)]];
    [invo setTarget:self];
    [invo setSelector:@selector(change)];
    //加入主循环池中
    
}
-(void)begin
{
    
//    _timer = [NSTimer scheduledTimerWithTimeInterval:0.001   target:self selector:@selector(change) userInfo:nil repeats:YES];
//    _timer = [NSTimer timerWithTimeInterval:0.001 target:self selector:@selector(change) userInfo:nil repeats:YES];
    if (_i == 1) {
        _timer = [NSTimer timerWithTimeInterval:0.001 invocation:invo repeats:YES];
        [[NSRunLoop mainRunLoop]addTimer:_timer forMode:NSDefaultRunLoopMode];
        [_timer fire];
        NSLog(@"开始");
        self.navigationItem.rightBarButtonItem = _stopItem;
        _i = 0;
    }
    else{
        [_timer invalidate];
        NSLog(@"停");
        self.navigationItem.rightBarButtonItem = _beginItem;
        _i = 1;
    }
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
