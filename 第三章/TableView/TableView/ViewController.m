//
//  ViewController.m
//  TableView
//
//  Created by 郭丰锐 on 2018/3/26.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
}
//

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//must
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString* ident = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld %ld",indexPath.row,indexPath.section];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
//must
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

@end
