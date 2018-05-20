//
//  ViewController.m
//  自定义的Cell
//
//  Created by 郭丰锐 on 2018/3/29.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

#define CELLIDENT @"cellID"
#define screenW self.view.frame.size.width
#define screenH self.view.frame.size.height
#define numImageCount 3
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property(strong, nonatomic)UITableView* tableView;
@property(strong, nonatomic)NSDictionary* dataSource;
@property(strong, nonatomic)UILabel* timess;
@property(strong, nonatomic)UIScrollView* scrollView;
@property(strong, nonatomic)UIPageControl* pageControl;
@property(strong, nonatomic)NSTimer* timer;
@property(strong, nonatomic)UIView* headerView;

@end

@implementation ViewController

- (NSDictionary *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSDictionary dictionary];
        NSString* path = [[NSBundle mainBundle]pathForResource:@"home_data" ofType:@"plist"];
        
        _dataSource = [NSDictionary dictionaryWithContentsOfFile:path];
        
        
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, 150)];
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = _headerView;
    [self.view addSubview:_tableView];
    
    [self scroll];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)scroll{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    CGFloat scrollViewW = screenW;
    scrollView.frame = CGRectMake(0, 0, scrollViewW,180);
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(scrollViewW*numImageCount, 0);
    scrollView.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    self.scrollView = scrollView;
    
    for (int i = 0; i < numImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        CGFloat imageViewY = 0;
        CGFloat imageViewW = scrollViewW;
        CGFloat imageViewH = 150;
        CGFloat imageViewX = i * imageViewW;
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
        
        NSString *name = [NSString stringWithFormat:@"news-%d",i+1];
        imageView.image = [UIImage imageNamed:name];
        [self.scrollView addSubview:imageView];
        [self.headerView addSubview:scrollView];
       
    }
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    CGFloat pageW = 60;
    CGFloat pageH = 100;
    CGFloat pageX = screenW /2- pageW/2;
    CGFloat pageY = 110;
    pageControl.frame = CGRectMake(pageX, pageY, pageW, pageH);
    //设置pagecontrol的总页数
    pageControl.numberOfPages = 3;
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    [self.headerView addSubview:pageControl];
    self.pageControl = pageControl;
    
    [self addTimer];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELLIDENT ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELLIDENT];
     
        _timess = [[UILabel alloc]initWithFrame:CGRectMake(screenW-80-10, (44-30)/2, 80, 30)];
        
        _timess.textColor = [UIColor orangeColor];
        _timess.font = [UIFont systemFontOfSize:13.0];
        _timess.textAlignment = NSTextAlignmentRight;
        _timess.tag = 10;
       
        [cell.contentView addSubview:_timess];
        
    }
    
    NSArray* akeys = [_dataSource allKeys];
    
    NSArray* values = [_dataSource objectForKey:[akeys objectAtIndex:indexPath.row]];
    
    
    
    cell.imageView.image = [UIImage imageNamed:[values objectAtIndex:0]];
    
    cell.textLabel.text = [values objectAtIndex:1];
    
    
    
    cell.detailTextLabel.text = [values objectAtIndex:3];
    
    _timess.text = [values objectAtIndex:2];
    return cell;
}
-(void)playImage
{
    //增加pageControl的页码
    int page = 0;
    if (self.pageControl.currentPage == numImageCount-1) {
        page = 0;
    }else{
        page = self.pageControl.currentPage+1;
    }
    //计算scrollView的滚动位置
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollW = scrollView.frame.size.width;
    CGFloat width = scrollView.contentOffset.x;
    int page = (width  + scrollW * 0.5) / scrollW;
    self.pageControl.currentPage = page;
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    //停止定时器,定时器停止了，就不能使用了。
    [self.timer invalidate];
    self.timer = nil;
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //开启定时器
    [self addTimer];
    
}
-(void)addTimer
{
    //添加定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(playImage) userInfo:nil repeats:YES];
    //消息循环，添加到主线程
    //默认没有优先级
    //    extern NSString* const NSDefaultRunLoopMode;
    //提高优先级
    //    extern NSString* const NSRunLoopCommonModes;
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
