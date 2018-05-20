//
//  ViewController.m
//  汤姆猫
//
//  Created by 郭丰锐 on 2018/3/8.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)milkButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIImageView *backTom;
@property (strong, nonatomic) AVAudioPlayer* player;
- (IBAction)pieAction:(UIButton *)sender;
- (IBAction)fangPi:(UIButton *)sender;
- (IBAction)duang:(UIButton *)sender;
- (IBAction)bird:(UIButton *)sender;
- (IBAction)crack:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)milkButton:(UIButton *)sender {
    //加载图片，
    [self setAnimation:@"cat_drink" countImage:80];
    
    
    
    
}
- (void )setAnimation:(NSString*)imageName countImage:(int)count{
    //创建数组
    NSMutableArray* muArr = [NSMutableArray array];
    
    for (int i = 0; i<count; i++) {
        NSString *name = [NSString stringWithFormat:@"%@00%02d.jpg",imageName,i];
        
        UIImage* image = [UIImage imageNamed:name];
        [muArr addObject:image];
        
        
    }
    //将图片数组赋值给back控件，用于播放序列帧dh
    _backTom.animationImages = muArr;
    //
    _backTom.animationRepeatCount = 1;
    //
    _backTom.animationDuration = 2;
    //
    [_backTom startAnimating];
    //
    [self playAudio:@"pour_milk"];
    [self performSelector:@selector(playAudio:) withObject:@"p_drink_milk" afterDelay:2.87];
}


- (void)playAudio:(NSString*)fileName{
    NSString* file = [[NSBundle mainBundle]pathForResource:fileName ofType:@"m4a"];
    
    NSURL* fileURl = [[NSURL alloc]initWithString:file];
    
    _player = [[AVAudioPlayer alloc]initWithContentsOfURL:fileURl error:nil];
    
    [_player play];
    
}


















- (IBAction)pieAction:(UIButton *)sender {
    [self setAnimation:@"pie-iPad" countImage:23];
}

- (IBAction)fangPi:(UIButton *)sender {
    [self setAnimation:@"iPad" countImage:27];
}

- (IBAction)duang:(UIButton *)sender {
    [self setAnimation:@"cat_cymbal_iPad" countImage:12];
}

- (IBAction)bird:(UIButton *)sender {
    [self setAnimation:@"cat_eat_iPad" countImage:39];
}

- (IBAction)crack:(UIButton *)sender {
    [self setAnimation:@"Scratch-iPad" countImage:55];
}
@end
