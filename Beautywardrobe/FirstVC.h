//
//  FirstVC.h
//  
//
//  Created by dfxgd on 15/11/3.
//
//

#import <UIKit/UIKit.h>
#import "CustomLayout.h"
#import "MBProgressHUD.h"
@interface FirstVC : UIViewController<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,WaterFlowLayoutDelegate>
{
    NSMutableArray *_titleBtnArr;
    int _a;
    UIButton *_topBtn;
    MBProgressHUD *_progressHUD;
    UIButton *_totleBtn;
}
@property(nonatomic,strong)UICollectionView *firstCollectionView;
@property(nonatomic,strong)UICollectionView *myCollectionView;
@property(nonatomic,strong)UICollectionView *selCollectionView;

@end
