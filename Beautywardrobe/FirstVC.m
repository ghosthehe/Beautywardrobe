//
//  FirstVC.m
//  
//
//  Created by dfxgd on 15/11/3.
//
//

#import "FirstVC.h"
#import "View1.h"
#import "View2.h"
@interface FirstVC ()
{
    UIScrollView *titleScr;
    UIView *lineView;
    UIScrollView *_biggistScr;
    UIPageControl *_pageControl;
    UIScrollView *_littleScr;
    NSTimer *_timer;
    NSArray *array;

}
@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"美丽衣橱";

    self.automaticallyAdjustsScrollViewInsets = NO;

    [self creatBiggistScr];

    [self creatTitleScrAndBar];
    
    [self createTopBtn];
    
}
#pragma mark ---topBtn
-(void)createTopBtn
{
    _topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _topBtn.frame = CGRectMake(310, 667 - 130, 50, 50);
    [_topBtn setImage:[UIImage imageNamed:@"go_top_btn.png"] forState:UIControlStateNormal];
    [_topBtn addTarget:self action:@selector(topBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark --- 创建大得Scr
-(void)creatBiggistScr
{
    _biggistScr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 104, 375, 487)];
    _biggistScr.tag = 120;
    _biggistScr.contentSize = CGSizeMake(375 * 18, 487);
    _biggistScr.pagingEnabled = YES;
    _biggistScr.alwaysBounceHorizontal = NO;
    _biggistScr.alwaysBounceVertical = NO;
    _biggistScr.delegate = self;
    for (int i = 0; i < 18; i ++)
    {
        if (i == 0)
        {
            UIScrollView *contentScr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 375, 487)];
            contentScr.alwaysBounceHorizontal = NO;
            contentScr.alwaysBounceVertical = YES;
            contentScr.autoresizingMask = NO;
            contentScr.bounces = YES;
            contentScr.bouncesZoom = NO;
            contentScr.delegate = self;
            contentScr.contentSize = CGSizeMake(375, 440 + (667 - 104 - 75));
            contentScr.tag = 130;
            [_biggistScr addSubview:contentScr];
            [self writeContentInContentScr:contentScr with:i];

        }
        else
        {
            self.myCollectionView = [self creatCollectionWithHeight:0 with:i];
            self.myCollectionView.tag = 100;
            [_biggistScr addSubview:self.myCollectionView];
            
        }
        
    }
    [self.view addSubview:_biggistScr];

}
#pragma mark --- 瀑布流
-(UICollectionView*)creatCollectionWithHeight:(CGFloat)height with:(int)i;
{
    array = @[@150,@190,@350,@250,@80,@50,@150,@500,@100,@356,@59,@50,@150,@10,@120,@137,@148,@150,@90,@30,@60,@200,@210,@207,@130,@150,@40,@250,@50];
    
    CustomLayout *layout = [[CustomLayout alloc] init];
    UICollectionView *myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(375 * i, height, 375, _biggistScr.frame.size.height) collectionViewLayout:layout];
    myCollectionView.backgroundColor = [UIColor whiteColor];
    myCollectionView.dataSource = self;
    myCollectionView.delegate = self;
    [myCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

    return myCollectionView;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return array.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    UIColor *color = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
    
    cell.backgroundColor = color;
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //CGFloat height = [[array objectAtIndex:indexPath.row] floatValue];
    if (indexPath.row == 0)
    {
        CGSize size = CGSizeMake(170, 60);
        
        return size;
    }
    else
    {
        CGSize size = CGSizeMake(170, 230);
        
        return size;
    }
    
}


#pragma mark --- 第一个contentScr上的内容
-(void)writeContentInContentScr:(UIScrollView*)contentScr with:(int)i
{
    _littleScr = [self writeFirstScr];
    [contentScr addSubview:_littleScr];
    
    _pageControl = [self createPageConrol];
    [contentScr addSubview:_pageControl];
    
    View1 *view1 = [[View1 alloc]initWithFrame:CGRectMake(0, 210, 375, 60)];
    [contentScr addSubview:view1];
    
    View2 *view2 = [[View2 alloc]initWithFrame:CGRectMake(0, 270, 370, 170)];
    view2.backgroundColor = [UIColor redColor];
    [contentScr addSubview:view2];
    
    self.firstCollectionView = [self creatCollectionWithHeight:440 with:i];
    self.firstCollectionView.tag = 90;
    [contentScr addSubview:self.firstCollectionView];

    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changePageOfPageControl) userInfo:nil repeats:YES];
}
-(UIScrollView*)writeFirstScr
{
    UIScrollView *littleScr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 375, 210)];
    littleScr.alwaysBounceHorizontal = YES;
    littleScr.alwaysBounceVertical = NO;
    littleScr.pagingEnabled = YES;
    littleScr.contentSize = CGSizeMake(375 * 6, 210);
    littleScr.delegate = self;
    littleScr.tag = 140;
    for (int i = 0; i < 6; i ++)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(375 * i, 0, 375, 210)];
        imageView.backgroundColor = [UIColor redColor];
        [littleScr addSubview:imageView];
    }
    return littleScr;
}

