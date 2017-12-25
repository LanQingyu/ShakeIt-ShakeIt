//
//  LunboTingViewController.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2017/12/22.
//  Copyright © 2017年 Lan's Personal Company. All rights reserved.
//

#import "LunboTingViewController.h"
#import "PhotoListCollectionViewCell.h"
#import "Header.h"

@interface LunboTingViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property(nonatomic, strong)UICollectionView *collectionView;
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
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((ScreenWidth - 4) / 3, (ScreenWidth - 4) / 3);
    flowLayout.minimumInteritemSpacing = 1.5 * FitWidth;
    flowLayout.minimumLineSpacing = 1.8 * FitHeight;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;

    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _collectionView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.scrollEnabled = YES;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[PhotoListCollectionViewCell class] forCellWithReuseIdentifier:@"identifie"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifie" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
//    YHFocusCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"focus" forIndexPath:indexPath];
    return cell;
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
