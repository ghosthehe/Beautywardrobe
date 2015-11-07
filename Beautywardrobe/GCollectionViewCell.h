//
//  GCollectionViewCell.h
//  Beautywardrobe
//
//  Created by dfxgd on 15/11/6.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *loveBtn;
@property (weak, nonatomic) IBOutlet UILabel *loveNumLabel;

@end