-(UIPageControl*)createPageConrol
{
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(130, 180, 120, 20)];
    pageControl.numberOfPages = 6;
    pageControl.currentPage = 0;
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [pageControl addTarget:self action:@selector(changeLittleScr) forControlEvents:UIControlEventValueChanged];
    return pageControl;
}
-(void)changeLittleScr
{
    _littleScr.contentOffset = CGPointMake(375 * _pageControl.currentPage, 0);
    
}
-(void)changePageOfPageControl
{
    static int count = 0;
    _pageControl.currentPage = count;
    _littleScr.contentOffset = CGPointMake(375 * count, 0);
    count ++;
    if (count == 6)
    {
        count = 0;
    }
    
}
#pragma mark --- 创建标题Scr
-(void)creatTitleScrAndBar
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(searchItemClick)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    NSArray *titleArr = [[NSArray alloc]initWithObjects:@"推荐",@"青春",@"淑女",@"女鞋",@"配饰",@"女包",@"泳装",@"内衣",@"婚礼",@"大码",@"老公",@"妈妈",@"爸爸",@"孕妇",@"男孩",@"女孩",@"生活",@"护肤", nil];
    titleScr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, 375, 40)];
    titleScr.delegate = self;
    titleScr.tag = 110;
    _titleBtnArr = [[NSMutableArray alloc]init];
    for (int i = 0; i < titleArr.count; i ++)
    {
        UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        titleBtn.frame = CGRectMake(5 + (50 + 5) * i, 2, 50, 35);
        [titleBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        [titleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        titleBtn.tag = i + 1;
        [titleScr addSubview:titleBtn];
        [_titleBtnArr addObject:titleBtn];
        if (i == 0)
        {
            lineView = [[UIView alloc]init];
            lineView.backgroundColor = [UIColor redColor];
            [titleScr addSubview:lineView];
            [self retainLine:titleBtn];
        }
        
    }
    titleScr.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    titleScr.alwaysBounceHorizontal = NO;
    titleScr.alwaysBounceVertical = NO;
    titleScr.contentSize = CGSizeMake(55 * 18 + 10, 40);
    [self.view addSubview:titleScr];
    
    _totleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _totleBtn.frame = CGRectMake(335, 65, 40, 40);
    [_totleBtn setImage:[UIImage imageNamed:@"blueArrow.png"] forState:UIControlStateNormal];
    [_totleBtn addTarget:self action:@selector(goToTotalBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _totleBtn.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    [self.view addSubview:_totleBtn];
    [self.view bringSubviewToFront:_totleBtn];
}
-(void)goToTotalBtnClick
{
    static int count = 0;
    count ++;
    if (count % 2 == 1)
    {
        
    }
}
#pragma mark --- 标题按钮
-(void)titleBtnClick:(UIButton *)btn
{
    [self retainLine:btn];
    
    _biggistScr.contentOffset = CGPointMake((btn.tag - 1) * 375, 0);
    
}
#pragma mark--- scr滑动代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 120)
    {
        int page = scrollView.contentOffset.x / 375;
        UIButton *titleBtn = _titleBtnArr[page];
        [self retainLine:titleBtn];
        if (page > 3)
        {
            [UIView animateWithDuration:0.3 animations:^{
                titleScr.contentOffset = CGPointMake(55 * (page - 3), 0);

            }];
        }
    }
    if (scrollView.tag == 130)
    {
        scrollView.alwaysBounceHorizontal = YES;
        _a = scrollView.contentOffset.y;

    }
    if (scrollView.tag == 100)
    {
        _a = scrollView.contentOffset.y;
    }
    if (scrollView.tag == 90)
    {
        _a = scrollView.contentOffset.y;
    }
    if (scrollView.tag == 140)
    {
       int page = _littleScr.contentOffset.x / 375;
        _pageControl.currentPage = page;
    }
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView.tag == 130)
    {
        scrollView.alwaysBounceHorizontal = NO;
    }
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.tag == 130 || scrollView.tag == 100 || scrollView.tag == 90)
    {
        int a = scrollView.contentOffset.y;
        NSLog(@"%d",a);
        if (a > 80)
        {
            [UIView animateWithDuration:1 animations:^{
                
                titleScr.frame = CGRectMake(0, 25, 375, 40);
                _biggistScr.frame = CGRectMake(0, 65, 375, 487 + 40);
            
                _totleBtn.frame = CGRectMake(335, 25, 40, 40);

            }];
        }
        if ((_a - a) > 50)
        {
            [UIView animateWithDuration:1 animations:^{
                
                titleScr.frame = CGRectMake(0, 65, 375, 40);
                _biggistScr.frame = CGRectMake(0, 104, 375, 487);
                _totleBtn.frame = CGRectMake(335, 65, 40, 40);


                
            }];
        }
        if (a > 0)
        {
            [self.view addSubview:_topBtn];
            [self.view bringSubviewToFront:_topBtn];

        }
        if (a < 0 || a == 0)
        {
            [_topBtn removeFromSuperview];

        }
    }
    
}

-(void)topBtnClick
{
    self.myCollectionView.contentOffset = CGPointMake(0, - 1000);
}
#pragma mark --- 标题scr的下滑label
-(void)retainLine:(UIButton*)btn
{
    [UIView animateWithDuration:0.5 animations:^{
        lineView.center = CGPointMake(btn.center.x, btn.frame.size.height);
        lineView.bounds = CGRectMake(0, btn.frame.size.height +2, btn.frame.size.width, 2);
    }];
}
#pragma mark --- 搜索按钮
-(void)searchItemClick
{
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_timer invalidate];
}

@end