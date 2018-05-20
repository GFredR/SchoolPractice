//
//  ViewController.m
//  打地鼠2
//
//  Created by 郭丰锐 on 2018/3/10.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

#define frame1  CGRectMake(132, 228, 59, 72)
#define frame2  CGRectMake(360, 228, 59, 72)
#define frame3  CGRectMake(585, 228, 59, 72)
#define frame4  CGRectMake(140, 148, 59, 72)
#define frame5  CGRectMake(360, 148, 59, 72)
#define frame6  CGRectMake(565, 148, 59, 72)
#define frame7  CGRectMake(166, 77, 59, 72)
#define frame8  CGRectMake(360, 77, 59, 72)
#define frame9  CGRectMake(565, 77, 59, 72)


@interface ViewController (){
    int score;
    int second;
}
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) NSMutableArray* frameArr;
@property (strong, nonatomic) AVAudioPlayer *player;
@property (strong, nonatomic) IBOutlet UILabel *secondLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    second = 10;
    score = 0;
    
    [self initMole];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)initMole{
    //创建定时器用于创建按钮
    
    [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(moleAction:) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAction:) userInfo:nil repeats:YES];
}
- (void)moleAction:(NSTimer*)timer{
    // int rand = arc4random()%[UIScreen mainScreen].bounds.size.height;
    if (second == 0) {
        [timer invalidate];
        [self initAlert];
    }
    
    //int a = (int)frame1.origin.x;
    UIButton* mole = [UIButton buttonWithType:UIButtonTypeCustom];
    
    int j = arc4random()%9;
    switch (j) {
        case 0:
            mole.frame = frame1;
            break;
        case 1:
            mole.frame = frame2;
            break;
        case 2:
            mole.frame = frame3;
            break;
        case 3:
            mole.frame = frame4;
            break;
        case 4:
            mole.frame = frame5;
            break;
        case 5:
            mole.frame = frame6;
            break;
        case 6:
            mole.frame = frame7;
            break;
        case 7:
            mole.frame = frame8;
            break;
        default:
            mole.frame = frame9;
    }
    [mole setImage:[UIImage imageNamed:@"2"] forState:UIControlStateNormal];
    //[mole setImage:[UIImage imageNamed:@"2"]];
   // [mole setImage:[UIImage imageNamed:@"2"] forState:UIControlStateHighlighted];
    mole.enabled = YES;

    [mole addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.imageView addSubview:mole];
}
- (void)btnAction:(UIButton *)button{
    NSLog(@"k");
    NSString *fileStr = [[NSBundle mainBundle]pathForResource:@"3" ofType:@"mp3"];
    
    NSURL *fileUrl = [NSURL URLWithString:fileStr];
    
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:fileUrl error:nil];
    
    [self.player play];
    score+= 10;
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",score];
    //移除当前button对象从父视图
    [button removeFromSuperview];
}
- (void)timeAction:(NSTimer*)timer{
    if (second == 0) {
        [timer invalidate];
    }
    second--;
    self.secondLabel.text = [NSString stringWithFormat:@"%d",second];
}
- (void)initAlert{
    UIAlertController* ac = [UIAlertController alertControllerWithTitle:@"提示" message:@"游戏结束" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        score = 0;
        second = 10;
        for (int i = 0; i<self.imageView.subviews.count; i++) {
            UIButton* button = [self.imageView.subviews objectAtIndex:i];
            [button removeFromSuperview];
        }
    }];
    [ac addAction:sure];
    [self presentViewController:ac animated:YES completion:nil];
    [self initMole];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
