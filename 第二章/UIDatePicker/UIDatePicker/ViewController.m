//
//  ViewController.m
//  UIDatePicker
//
//  Created by 郭丰锐 on 2018/3/15.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSTimer* timers;
    NSTimeInterval times;
}
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)timerBtn:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)timerBtn:(UIButton *)sender {
    //先停止,再获取，后创建
    
    [self stopTimer];
    
    times = _datePicker.countDownDuration;
    
    timers = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
    
}
- (void)stopTimer{
    if (timers) {
        [timers invalidate];
        timers = nil;
    }
}
- (void)timerAction:(NSTimer*)timer{
    int second = (int)times;
    
    NSString* timerStr = [NSString stringWithFormat:@"%02d",second/60];
    NSString* s = [NSString stringWithFormat:@"%02d",second%60];
    NSString* str = [NSString stringWithFormat:@"%@:%@",timerStr,s];
    
    _timeLabel.text = str;
    
    times--;
    
    if (times == 0) {
        [timer invalidate];
    }
    
    
}






@end
