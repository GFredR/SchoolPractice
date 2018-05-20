//
//  ViewController.m
//  UITextField
//
//  Created by 郭丰锐 on 2018/3/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic)NSString* name;
@property (strong, nonatomic)NSString* pass;
- (IBAction)logIn:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _name = @"gfr";
    _pass = @"gfr111";
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)logIn:(id)sender {
    if (_userName.text.length == 0 ||_passWord.text.length == 0) {
        [self initAlert:@"不能为空"];
    }else if ([_userName.text isEqualToString:_name]&&[_passWord.text isEqualToString:_pass]){
        [self initAlert:@"登录成功"];
    }else {
        [self initAlert:@"登录失败"];
    }
    
    
    [self.view endEditing:YES];
    
    
}
- (void)initAlert:(NSString*)messege{
    UIAlertController* ac = [UIAlertController alertControllerWithTitle:@"登录提示" message:messege preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* aa = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [ac addAction:aa];
    [self presentViewController:ac animated:YES completion:nil];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self logIn:nil];
    return YES;
}






@end
