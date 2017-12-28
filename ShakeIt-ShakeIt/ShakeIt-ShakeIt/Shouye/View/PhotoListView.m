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
    }
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"identifie" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate pushViewController];
    self.block();
    NSLog(@"%ld", indexPath.row);
}


@end
