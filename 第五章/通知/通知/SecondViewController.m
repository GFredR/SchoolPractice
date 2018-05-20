//
//  SecondViewController.m
//  通知
//
//  Created by 郭丰锐 on 2018/4/26.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
- (IBAction)logIn:(UIButton *)sender;

@end

@implementation SecondViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)logIn:(UIButton *)sender {
    
    
    
    if ([self.userName.text isEqualToString:@"gfr111"]&&[self.passWord.text isEqualToString:@"asd"]) {
        [self.view endEditing:YES];
        
        [self postNotice];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    
}


- (void)postNotice{
    NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    
    NSDictionary* noDic = @{@"loginfo":[NSString stringWithFormat: @"欢迎%@",self.userName.text]};
    
    [center postNotificationName:@"loginfo" object:noDic];
}

















































@end
