//
//  PhotoListView.h
//  ShakeIt-ShakeIt
//
//  Created by apple on 2017/12/27.
//  Copyright © 2017年 Lan's Personal Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol pushViewControllerDelegate<NSObject>
-(void)pushViewController;
@end

typedef void (^pushViewControllerBlock)(void);



@interface PhotoListView : UIView<UICollectionViewDelegate, UICollectionViewDataSource>
@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic, assign)id<pushViewControllerDelegate>delegate;
@property(nonatomic, copy)pushViewControllerBlock block;



@end
