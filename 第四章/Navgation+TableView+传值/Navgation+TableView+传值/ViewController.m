//
//  ViewController.m
//  Navgation+TableView+传值
//
//  Created by 郭丰锐 on 2018/4/9.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#define IDENT @"xc"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSArray* dataArr;
@end

@implementation ViewController
- (NSArray *)dataArr{
    if (_dataArr == nil) {
        
        NSString* fPath = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"plist"];
        
        _dataArr = [NSArray arrayWithContentsOfFile:fPath];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self dataArr];
    self.title = @"图书列表";
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%ld",_dataArr.count);
    return _dataArr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"xc"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xc"];
    }
    NSString* va = [_dataArr objectAtIndex:indexPath.row];
    NSLog(@"%@",va);
    cell.textLabel.text = va;
    return cell;
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SecondViewController* second = segue.destinationViewController;
    
    if ([second isKindOfClass:[SecondViewController class]]) {
        NSIndexPath* path = [_tableView indexPathForSelectedRow];
        
        NSString* book = [self.dataArr objectAtIndex:path.row];
        [second setValue:book forKey:@"sder"];
    }
}




@end
