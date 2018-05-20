//
//  TableViewController.m
//  下拉刷新
//
//  Created by 郭丰锐 on 2018/4/5.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "TableViewController.h"

#define Ident @"cell"

@interface TableViewController ()
@property(strong, nonatomic)NSMutableArray* data;

@end

@implementation TableViewController
- (NSMutableArray *)data{
    if (_data == nil) {
        _data = [NSMutableArray array];
        [_data addObject:@"第一行数据"];
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    创建刷新控件
    UIRefreshControl* refresh = [[UIRefreshControl alloc] init];
    //设置下拉刷新的状态文字
    refresh.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    
    [refresh addTarget:self action:@selector(refreshAction) forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl = refresh;
    
  
}
- (void)refreshAction{
    //判断是否刷新
    if (self.refreshControl.refreshing) {
        self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"正在下载"];
        //
        [self performSelector:@selector(callBackMethod) withObject:nil afterDelay:2];
        //
        self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
        
        //
        [self.data insertObject:@"刷新下载的数据" atIndex:0];
        //
        [self.tableView reloadData];
        NSLog(@"%ld",_data.count);
    }
}
- (void)callBackMethod{
    
    [self.refreshControl endRefreshing];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%ld",_data.count);
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Ident forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Ident];
    }
    // Configure the cell...
    cell.textLabel.text = [self.data objectAtIndex:indexPath.row];
    NSLog(@"%@",cell.textLabel.text);
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
