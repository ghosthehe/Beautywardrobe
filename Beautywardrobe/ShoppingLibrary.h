//
//  ShoppingLibrary.h
//  Beautywardrobe
//
//  Created by dfxgd on 15/11/3.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingLibrary : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *_myTable;
}
@end
