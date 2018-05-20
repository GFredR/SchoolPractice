//
//  ViewController.m
//  ScrollView
//
//  Created by 郭丰锐 on 2018/3/15.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    self.scrollView.bounces = NO;
    
    //不显示水平滑动条
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //
    
    self.scrollView.pagingEnabled = YES;
    //
    self.scrollView.contentSize = CGSizeMake(375*4, 0);
    //
    for (int i = 1; i<= 4; i++) {
        UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(375*(i-1), 0, W, H)];
        NSString* name = [NSString stringWithFormat:@"home_%d.jpg",i];
        imageView.image = [UIImage imageNamed:name];
        [_scrollView addSubview:imageView];
    }
    //设置内容尺寸
    
    
    //设置内容尺寸里的图片,需要循环定位，4个图片
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)playImage
{
    //增加pageControl的页码
    int page = 0;
    if (self.pageControl.currentPage == 4-1) {
        page = 0;
    }else{
        page = self.pageControl.currentPage+1;
    }
    //计算scrollView的滚动位置
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [self.scrollView setContentOffset:offset animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    int page = scrollView.contentOffset.x/W ;
    
    _pageControl.currentPage = page;
    
    
    
}

@end
