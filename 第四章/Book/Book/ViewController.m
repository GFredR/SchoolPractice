//
//  ViewController.m
//  Book
//
//  Created by 郭丰锐 on 2018/4/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong, nonatomic)NSArray* dataSource;

@end

@implementation ViewController
- (NSArray *)dataSource{
    if (_dataSource ==nil) {
        _dataSource = [NSArray array];
        NSString* fiPath = [[NSBundle mainBundle]pathForResource:@"book" ofType:@"plist"];
        
        _dataSource = [NSArray arrayWithContentsOfFile:fiPath];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"图书列表";
    [self.navigationController.navigationBar setBackgroundColor:[UIColor blueColor]];
    UITableView* tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* idd = @"z";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:idd];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idd];
        
    }
    NSDictionary* nic = [self.dataSource objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed: [nic objectForKey:@"icon"]];
    cell.textLabel.text = [nic objectForKey:@"name"];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondViewController* sed = [[SecondViewController alloc]init];
    [sed setValue:[NSString stringWithFormat:@"%ld",indexPath.row] forKey:@"send"];
    [self.navigationController pushViewController:sed animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
