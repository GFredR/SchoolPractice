//
//  ViewController.m
//  打地鼠
//
//  Created by 郭丰锐 on 2018/3/7.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(strong, nonatomic)NSMutableArray* btnTag;//存放tag值

- (IBAction)moleBtn:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    
    //NSString* tag = [_btnTag objectAtIndex:0];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)initData{
    _btnTag = [NSMutableArray array];
    [_btnTag addObject:@"0"];
    [_btnTag addObject:@"1"];
    [_btnTag addObject:@"2"];
    [_btnTag addObject:@"3"];
    [_btnTag addObject:@"4"];
    [_btnTag addObject:@"5"];
    [_btnTag addObject:@"6"];
    [_btnTag addObject:@"7"];
    [_btnTag addObject:@"8"];
    //创建按钮对象
    NSString *tag = [_btnTag objectAtIndex:0];
    int tag1 = tag.intValue;
    UIButton *btn1 = [self.view viewWithTag:tag1];
    
    NSString *tagSecond = [_btnTag objectAtIndex:1];
    int tag2 = tagSecond.intValue;
    UIButton *btn2 = [self.view viewWithTag:tag2];
    
    NSString *tagThird = [_btnTag objectAtIndex:2];
    int tag3 = tagThird.intValue;
    UIButton *btn3= [self.view viewWithTag:tag3];
    
    NSString *tagFourth = [_btnTag objectAtIndex:3];
    int tag4 = tagFourth.intValue;
    UIButton *btn4 = [self.view viewWithTag:tag4];
    
    NSString *tagFifth = [_btnTag objectAtIndex:4];
    int tag5 = tagFifth.intValue;
    UIButton *btn5 = [self.view viewWithTag:tag5];
    
    NSString *tagSixth = [_btnTag objectAtIndex:5];
    int tag6 = tagSixth.intValue;
    UIButton *btn6 = [self.view viewWithTag:tag6];
    
    NSString *tagSeventh = [_btnTag objectAtIndex:6];
    int tag7 = tagSeventh.intValue;
    UIButton *btn7= [self.view viewWithTag:tag7];
    
    NSString *tagEightth = [_btnTag objectAtIndex:7];
    int tag8 = tagEightth.intValue;
    UIButton *btn8 = [self.view viewWithTag:tag8];
    
    NSString *tagNineth = [_btnTag objectAtIndex:8];
    int tag9 = tagNineth.intValue;
    UIButton *btn9 = [self.view viewWithTag:tag9];
    //隐藏按钮对象
//    btn1.alpha = 0;
//    btn2.alpha = 0;
//    btn3.alpha = 0;
//    btn4.alpha = 0;
//    btn5.alpha = 0;
//    btn6.alpha = 0;
//    btn7.alpha = 0;
//    btn8.alpha = 0;
//    btn9.alpha = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void)initMole{
//    //创建定时器用于创建按钮
//
//    [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(moleBtn:) userInfo:nil repeats:YES];
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
//}

- (IBAction)moleBtn:(UIButton *)sender {
    
}
@end
