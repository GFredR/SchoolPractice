//
//  FourthViewController.m
//  作业四
//
//  Created by 郭丰锐 on 2018/4/2.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "FourthViewController.h"

@interface FourthViewController ()

@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title = @"分享";
    
    UIButton* leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 50, 50);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"navigationController_rightButton_normal@2x"] forState:UIControlStateNormal];
    //    leftBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    
    UIButton* rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 50, 50);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"top_navigation_personalCenter_normal"] forState:UIControlStateNormal];
    //    rightBtn addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:<#(UIControlEvents)#>
    
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
