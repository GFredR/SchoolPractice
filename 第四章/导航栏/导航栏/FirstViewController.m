//
//  FirstViewController.m
//  导航栏
//
//  Created by 郭丰锐 on 2018/4/9.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController.h"
//@class ViewController;
@interface FirstViewController ()
@property(strong, nonatomic)UIButton* preBtn;
@property(strong, nonatomic)UILabel* sLabel;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    _preBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _preBtn.frame = CGRectMake(100, 100, 100, 100);
    _preBtn.titleLabel.text = @"下一页";
    [_preBtn addTarget:self action:@selector(preAction:) forControlEvents:UIControlEventTouchUpInside];
    [_preBtn setBackgroundColor:[UIColor whiteColor]];
    _sLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
    [_sLabel setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_preBtn];
    [self.view addSubview:_sLabel];
    _sLabel.text= self.sender;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)preAction:(id)sender{
    ViewController* vc = [[ViewController alloc]init];
    
    
    vc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:vc animated:YES completion:nil];
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
