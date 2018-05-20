//
//  FirstViewController.m
//  作业四
//
//  Created by 郭丰锐 on 2018/4/2.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "FirstViewController.h"
#import "LoginViewController.h"
#define IDENT @"celll"
#define screenW self.view.frame.size.width


@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property(strong, nonatomic)UITableView* tableView;
@property(strong, nonatomic)NSDictionary* dataSource;
@property(strong, nonatomic)UILabel* times;
@property(strong, nonatomic)UIScrollView* scrollView;
@property(strong, nonatomic)UIPageControl* pageControl;
@property(strong, nonatomic)UIImageView* imageView;

@property(strong, nonatomic)UIView* headerView;
@end

@implementation FirstViewController

- (NSDictionary *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSDictionary dictionary];
        
        NSString* path = [[NSBundle mainBundle]pathForResource:@"homeworkPlist" ofType:@"plist"];
        NSLog(@"%@",path);
        _dataSource = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"首页";
    
    UIButton* leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 50, 50);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"navigationController_rightButton_normal@2x"] forState:UIControlStateNormal];
//    leftBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 50, 50);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"top_navigation_personalCenter_normal"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    [self dataSource];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, 150)];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screenW, 150)];
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(164, 132, 46, 37)];
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(screenW*4, 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    for (int i = 1; i<=4; i++) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(screenW*(i-1), 0, screenW, 150)];
        
        NSString* name = [NSString stringWithFormat:@"%d.jpg",i];
        _imageView.image = [UIImage imageNamed:name];
        NSLog(@"%@",_imageView.image);
        [self.scrollView addSubview:_imageView];
        NSLog(@"%@",self.scrollView);
        [self.headerView addSubview:_scrollView];
        [self.headerView addSubview:_pageControl];
        _pageControl.hidden = NO;
    }
    
    
    //[self.headerView addSubview:_scrollView];
    
    
    _tableView.tableHeaderView = _headerView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _scrollView.delegate = self;
    [self.view addSubview:_tableView];
    
    
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray* keys = [_dataSource allKeys];
//    NSLog(@"%ld",keys.count);
    
    //NSArray* aValues = [_dataSource objectForKey:[keys objectAtIndex:section]];
    
    //NSLog(@"%ld",aValues.count);
    
    return keys.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:IDENT];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IDENT];
        
        _times = [[UILabel alloc]initWithFrame:CGRectMake(screenW-80-10, (44-30)/2, 80, 30)];
        
        _times.textColor = [UIColor orangeColor];
        _times.font = [UIFont systemFontOfSize:13.0];
        _times.textAlignment = NSTextAlignmentRight;
        _times.tag = 10;
        
        [cell.contentView addSubview:_times];
    }
    NSArray* keys = [_dataSource allKeys];
    NSLog(@"%ld",keys.count);
    NSArray* aValues = [_dataSource objectForKey:[keys objectAtIndex:indexPath.row]];
    
    cell.imageView.image = [UIImage imageNamed:[aValues objectAtIndex:0]];
    _times.text = [aValues objectAtIndex:1];
    cell.textLabel.text = [aValues objectAtIndex:2];
    
    
    return cell;
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x/screenW;
    
    _pageControl.currentPage = page;
    
}
- (void)login{
    LoginViewController* lvc = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:lvc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
