//
//  ShoppingLibrary.m
//  Beautywardrobe
//
//  Created by dfxgd on 15/11/3.
//  Copyright (c) 2015年 zhiyou. All rights reserved.
//

#import "ShoppingLibrary.h"

#import "ShoppingCell1.h"
#import "ShoppingCell2.h"
@interface ShoppingLibrary ()
{
    NSMutableArray *_dataArr;
}
@end

@implementation ShoppingLibrary

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"购物车";
    
    [_myTable registerNib:[UINib nibWithNibName:@"ShoppingCell1" bundle:nil] forCellReuseIdentifier:@"cell1"];
    
    [_myTable registerNib:[UINib nibWithNibName:@"ShoppingCell2" bundle:nil] forCellReuseIdentifier:@"cell2"];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShoppingCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    cell.myImageView.image = [UIImage imageNamed:@"Shopping_Cart_Empty.png"];
    return cell;
}
@end
