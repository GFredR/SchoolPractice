//
//  SecondViewController.m
//  网络编程
//
//  Created by 郭丰锐 on 2018/5/7.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (strong, nonatomic) IBOutlet UILabel *welcome;
@property (strong, nonatomic) NSString* txt;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _welcome = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
//    self.welcome.text = @"zz";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showLabel:) name:@"iOSLogInfo" object:nil];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:_welcome];
    // Do any additional setup after loading the view.
}

- (void)showLabel:(NSNotification*)notice{
    NSDictionary* info = notice.userInfo;
    
    self.welcome.text = [info objectForKey:@"username"];
    NSLog(@"%@",self.welcome.text);
    
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
