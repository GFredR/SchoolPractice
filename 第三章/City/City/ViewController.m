//
//  ViewController.m
//  City
//
//  Created by 郭丰锐 on 2018/3/30.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"


#define IDENT @"Cell"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property(strong, nonatomic)UITableView* tableView;
@property(strong, nonatomic)NSDictionary* dataSource;
@property(strong, nonatomic)UISearchBar* searchBar;

@end

@implementation ViewController

- (NSDictionary *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSDictionary dictionary];
        NSString* file = [[NSBundle mainBundle]pathForResource:@"cityData" ofType:@"plist"];
        
        _dataSource = [NSDictionary dictionaryWithContentsOfFile:file];
    }
    return _dataSource;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 375, 44)];
    _searchBar.placeholder = @"请输入搜索文字";
    _searchBar.showsCancelButton = YES;

    _searchBar.delegate = self;
    //    []
    
    
    _tableView.tableHeaderView = self.searchBar;
    
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     NSLog(@"%ld",_dataSource.count);
    
    
    return self.dataSource.count;
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray* alKeys = [_dataSource allKeys];
    
    NSArray* values = [_dataSource objectForKey:[alKeys objectAtIndex:section]];
    
    
    
    return values.count;
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:IDENT];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IDENT];
    }
    
    NSArray* aKeys = [_dataSource allKeys];
    
    NSArray* aValues = [_dataSource objectForKey:[aKeys objectAtIndex:indexPath.section]];
    
    cell.textLabel.text = [aValues objectAtIndex:indexPath.row];
    //NSLog(@"%@",cell.textLabel.text);
    
    return cell;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSArray* title = [_dataSource allKeys];
    return [title objectAtIndex:section];
}

//索引
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [_dataSource allKeys];
    
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    UITableViewHeaderFooterView* header = (UITableViewHeaderFooterView*)view;
    header.textLabel.font = [UIFont systemFontOfSize:20 ] ;
}

//点击取消，执行键盘弹回
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self.view endEditing:YES];
   //[searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if (searchText.length != 0) {
        //
        //1.规则
        NSString* str = [NSString stringWithFormat:@"self like '*%@*'",searchText];
        
        //2.创建过滤使用的谓词
        NSPredicate* predicate = [NSPredicate predicateWithFormat:str];
        //3.
        NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:_dataSource];
        
        NSMutableDictionary* muDic = [NSMutableDictionary dictionary];
        
        for (NSString* keys in dic) {
            NSArray* arr = [dic objectForKey:keys];
            
            NSArray* narr = [arr filteredArrayUsingPredicate:predicate];
            if (narr.count != 0) {
                [muDic setObject:narr forKey:keys];
            }
            
        }
        //
        self.dataSource = [NSMutableDictionary dictionaryWithDictionary:muDic];
        
        
        
        
    }else{
        _dataSource = nil;
    }
    
    [self.tableView reloadData];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end





