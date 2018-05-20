//
//  ViewController.m
//  自定义cell
//
//  Created by 郭丰锐 on 2018/3/29.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"

#define CUSTOMID @"customCell"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)NSArray* dataSourcex;


@end



@implementation ViewController

- (NSArray *)dataSourcex{
    
    if (_dataSourcex == nil) {
        NSArray* arr = @[@"德玛西亚", @"诺克萨斯",@"比尔吉沃特",@"艾欧尼亚",@"弗雷尔卓德"];
        _dataSourcex = [[NSArray alloc] initWithArray:arr];
    }
    
    return _dataSourcex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    
    UINib* nib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    
    [tableView registerNib:nib forCellReuseIdentifier:CUSTOMID];
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark delegate

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourcex.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell* cell = [tableView dequeueReusableCellWithIdentifier:CUSTOMID forIndexPath:indexPath];
//    if (cell == nil) {
//        <#statements#>
//    }
    cell.txtLabel.text = self.dataSourcex[indexPath.row];
    
    return cell;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 80.0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
