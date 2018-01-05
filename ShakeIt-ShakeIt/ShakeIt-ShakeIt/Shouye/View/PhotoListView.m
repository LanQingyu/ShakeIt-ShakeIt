//
//  PhotoListView.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2017/12/27.
//  Copyright © 2017年 Lan's Personal Company. All rights reserved.
//

#import "PhotoListView.h"
#import "PhotoListCell.h"
#import "Header.h"
#import <Masonry.h>


@implementation PhotoListView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake((ScreenWidth - 4) / 3, (ScreenWidth - 4) / 3);
        flowLayout.minimumInteritemSpacing = 1.5 * FitWidth;
        flowLayout.minimumLineSpacing = 1.8 * FitHeight;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:self.frame collectionViewLayout:flowLayout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.scrollEnabled = YES;
        [self addSubview:_collectionView];
        [_collectionView registerClass:[PhotoListCell class] forCellWithReuseIdentifier:@"identifie"];
        _dataArray = [NSMutableArray array];
        
//        if (!_dataArray) {
//            NSArray *array = @[@"1", @"2", @"3", @"4"];
//            NSArray *array = @[@"1", @"2", @"3"];
//            NSArray *array = @[];
//            _dataArray = [NSMutableArray arrayWithArray:array];
//            _dataArray = [NSMutableArray array];
//        }
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifie" forIndexPath:indexPath];
    cell.backgroundColor = LRRandomColor;

    if (indexPath.row == _dataArray.count) {
        cell.imageView.image = kGetImage(@"未点击");
        cell.imageView.highlightedImage = kGetImage(@"点击状态");
    }
    else{
        cell.imageView.image = _dataArray[indexPath.row];
        cell.imageView.highlightedImage = _dataArray[indexPath.row];
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _dataArray.count) {
        self.block();
    }else{

    
    }
}
-(void)setIsReloadData:(BOOL)isReloadData
{
    [_collectionView reloadData];
}



@end
