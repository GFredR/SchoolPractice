//
//  ViewController.m
//  One
//
//  Created by 郭丰锐 on 2018/3/5.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *textFiled1;
@property (strong, nonatomic) IBOutlet UITextField *textField2;
@property (strong, nonatomic) IBOutlet UILabel *label;
- (IBAction)plus;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextField *textFiled1 = [[UITextField alloc]init];
    UITextField *textField2 = [[UITextField alloc]init];
    UILabel *label = [[UILabel alloc]init];
    [self.view addSubview:textFiled1];
    [self.view addSubview:textField2];
    [self.view addSubview:label];
    [self plus];
    // Do any additional setup after loading the view, typically from a nib.
//    UILabel* labbel = [[UILabel alloc] initWithFrame:CGRectMake(30, 50, 100, 200)];
//
//    labbel.backgroundColor = [UIColor grayColor];
//
//    CGRect f = labbel.frame;
//    //(CGFloat)f;
//    NSLog(@"%f",f.origin.x);
//
//    NSLog(@"%f",labbel.bounds.origin.x);
//
//    labbel.alpha = 0.5;
//
//    NSArray *view = self.view.subviews;
//
//    UILabel* label2 = [view objectAtIndex:0];
//
//    label2.hidden = YES;
//
//    label2.tag = 100;
//
//    UILabel *label3 = [self.view viewWithTag:100];
//    label3.hidden = NO;
//
//    self.view.userInteractionEnabled = YES;
//    self.view.multipleTouchEnabled = YES;
//
//    [labbel removeFromSuperview];
//
//
//
//    [self.view addSubview:labbel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)plus {
    int a = _textFiled1.text.intValue;
    int b = _textField2.text.intValue;
    int result = a + b;
    self.label.text = [NSString stringWithFormat:@"%d",result];
    
}
@end
