//
//  ViewController.m
//  KVO
//
//  Created by 郭丰锐 on 2018/4/26.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import "Movie.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic)Movie* movie;

- (IBAction)uploadAction:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.movie = [[Movie alloc]init];
    [self.movie addObserver:self forKeyPath:@"movie.price" options:NSKeyValueObservingOptionNew context:nil];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)uploadAction:(id)sender {
    [self.movie setValue:@"90" forKey:@"price"];
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"price"]) {
        self.priceLabel.text = [self.movie valueForKey:@"price"];
    }
    
}

- (void)dealloc{
    [self removeObserver:self forKeyPath:@"price"];
}





@end
