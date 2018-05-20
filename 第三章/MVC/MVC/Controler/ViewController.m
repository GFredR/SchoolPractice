//
//  ViewController.m
//  MVC
//
//  Created by 郭丰锐 on 2018/3/31.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "TableViewCell.h"

#define IDENT @"Cel"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
//@property(strong, nonatomic)NSMutableArray* newList;
@property(strong, nonatomic)NSMutableArray* newsList;
@property(strong, nonatomic)UITableView* tableView;

@end

@implementation ViewController

- (NSMutableArray *)newsList{
    if (_newsList == nil) {
        _newsList = [NSMutableArray array];
        
        NSString* filePath = [[NSBundle mainBundle]pathForResource:@"news_list" ofType:@"json"];
        NSData* jsonData = [NSData dataWithContentsOfFile:filePath];
        
        NSArray* dataArr = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary* dic in dataArr) {
            //
            Model* dol = [[Model alloc]init];
            dol.image = [dic objectForKey:@"image"];
            dol.title = [dic objectForKey:@"title"];
            dol.summary = [dic objectForKey:@"summary"];
            dol.score = [NSString stringWithFormat:@"%@",[dic objectForKey:@"id"]];
            [_newsList addObject:dol];
        }
    }
    return _newsList;
}
//- (NSDictionary *)dataSource{
//    if (_dataSource == nil) {
//        NSString* path = [[NSBundle mainBundle]pathForResource:@"cityData" ofType:@"plist"];
//
//        _dataSource = [[NSDictionary alloc]initWithContentsOfFile:path];
//    }
//    return _dataSource;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.rowHeight = 100;
    
    [self.view addSubview:_tableView];
    
    UINib* nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    
    [_tableView registerNib:nib forCellReuseIdentifier:IDENT];
}

#pragma mark delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.newsList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:IDENT forIndexPath:indexPath];
    Model* m = [self.newsList objectAtIndex:indexPath.row];
    
    cell.model = m;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}











@end
