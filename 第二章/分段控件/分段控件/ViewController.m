//
//  ViewController.m
//  分段控件
//
//  Created by 郭丰锐 on 2018/3/15.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *flowerView;

- (IBAction)segmentControl:(UISegmentedControl *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)segmentControl:(UISegmentedControl *)sender {
    
    //获取当前选中的分段按钮的索引值
    NSInteger index = sender.selectedSegmentIndex;
    
    switch (index) {
        case 0:
            _flowerView.image = [UIImage imageNamed:@"flower_01"];
            break;
        case 1:
            _flowerView.image = [UIImage imageNamed:@"flower_02"];
            break;
        case 2:
            _flowerView.image = [UIImage imageNamed:@"flower_03"];
            break;
        
    }
    
}
@end
