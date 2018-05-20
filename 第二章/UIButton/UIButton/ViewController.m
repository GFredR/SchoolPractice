//
//  ViewController.m
//  UIButton
//
//  Created by 郭丰锐 on 2018/3/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *img;
- (IBAction)run:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self scale];
    [self rotate];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scale{
    UIButton* add = [UIButton buttonWithType:UIButtonTypeCustom];
    add.frame = CGRectMake(200, 490, 36, 36);
    [add setImage:[UIImage imageNamed:@"sub_black_add"] forState:UIControlStateNormal];
    [add setImage:[UIImage imageNamed:@"sub_blue_add"] forState:UIControlStateHighlighted];
    add.tag = 201;
    [add addTarget:self action:@selector(scaleAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:add];
    
    UIButton* remove = [UIButton buttonWithType:UIButtonTypeCustom];
    remove.frame = CGRectMake(200+30+20, 490, 36, 36);
    [remove setImage:[UIImage imageNamed:@"sub_black_remove"] forState:UIControlStateNormal];
    [remove setImage:[UIImage imageNamed:@"sub_blue_remove"] forState:UIControlStateHighlighted];
    remove.tag = 202;
    [remove addTarget:self action:@selector(scaleAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:remove];
}

- (void)scaleAction:(UIButton*)button{
    CGAffineTransform t = _img.transform;
    switch (button.tag) {
        case 201:
            _img.transform = CGAffineTransformScale(t, 1.2, 1.2);
            break;
            
        case 202:
            _img.transform = CGAffineTransformScale(t, 0.8, 0.8);
            break;
        case 203:
            _img.transform = CGAffineTransformRotate(t, 0.5);
            break;
            
        case 204:
            _img.transform = CGAffineTransformRotate(t, -0.5);
            break;
    }
}

- (void)rotate{
    UIButton* cw = [UIButton buttonWithType:UIButtonTypeCustom];
    cw.frame = CGRectMake(200, 490+36+20, 36, 36);
    [cw setImage:[UIImage imageNamed:@"sub_black_rotate_cw"] forState:UIControlStateNormal];
    [cw setImage:[UIImage imageNamed:@"sub_blue_rotate_cw"] forState:UIControlStateHighlighted];
    cw.tag = 203;
    [cw addTarget:self action:@selector(scaleAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cw];
    
    UIButton* ccw = [UIButton buttonWithType:UIButtonTypeCustom];
    ccw.frame = CGRectMake(200+30+20, 490+36+20, 36, 36);
    [ccw setImage:[UIImage imageNamed:@"sub_black_rotate_ccw"] forState:UIControlStateNormal];
    [ccw setImage:[UIImage imageNamed:@"sub_blue_rotate_ccw"] forState:UIControlStateHighlighted];
    ccw.tag = 204;
    [ccw addTarget:self action:@selector(scaleAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:ccw];
    
}

- (IBAction)run:(UIButton *)sender {
    //负责动画，视图的平移
    //获取img的transform
    CGAffineTransform t = self.img.transform;
    //获取当前button tag值
    switch (sender.tag) {
        case 1:
            _img.transform = CGAffineTransformTranslate(t, 0, -10);
            break;
        case 2:
            _img.transform = CGAffineTransformTranslate(t, 0, 10);
            break;
        case 3:
            _img.transform = CGAffineTransformTranslate(t, -10, 0);
            break;
        case 4:
            _img.transform = CGAffineTransformTranslate(t, 10, 0);
            break;
    }
    
    
    
    
    
    
    
    
    
}
@end
