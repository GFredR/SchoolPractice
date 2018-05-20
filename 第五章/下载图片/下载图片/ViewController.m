//
//  ViewController.m
//  下载图片
//
//  Created by 郭丰锐 on 2018/5/7.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    dispatch_queue_t qu;
}
@property (strong, nonatomic) IBOutlet UIImageView *imgVV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    qu = dispatch_queue_create("jjgg", DISPATCH_QUEUE_SERIAL);
//    _imgVV.image =
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.imgVV.image = nil;
    
    dispatch_sync(qu, ^{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self downLoad];
        });
    });
}

- (void)downLoad{
    NSURL* url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1525683593464&di=e7383eaea270fad7b08efcf1cf2a9f9e&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F018e8757fd9e59a84a0d304fbba1cf.jpg%401280w_1l_2o_100sh.jpg"];
    
    NSData* data = [NSData dataWithContentsOfURL:url];
    UIImage* image = [UIImage imageWithData:data];
    if (image==nil) {
        NSLog(@"zxcaddsafazhxd");
    }else{
        dispatch_queue_t mq = dispatch_get_main_queue();
        dispatch_async(mq, ^{
            self.imgVV.image = image;
        });
    }
}






















@end
