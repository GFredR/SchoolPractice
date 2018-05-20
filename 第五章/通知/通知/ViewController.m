//
//  ViewController.m
//  通知
//
//  Created by 郭丰锐 on 2018/4/26.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *welcomeLabel;
- (IBAction)enterButton:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)enterButton:(UIButton *)sender {
    [self addobserverNotification];
    
}
- (void)addobserverNotification{
    NSNotificationCenter* center =[NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(updateLogInfo:) name:@"loginfo" object:nil];
    
}
- (void)updateLogInfo:(NSNotification*)notice{
    
    NSDictionary* info = notice.userInfo;
    
    NSString* note = [info objectForKey:@"loginfo"];
    
    self.welcomeLabel.text = note;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}










@end
