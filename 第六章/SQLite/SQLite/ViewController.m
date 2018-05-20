//
//  ViewController.m
//  SQLite
//
//  Created by 郭丰锐 on 2018/5/17.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()

@end

@implementation ViewController
static sqlite3* db = NULL;


- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* home = NSHomeDirectory();
    
    NSString* dataBasePath = [home stringByAppendingPathComponent:@"Documents/dataBase.sqlite"];
    
    int result = sqlite3_open([dataBasePath UTF8String], &db);
    
    if (result == SQLITE_OK) {
        NSLog(@"打开成功%@",NSHomeDirectory());
    }else{
        NSLog(@"打开失败");
    }
    
    NSFileManager* fm = [NSFileManager defaultManager];
    
    if ([fm fileExistsAtPath:dataBasePath]) {
        const char* sql = "create table t_student (id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,age integer NOT NULL);";
        
        char* errorMsg = NULL;
        result = sqlite3_exec(db, sql, nil, nil, &errorMsg);
        
        if (result == SQLITE_OK) {
            NSLog(@"创建成功");
        }else{
            NSLog(@"创建失败%s",errorMsg);
        }
        
    }
    [self insertData];
    
    NSInteger s_id = [self selectData];
    NSLog(@"%ld",s_id);
    [self deleteData:s_id];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)insertData{
    char* errormag = NULL;
    NSString* sql = [NSString stringWithFormat:@"insert into t_student(name,age) values('gfr',21)"];
    
    sqlite3_exec(db, sql.UTF8String, nil, nil, &errormag);
    if (!errormag) {
        NSLog(@"插入成功");
    }else{
       NSLog(@"插入失败");
    }
}

- (NSInteger)selectData{
    sqlite3_stmt* stmt;
    NSInteger s_id;
    const char* sql = "select * from t_student where name='gfr'";
    int result = sqlite3_prepare_v2(db, sql, -1, &stmt, NULL);
    
    if (result == SQLITE_OK) {
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            const unsigned char* name = sqlite3_column_text(stmt, 1);
            NSLog(@"%s",name);
            NSInteger age = sqlite3_column_int(stmt, 2);
            NSLog(@"%ld",age);
            s_id = sqlite3_column_int(stmt, 2);
            
        }
    }
    return s_id;
}

- (void)deleteData:(NSInteger)s_id{
    char* errorMsg = NULL;
    
    NSString* sql = [NSString stringWithFormat:@"delete from t_student where id=%ld"];
    
    sqlite3_exec(db, sql.UTF8String, nil, nil, &errorMsg);
    
    if (!errorMsg) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }
}





















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
