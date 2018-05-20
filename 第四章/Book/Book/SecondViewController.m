//
//  SecondViewController.m
//  Book
//
//  Created by 郭丰锐 on 2018/4/12.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property(strong, nonatomic)NSArray* dataSource;
@property(strong, nonatomic)UILabel* label;
@property(strong, nonatomic)UILabel* nameLabel;
@property(strong, nonatomic)UIImageView* imgView;
@end

@implementation SecondViewController
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
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    NSDictionary* dic = [self.dataSource objectAtIndex:_send];
    _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 300, 330)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.text = [dic objectForKey:@"detail"];
    _label.numberOfLines = 8;
    
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 88, 300, 40)];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.text = [dic objectForKey:@"name"];
    
    [self.view addSubview:_nameLabel];
    [self.view addSubview:_label];
    
    UILabel* titLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
    titLabel.font = [UIFont systemFontOfSize:20.0f];
    titLabel.textColor = [UIColor greenColor];
    titLabel.textAlignment = NSTextAlignmentCenter;
    titLabel.text = @"详细介绍";
    
    self.navigationItem.titleView = titLabel;
    
//    [self.navigationItem setHidesBackButton:YES];
    
//    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
//    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:<#(UIBarButtonSystemItem)#> target:<#(nullable id)#> action:<#(nullable SEL)#>:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 40);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    self.navigationItem.leftBarButtonItem = leftItem;
    // Do any additional setup after loading the view.
}
- (void)backBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
