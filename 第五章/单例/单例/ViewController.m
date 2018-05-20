//
//  ViewController.m
//  单例
//
//  Created by 郭丰锐 on 2018/4/28.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "SharedInstence.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    SharedInstence* share = [SharedInstence shareTools];
//    NSLog(@"%@",share);
//    SharedInstence* share1 = [SharedInstence shareTools];
//    NSLog(@"%@",share1);
    self.navigationItem.title = @"第一页";
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SecondViewController* seVC = [[SecondViewController alloc]init];
    SharedInstence* s = [SharedInstence shareTools];
    s.name = @"zzz";
    s.cl = [UIColor redColor];
    [self.navigationController pushViewController:seVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    
}

@end
