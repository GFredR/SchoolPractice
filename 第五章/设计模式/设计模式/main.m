//
//  main.m
//  设计模式
//
//  Created by 郭丰锐 on 2018/4/26.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Student.h"
#import "Person.h"
int main(int argc, char * argv[]) {
    Person* p = [[Person alloc]init];
    
    [p setValue:@"zxc" forKey:@"name"];
    
    //
    NSLog(@"%@",[p valueForKey:@"name"]);
    
    Student* stu = [[Student alloc]init];
    
    [p setValue:stu forKey:@"s"];
    
    [p setValue:@"2022222222222" forKeyPath:@"s.number"];
    
    NSLog(@"%@",[p valueForKeyPath:@"s.number"]);
    
    //
    [p setValue:@"123" forUndefinedKey:@"age"];
    
    NSLog(@"%@",[p valueForKey:@"age"]);
    
    return 0;
}
