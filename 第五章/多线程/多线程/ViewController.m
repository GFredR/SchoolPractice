//
//  ViewController.m
//  多线程
//
//  Created by 郭丰锐 on 2018/5/7.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_queue_t qu = dispatch_queue_create("sasa", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(qu, ^{
        NSLog(@"%@y",[NSThread currentThread]);

    });
    
    NSLog(@"%@",[NSThread currentThread]);
    
    // Do any additional setup after loading the view, typically from a nib.
//    [self performSelector:@selector(action) withObject:nil afterDelay:3];
//    [self action];
    
}
//- (void)action{
//    for (int i=0; i<1000000; i++) {
//        NSLog(@"%d",i);
//    }
//}
//- (void)demo1{
//    dispatch_queue_t q = dispatch_get_global_queue(0, 0);
//    void (^taks)() = ^{
//
//        NSLog(@"%@",[NSThread currentThread]);
//
//    };
//
//    //2.2添加任务到队列，并且会执行
//    dispatch_sync(q, taks);
//
//
//    dispatch_sync(q, ^{
//        NSLog(@"%@",[NSThread currentThread]);
//    });
//}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
