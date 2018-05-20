//
//  ViewController.m
//  导航栏
//
//  Created by 郭丰锐 on 2018/4/9.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()
@property(strong, nonatomic)UIButton* nextBtn;
@property(strong, nonatomic)UITextField* textField;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _nextBtn.frame = CGRectMake(100, 100, 100, 100);
    _nextBtn.titleLabel.text = @"下一页";
    _nextBtn.titleLabel.textColor = [UIColor blackColor];
    [_nextBtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    [_nextBtn setBackgroundColor:[UIColor whiteColor]];
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
    [_textField setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_nextBtn];
    [self.view addSubview:_textField];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)nextAction:(id)sender{
    FirstViewController* firstVC = [[FirstViewController alloc]init];
    
//    firstVC.sender = _textField.text;
    firstVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [firstVC setValue:_textField.text forKey:@"sender"];
    [self presentViewController:firstVC animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
