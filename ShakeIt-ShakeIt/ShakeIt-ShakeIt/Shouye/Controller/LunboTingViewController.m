//
//  LunboTingViewController.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2017/12/22.
//  Copyright © 2017年 Lan's Personal Company. All rights reserved.
//

#import "Header.h"
#import "LunboTingViewController.h"
#import "PhotoListView.h"

@interface LunboTingViewController ()<pushViewControllerDelegate>
@property(nonatomic, strong)PhotoListView *photoListView;
@end

@implementation LunboTingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"摇呗";

}
-(void)loadView
{
    [super loadView];
    [self createViews];
}
- (void)createViews
{
    _photoListView = [[PhotoListView alloc]initWithFrame:self.view.frame];
    _photoListView.delegate = self;
    __block LunboTingViewController *VC = self;
    void(^pushViewControllerBlock)(void) = ^(){
        [VC woshishei];
    };
    _photoListView.block = pushViewControllerBlock;
    _photoListView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_photoListView];
}

-(void)pushViewController
{
    NSLog(@"看看");
}
-(void)woshishei
{
    NSLog(@"爱谁谁");
}
















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
