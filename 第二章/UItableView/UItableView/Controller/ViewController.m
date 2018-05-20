//
//  ViewController.m
//  UItableView
//
//  Created by 郭丰锐 on 2018/3/24.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "MessageModel.h"
#import "MessageTableViewCell.h"
#define CELL @"messageCellid"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)NSArray* dataSource;

@end

@implementation ViewController
- (NSArray *)dataSource{
    if (_dataSource == nil) {
        NSString* filePath = [[NSBundle mainBundle]pathForResource:@"message" ofType:@"plist"];
        NSArray* arr = [NSArray arrayWithContentsOfFile:filePath];
        
        NSArray* modelArr = [self parserData:arr];
        
        _dataSource = [[NSArray alloc]initWithArray:modelArr];
        
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createTableView];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)createTableView{
    UITableView* tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    UINib* nib = [UINib nibWithNibName:@"MessageTableViewCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CELL];
}
- (NSArray*)parserData:(NSArray*)arr{
    NSMutableArray* reArr = [NSMutableArray new];
    
    for (NSDictionary* modelDic in arr) {
        MessageModel* model = [MessageModel new];
        [model setValuesForKeysWithDictionary:modelDic];
        [reArr addObject:model];
    }
    return reArr;
}
#pragma mark- dalegete
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    MessageTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL forIndexPath:indexPath];
    
    MessageModel* cellModel = self.dataSource[indexPath.row];
    
    [cell setCellContentWithModel:cellModel];
    
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return self.dataSource.count;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


@end
