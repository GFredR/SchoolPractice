//
//  ViewController.m
//  TabBar
//
//  Created by 郭丰锐 on 2018/4/16.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor greenColor]];
    self.navigationItem.title = @"第一页";
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor cyanColor]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_bg_normal@2x"] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    
    [self.tabBarController.tabBar setTintColor:[UIColor colorWithRed:255.0 green:65.0/255.0 blue:150.0/255.0 alpha:1]];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
