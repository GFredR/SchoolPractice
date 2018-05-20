//
//  ViewController.m
//  表格操作
//
//  Created by 郭丰锐 on 2018/4/4.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong, nonatomic)NSArray* dataSource;

@end

@implementation ViewController

- (NSArray *)dataSource{
    if (_dataSource == nil) {
        NSString* paath = [[NSBundle mainBundle]pathForResource:@"message" ofType:@"plist"];
        
        NSArray* arr = [NSArray arrayWithContentsOfFile:paath];
        
        _dataSource = [[NSArray alloc]initWithArray:arr];;
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    UICollectionView//
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
