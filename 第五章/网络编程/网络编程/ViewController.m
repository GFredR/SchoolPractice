//
//  ViewController.m
//  网络编程
//
//  Created by 郭丰锐 on 2018/5/7.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController (){
    dispatch_queue_t qu;
}
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic)NSString* homePath;
@property (strong, nonatomic)NSString* filePath;
@property (strong, nonatomic)NSMutableArray* userArr;
@property (strong, nonatomic)NSMutableDictionary* allDic;
- (IBAction)logIn:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _allDic = [NSMutableDictionary dictionary];
    _userArr = [NSMutableArray array];
    _homePath = NSHomeDirectory();
    
    _filePath = [_homePath stringByAppendingPathComponent:@"Documents/Data.plist"];
    
    NSLog(@"%@",_homePath);
    
//    qu = dispatch_queue_create("na",DISPATCH_QUEUE_SERIAL);
    qu = dispatch_get_main_queue();
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)requestNetWorking{
    NSURL* url = [NSURL URLWithString:@"http://paper.greathiit.com/loginiOS.php"];
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    NSString* bodyStr = [NSString stringWithFormat:@"username=%@&password=%@",_userName.text,_passWord.text];
    
    
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSession* session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //
        dispatch_async(self->qu, ^{
            if (!error) {
                NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                NSString* result = [dic objectForKey:@"result"];
                if ([result isEqualToString:@"OK" ]) {
                    //
                    NSNotificationCenter* noteCenter = [NSNotificationCenter defaultCenter];
                    
                    NSDictionary* noteDic = @{@"username":[NSString stringWithFormat:@"欢迎%@登陆",self.userName.text]};
                    //[NSString stringWithFormat:@"欢迎%@登陆",self.userName.text]
                    [noteCenter postNotificationName:@"iOSLogInfo" object:nil userInfo:noteDic];
                    //提示可以跳转，使用自定义UIAlertController方法
                    [self initAlertController:@"登陆成功" state:1];
                }else{
                    [self initAlertController:@"用户名或密码错误" state:2];
                }
            }else{
                [self initAlertController:@"连接错误" state:3];
            }
        });
        
    }];
    [dataTask resume];
}

- (IBAction)logIn:(id)sender {
    [self requestNetWorking];
    
}

- (void)initAlertController:(NSString*)title state:(int)state{
    UIAlertController* ac = [UIAlertController alertControllerWithTitle:@"提示" message:title preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* aA = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        SecondViewController* svc = [[SecondViewController alloc]init];
        switch (state) {
            case 1:
                //成功
//                [self presentViewController:svc animated:YES completion:nil];
                
                [self dismissViewControllerAnimated:YES completion:nil];
                
                
                break;
            case 2:
                //
                break;
            case 3:
                //
                break;
        }
        
    }];
    [self.allDic setObject:self.userName.text forKey:@"usname"];
    [self.allDic setObject:self.passWord.text forKey:@"pass"];
    [self.userArr addObject:self.allDic];

    [self.userArr writeToFile:self.filePath atomically:YES];
    
    
    [ac addAction:aA];
    [self presentViewController:ac animated:YES completion:nil];
}















@end
