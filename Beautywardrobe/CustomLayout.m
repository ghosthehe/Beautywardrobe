//
//  CustomLayout.m
//  瀑布流
//
//  Created by broncho on 15/11/3.
//  Copyright (c) 2015年 夏贝贝. All rights reserved.
//

#import "CustomLayout.h"

@interface CustomLayout (){

    float _x;
    float _leftY;
    float _rightY;
    
    float _tleftY;
    float _trightY;

}

@end

@implementation CustomLayout

-(void)prepareLayout{
    [super prepareLayout];
    
    self.itemWidth = 175;
    self.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    self.delegate = (id<WaterFlowLayoutDelegate>)self.collectionView.delegate;
    self.cellCount =[[self collectionView] numberOfItemsInSection:0];
   // NSLog(@"%d",self.cellCount);

}

-(CGSize)collectionViewContentSize{

    return CGSizeMake(320, (_leftY>_rightY?_leftY:_rightY));
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{

    _x = 0;
    _leftY = 0;
    _rightY =0;
    
    NSMutableArray *attributes = [NSMutableArray array];
    
    for (int i = 0 ; i<self.cellCount; i++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [attributes addObject:attribute];
        
    }
    return attributes;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CGSize itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    
    CGFloat itemHeight = itemSize.height;
    
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //NSLog(@"%f~~~%f",_leftY,_rightY);
    
    if (_rightY<_leftY) {
        
        _x = (self.itemWidth+3*self.sectionInset.left);
        _rightY += self.sectionInset.top;
        
        attribute.frame = CGRectMake(_x, _rightY, self.itemWidth, itemHeight);
        
        _rightY += itemHeight;
        
    }else{
    
        _x = self.sectionInset.left;
        
        _leftY += self.sectionInset.top;
        
        attribute.frame = CGRectMake(_x, _leftY, self.itemWidth, itemHeight);
        
        _leftY += itemHeight;
    }

    return attribute;
}

@end
