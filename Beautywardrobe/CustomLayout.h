//
//  CustomLayout.h
//  瀑布流
//
//  Created by broncho on 15/11/3.
//  Copyright (c) 2015年 夏贝贝. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllHeader.pch"
@protocol WaterFlowLayoutDelegate <UICollectionViewDelegate>
@required

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CustomLayout : UICollectionViewLayout

@property(nonatomic,assign)CGFloat itemWidth;
@property(nonatomic,assign)NSInteger cellCount;
@property(nonatomic,assign)UIEdgeInsets sectionInset;
@property(nonatomic,assign)id<WaterFlowLayoutDelegate> delegate;


@end
