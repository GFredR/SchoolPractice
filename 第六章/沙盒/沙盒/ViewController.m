//
//  ViewController.m
//  沙盒
//
//  Created by 郭丰锐 on 2018/5/14.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* home = NSHomeDirectory();
    NSLog(@"%@",home);

    NSString* newPath = [home stringByAppendingPathComponent:@"Documents/1.plist"];
    NSLog(@"%@",newPath);
    
    //2
    NSArray* docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* nePath = [docPath objectAtIndex:0];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
