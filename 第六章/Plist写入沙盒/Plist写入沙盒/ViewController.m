//
//  ViewController.m
//  Plist写入沙盒
//
//  Created by 郭丰锐 on 2018/5/14.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *stuName;
@property (strong, nonatomic) IBOutlet UITextField *stuNo;
- (IBAction)save:(id)sender;

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


- (IBAction)save:(id)sender {
    NSString* name = _stuName.text;
    NSString* number = _stuNo.text;
    
    NSString* homePath = NSHomeDirectory();
    NSLog(@"%@",homePath);
    NSString* filePath = [homePath stringByAppendingPathComponent:@"Documents/Data.plist"];
    
    
    NSMutableArray* stuArr = [NSMutableArray array];
    
    NSMutableDictionary* stuDic = [NSMutableDictionary dictionary];
    [stuDic setObject:name forKey:@"name"];
    [stuDic setObject:number forKey:@"number"];
    
    [stuArr addObject:stuDic];
    
    [stuArr writeToFile:filePath atomically:YES];
    
    
    
    
    
    
    
    
    
    
}
@end
