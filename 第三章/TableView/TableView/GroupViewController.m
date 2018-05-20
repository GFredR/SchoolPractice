//
//  GroupViewController.m
//  TableView
//
//  Created by 郭丰锐 on 2018/3/26.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "GroupViewController.h"

@interface GroupViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSDictionary* data;
    
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    data = @{@"15j01":@[@"asdfg",@"zczx",@"zxcvnbv"],@"15i01":@[@"atgbbg",@"tgb"]};
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return data.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //
    NSArray* keys = [data allKeys];
    
    NSArray* value = [data objectForKey:[keys objectAtIndex:section]];
    
    return value.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* ident = @"GCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    NSArray* akeys = [data allKeys];
    
    NSArray* values = [data objectForKey:[akeys objectAtIndex:indexPath.section]];
    
    
    cell.textLabel.text = [values objectAtIndex:indexPath.row];
    return cell;
    
    
    
    
    
    
    
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSArray* keys = [data allKeys];
    return [keys objectAtIndex:section];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
