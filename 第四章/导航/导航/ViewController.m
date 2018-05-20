//
//  ViewController.m
//  导航
//
//  Created by 郭丰锐 on 2018/4/9.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *valueTextField;
- (IBAction)nextAction:(id)sender;

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


- (IBAction)nextAction:(id)sender {
    SecondViewController* second = [[SecondViewController alloc]init];
    [second setValue:_valueTextField forKey:@"bd"];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SecondViewController* second = [[SecondViewController alloc]init];
    [second setValue:_valueTextField forKey:@"bd"];
}
@end
