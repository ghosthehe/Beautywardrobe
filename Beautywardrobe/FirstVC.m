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
#import "AllHeader.pch"
#import "UIImageView+Addition.h"
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
    
    //@"http://api.yuike.com/beautymall/api/1.0/product/quality.php?cursor=0&yk_pid=1&yk_cbv=2.8.4.2&count=40&yk_user_id=2061882&yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&type=choice"
    
}
#pragma mark ---topBtn
-(void)createTopBtn
{
    _topBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _topBtn.frame = CGRectMake(mainScreen_width - 60, mainScreen_height - (mainScreen_width / 5 + 55), 50, 50);
    [_topBtn setImage:[UIImage imageNamed:@"go_top_btn.png"] forState:UIControlStateNormal];
    [_topBtn addTarget:self action:@selector(topBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark --- 创建大得Scr
-(void)creatBiggistScr
{
    _biggistScr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, mainScreen_width, mainScreen_height - 64 - 75)];
    _biggistScr.tag = 120;
    _biggistScr.contentSize = CGSizeMake(mainScreen_width * 18, mainScreen_height - 64 - 75);
    _biggistScr.pagingEnabled = YES;
    _biggistScr.alwaysBounceHorizontal = NO;
    _biggistScr.alwaysBounceVertical = NO;
    _biggistScr.delegate = self;
    for (int i = 0; i < 18; i ++)
    {
        if (i == 0)
        {
            UIScrollView *contentScr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, mainScreen_width, mainScreen_height - 64 - (mainScreen_width / 5))];
            contentScr.alwaysBounceHorizontal = NO;
            contentScr.alwaysBounceVertical = YES;
            contentScr.autoresizingMask = NO;
            contentScr.bounces = YES;
            contentScr.bouncesZoom = NO;
            contentScr.delegate = self;
            contentScr.contentSize = CGSizeMake(mainScreen_width,(mainScreen_height - 64 - (mainScreen_width / 5) + 400));
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
    UICollectionView *myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(mainScreen_width * i, height, mainScreen_width, _biggistScr.frame.size.height) collectionViewLayout:layout];
    myCollectionView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.9];
    myCollectionView.dataSource = self;
    myCollectionView.delegate = self;
    [myCollectionView registerNib:[UINib nibWithNibName:@"GCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    [myCollectionView registerNib:[UINib nibWithNibName:@"GCollectionViewCell0" bundle:nil] forCellWithReuseIdentifier:@"cell0"];

    //注册表头表尾myCollectionView registerClass:<#(__unsafe_unretained Class)#> forSupplementaryViewOfKind:<#(NSString *)#> withReuseIdentifier:<#(NSString *)#>
    //用于系统创建[myCollectionView registerClass:[GCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

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
    

    if (indexPath.row == 0)
    {
        GCollectionViewCell0 *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell0" forIndexPath:indexPath];
        cell.backgroundColor = CustomColor(240.0f,111.0f,191.0f,1);
        return cell;
    }
    else
    {
        GCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

        ///防止内容重用
        cell.bgView.image = [UIImage imageNamed:@""];
        if(indexPath.row == 1)
        {
            cell.backgroundColor = [UIColor redColor];
        }
        else
        {
            cell.backgroundColor = [UIColor whiteColor];
            cell.bgView.image = [UIImage imageNamed:@"6446027056db8afa73b23eaf953dadde1410240902.jpg"];
            cell.priceLabel.textColor = CustomColor(240.0f,111.0f,191.0f,1);
        }
        return cell;
    }
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
    
    View1 *view1 = [[View1 alloc]initWithFrame:CGRectMake(0, 170, mainScreen_width, 60)];
    [contentScr addSubview:view1];
    
    View2 *view2 = [[View2 alloc]initWithFrame:CGRectMake(0, 230, mainScreen_width, 170)];
    [contentScr addSubview:view2];
    
    self.firstCollectionView = [self creatCollectionWithHeight:400 with:i];
    self.firstCollectionView.tag = 90;
    [contentScr addSubview:self.firstCollectionView];

    _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(changePageOfPageControl) userInfo:nil repeats:YES];

}
#pragma mark --- 6张图片的Scr
-(UIScrollView*)writeFirstScr
{
    UIScrollView *littleScr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, mainScreen_width, 210)];
    littleScr.alwaysBounceHorizontal = YES;
    littleScr.alwaysBounceVertical = NO;
    littleScr.pagingEnabled = YES;
    littleScr.contentSize = CGSizeMake(mainScreen_width * 6, 210);
    littleScr.delegate = self;
    littleScr.tag = 140;
    FirstRequest *fre = [FirstRequest shareFirstRequest];
    [fre get6ImageUrlWithUrlString:@"http://api.yuike.com/beautymall/api/1.0/client/banner_list.php?yk_appid=1&sid=6b94d8ee8b05caffc4b7c361c0f979f5&yk_pid=1&yk_cbv=2.8.4.2"];
    fre.sixImageBlock = ^(NSDictionary *dic)
    {
        NSArray *arr = [dic objectForKey:@"data"];
        for (int i = 0; i < arr.count; i ++)
        {
            NSDictionary *imaDic = arr[i];
            NSString *str = [imaDic objectForKey:@"pic_url"];
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(mainScreen_width * i, 0, mainScreen_width, mainScreen_height * 210 / 667)];
            [imageView setGImageUrlWithString:str];
            [littleScr addSubview:imageView];
        }
    };
    return littleScr;
}

-(UIPageControl*)createPageConrol
{
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(mainScreen_width / 2 - 60, 140, 120, 20)];
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
    _littleScr.contentOffset = CGPointMake(mainScreen_width * count, 0);
    count ++;
    if (count == 5)
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
    titleScr = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, mainScreen_width, 40)];
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
    _totleBtn.frame = CGRectMake(mainScreen_width - 40, 65, 40, 40);
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
    
    _biggistScr.contentOffset = CGPointMake((btn.tag - 1) * mainScreen_width, 0);
    
}
#pragma mark--- scr滑动代理方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag == 120)
    {
        int page = scrollView.contentOffset.x / mainScreen_width;
        UIButton *titleBtn = _titleBtnArr[page];
        [self retainLine:titleBtn];
        [UIView animateWithDuration:3 animations:^{
            titleScr.frame = CGRectMake(0, 65, mainScreen_width, 40);

        }];

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
        self.a = scrollView.contentOffset.y;

    }
    if (scrollView.tag == 100)
    {
        self.a = scrollView.contentOffset.y;
    }
    if (scrollView.tag == 90)
    {
       self.a = scrollView.contentOffset.y;
    }
    if (scrollView.tag == 140)
    {
       int page = _littleScr.contentOffset.x / mainScreen_width;
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
        if (a > 30)
        {
            [UIView animateWithDuration:1 animations:^{
                
                titleScr.frame = CGRectMake(0, 25, mainScreen_width, 40);
                _biggistScr.frame = CGRectMake(0, 65, mainScreen_width, (mainScreen_height - 64 - mainScreen_width / 5));
            
                _totleBtn.frame = CGRectMake(mainScreen_width - 40, 25, 40, 40);

            }];
        }
        if ((self.a - a) > 20)
        {
            [UIView animateWithDuration:1 animations:^{
                
                titleScr.frame = CGRectMake(0, 65, mainScreen_width, 40);
                _biggistScr.frame = CGRectMake(0, 65, mainScreen_width, (mainScreen_height - 64 - mainScreen_width / 5));
                _totleBtn.frame = CGRectMake(mainScreen_width - 40, 65, 40, 40);


                
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