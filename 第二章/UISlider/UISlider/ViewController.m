//
//  ViewController.m
//  UISlider
//
//  Created by 郭丰锐 on 2018/3/15.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *VoiceView;
@property (strong, nonatomic) IBOutlet UISlider *voiceSlider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _voiceSlider.minimumValue = 0.0;
    _voiceSlider.maximumValue = 100.0;
    
    _voiceSlider.value = 0.0;
    
    [_voiceSlider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)sliderAction:(UISlider*)slider{
    float value = slider.value;
    
    if (value == 0.0) {
        self.VoiceView = [UIImage imageNamed:@"voice0.jpg"];
    }else if (value >0.0 && value< 35.0)
    {
        self.VoiceView = [UIImage imageNamed:@"voice1.jpg"];
    }else if (value >35.0 && value< 75.0){
        self.VoiceView = [UIImage imageNamed:@"voice2.jpg"];
    }else if (value == 100.0){
        self.VoiceView = [UIImage imageNamed:@"voice3.jpg"];
    }
    //arc4random()%25;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
