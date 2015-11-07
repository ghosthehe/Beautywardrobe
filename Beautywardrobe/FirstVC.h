//
//  FirstVC.h
//  
//
//  Created by dfxgd on 15/11/3.
//
//

#import <UIKit/UIKit.h>
#import "CustomLayout.h"
@interface FirstVC : UIViewController<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,WaterFlowLayoutDelegate>
{
    NSMutableArray *_titleBtnArr;
    int _a;
    UIButton *_topBtn;
    UIButton *_totleBtn;
    NSMutableArray *_imageUrlArr;
}

@property(nonatomic,unsafe_unretained)int a;
@property(nonatomic,strong)UICollectionView *firstCollectionView;
@property(nonatomic,strong)UICollectionView *myCollectionView;
@property(nonatomic,strong)UICollectionView *selCollectionView;

@end
