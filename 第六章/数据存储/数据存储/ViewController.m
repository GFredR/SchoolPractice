//
//  ViewController.m
//  数据存储
//
//  Created by 郭丰锐 on 2018/5/17.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic) IBOutlet UISwitch *remberPass;
- (IBAction)logIn:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString* home = NSHomeDirectory();
    NSLog(@"%@",home);
    
    NSString* newPath = [home stringByAppendingPathComponent:@"Library/Prefernces/com.gfr.apple.----.plist"];
    NSLog(@"%@",newPath);
    
    NSFileManager* fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:newPath]) {
        NSUserDefaults* userD = [NSUserDefaults standardUserDefaults];
        NSString* uName = [userD objectForKey:@"username"];
        NSString* uPass = [userD objectForKey:@"password"];
        BOOL uremember = [[userD objectForKey:@"rem"]boolValue];
        
        self.userName.text = uName;
        if (uremember) {
            self.passWord.text = uPass;
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)logIn:(id)sender {
    NSString* name = self.userName.text;
    NSString* pass = self.passWord.text;
    
    NSNumber* rember = [NSNumber numberWithBool:self.remberPass.on];
    
    if (!name.length && !pass.length) {
        NSLog(@"不能为空");
        return;
    }
    
    NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
    
    [user setObject:name forKey:@"username"];
    [user setObject:pass forKey:@"password"];
    [user setObject:rember forKey:@"rem"];
    
    [user synchronize];
    
    
    NSLog(@"登录成功%@",NSHomeDirectory());
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
@end
