//
//  ViewController.m
//  AFNet
//
//  Created by 郭丰锐 on 2018/5/14.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建af对象
    AFHTTPSessionManager* mangaer = [AFHTTPSessionManager manager];
    
    mangaer.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //
    mangaer.responseSerializer.acceptableContentTypes = [[NSSet alloc]initWithObjects:@"text/html",@"application/json", nil];
    
    NSString* url = @"http://paper.greathiit.com/loginiOS.php";
    
    NSDictionary* dic = @{@"username":@"s",@"password":@"1"};
    
    [mangaer POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"进度%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"返回数据%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
