//
//  ViewController.m
//  归档
//
//  Created by 郭丰锐 on 2018/5/17.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()
- (IBAction)guiDang:(id)sender;
- (IBAction)decode:(id)sender;

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


- (IBAction)guiDang:(id)sender {
    Person* pp = [[Person alloc]init];
    pp.name = @"ab";
    pp.age = 11;
    
    NSString* home = NSHomeDirectory();
    NSLog(@"%@",home);
    
    NSString* newPath = [home stringByAppendingPathComponent:@"Documents/person.arc"];
    NSLog(@"%@",newPath);
    
    [NSKeyedArchiver archiveRootObject:pp toFile:newPath];
}

- (IBAction)decode:(id)sender {
    NSString* home = NSHomeDirectory();
    NSLog(@"%@",home);
    
    NSString* newPath = [home stringByAppendingPathComponent:@"Documents/person.arc"];
    
    Person* newPp = [NSKeyedUnarchiver unarchiveObjectWithFile:newPath];
    
    NSLog(@"%@",newPp);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
@end
