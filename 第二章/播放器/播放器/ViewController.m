//
//  ViewController.m
//  播放器
//
//  Created by 郭丰锐 on 2018/3/19.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<UIScrollViewDelegate>{
    UIPageControl* pagge;
    NSTimer* aTimer;
    double angle;
    
    AVAudioPlayer* player;
    
    int tTime;
    
    int sTime;
    
    UIImageView* imageView;
    
    //记录索引值
    NSInteger arrInedx;
    
    NSArray* songArr;
}
#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@property (strong, nonatomic) IBOutlet UILabel *songName;
@property (strong, nonatomic) IBOutlet UILabel *singer;
@property (strong, nonatomic) IBOutlet UIScrollView *album;
@property (strong, nonatomic) IBOutlet UISlider *mp3Slider;
@property (strong, nonatomic) IBOutlet UILabel *totalTime;
@property (strong, nonatomic) IBOutlet UILabel *startTime;
@property (strong, nonatomic) IBOutlet UIPageControl *pictrueControl;
@property (strong, nonatomic) IBOutlet UIButton *playerBtn;


- (IBAction)slider:(UISlider *)sender;
- (IBAction)play:(UIButton *)sender;
- (IBAction)back:(UIButton *)sender;
- (IBAction)forword:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSong:0];
//    //
    self.album.bounces = NO;

    //不显示水平滑动条
    self.album.showsHorizontalScrollIndicator = NO;
    //

    self.album.pagingEnabled = YES;
    //
    self.album.contentSize = CGSizeMake(375*2, 144);
    //
    for (int i = 1; i<= 4; i++) {
        UIImageView* imageView = [[UIImageView alloc]initWithFrame:CGRectMake(375*(i-1), 0, W, 524)];
        NSString* name = [NSString stringWithFormat:@"home_%d.jpg",i];
        imageView.image = [UIImage imageNamed:name];
        [_album addSubview:imageView];
    }
    
}
- (void)initSong:(NSInteger)songIndex{
    sTime = 0;
    
    arrInedx = songIndex;
    //获取数据信息
    //
    NSString* fliePath = [[NSBundle mainBundle]pathForResource:@"song" ofType:@"plist"];
    songArr = [NSArray arrayWithContentsOfFile:fliePath];
    
    //
    NSString* fileURL = [[NSBundle mainBundle]pathForResource:[songArr objectAtIndex:arrInedx] ofType:@"mp3"];
    NSURL* url = [NSURL fileURLWithPath:fileURL];
    NSLog(@"%@",url);
    NSArray* mp3Arr = [self getMp3Info:url];
    NSLog(@"%@",mp3Arr);
    self.songName.text = [mp3Arr objectAtIndex:2];
    NSLog(@"%@",_songName.text);
    
    _singer.text = [mp3Arr objectAtIndex:0];
    
    //
    [self initScrollView:[mp3Arr objectAtIndex:3] songName:[mp3Arr objectAtIndex:1]];
    
    [self initPlayer:url];
}
- (void)initPlayer:(NSURL*)url{
    player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    
    tTime = player.duration;
    
    NSString* s = [NSString stringWithFormat:@"%02d",tTime%60];
    NSString* m = [NSString stringWithFormat:@"%02d",tTime/60];
    
    _totalTime.text = [NSString stringWithFormat:@"%@:%@",m,s];
    
}
- (void)initScrollView:(UIImage*)image songName:(NSString*)songName{
    self.album.contentSize = CGSizeMake(375*2, 0);
    //
    
    self.album.pagingEnabled = YES;
    self.album.bounces = NO;
    _album.delegate = self;
   
    self.album.showsHorizontalScrollIndicator = NO;
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 14.5, 375, 524)];
    imageView.image = image;
    
    imageView.tag = 111;
    
    imageView.layer.cornerRadius = imageView.bounds.size.width*0.5;
    
    imageView.clipsToBounds = YES;
    //
    imageView.layer.borderWidth = 7.0;
    imageView.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.6]);
    
    [_album addSubview:imageView];
    //[self animation];
    
    //
    UITextView* textView = [[UITextView alloc]initWithFrame:CGRectMake(375, 0, 375, 524)];
    
    textView.editable = NO;
    textView.selectable = NO;
    textView.textAlignment = NSTextAlignmentCenter;
    textView.textColor = [UIColor whiteColor];
    textView.backgroundColor = [UIColor clearColor];
    
    NSString* lrc = [[NSBundle mainBundle]pathForResource:songName ofType:@"txt"];
    NSLog(@"%@",lrc);
    NSFileManager* fm = [NSFileManager defaultManager];
    
    NSData* songData = [fm contentsAtPath:lrc];
    
    NSString* textData = [[NSString alloc]initWithData:songData encoding:NSUTF8StringEncoding];
    
    textView.text = textData;
    
    [_album addSubview:textView];
    
     pagge = [[UIPageControl alloc]initWithFrame:CGRectMake((375-50)/2, 812-96-30-20, 50, 20)];
     pagge .numberOfPages = 2;
     pagge.currentPage = 0;
     [self.view addSubview:pagge];
}

//获取mp3文件信息，artist、albumName、title、artwork等信息
-(NSArray *)getMp3Info:(NSURL *)url{
    // 初始化媒体文件
    
    NSMutableArray *mp3 = [[NSMutableArray alloc]initWithCapacity:4];
    AVURLAsset *mp3Asset = [AVURLAsset URLAssetWithURL:url options:nil];
    // 读取文件中的数据
    for (NSString *format in [mp3Asset availableMetadataFormats]) {
        for (AVMetadataItem *metadataItem in [mp3Asset metadataForFormat:format]) {
            
            //NSLog(@"%@--%@",metadataItem.commonKey,metadataItem.value);
            //artwork这个key对应的value里面存的就是封面缩略图，其它key可以取出其它摘要信息，例如title - 标题
            if ([metadataItem.commonKey isEqualToString:@"title"]) {
                [mp3 addObject:metadataItem.value];
            }
            if ([metadataItem.commonKey isEqualToString:@"artist"]) {
                [mp3 addObject:metadataItem.value];
            }
            if ([metadataItem.commonKey isEqualToString:@"albumName"]) {
                [mp3 addObject:metadataItem.value];
            }
            
            if ([metadataItem.commonKey isEqualToString:@"artwork"]) {
                if (!metadataItem.value) {
                    // 如果音乐没有图片，就返回默认图片
                    [mp3 addObject:[UIImage imageNamed:@"audio_list.png"]];
                }
                [mp3 addObject:(UIImage *)[UIImage imageWithData:(NSData *)metadataItem.value]];
                break;
            }
            
        }
    }
    return mp3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    int page = _album.contentOffset.x/W;

    pagge.currentPage = page;
}
- (void)animation{
    
    
    CGAffineTransform du = CGAffineTransformMakeRotation(angle*(M_PI/180.0f)/30.f);
    
    [UIView animateWithDuration:0.05 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        imageView = [self.view viewWithTag:111];
        imageView.transform = du;
    } completion:^(BOOL finished) {
        if (finished ) {
            angle += 10;
            [self animation];
        }
    }];
    
}

- (IBAction)slider:(UISlider *)sender {
    sTime = sender.value;
    //
    
    player.currentTime = sender.value;
}

- (IBAction)play:(UIButton *)sender {
//    [player play];
//    [self animation];
//    if (<#condition#>) {
//        <#statements#>
//    }
    static dispatch_once_t disonce;
    dispatch_once(&disonce,^{
        [self animation];
        aTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeAct:) userInfo:nil repeats:YES];
    });
    
    if (!player.playing) {
        [self animation];
        [player play];
        [sender setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        [aTimer setFireDate:[NSDate distantPast]];
    }else{
        [player pause];
        [sender setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [self->imageView.layer removeAllAnimations];
        [aTimer setFireDate:[NSDate distantFuture]];
    }
}
- (void)timeAct:(NSTimer*)timmer{
    NSString* s = [NSString stringWithFormat:@"%02d",sTime%60];
    NSString* m = [NSString stringWithFormat:@"%02d",sTime/60];
    _startTime.text = [NSString stringWithFormat:@"%@:%@",m,s];
    _mp3Slider.value = sTime;
    sTime++;
    NSLog(@"%@",_startTime.text);
    if (sTime >= tTime) {
        //[timmer invalidate];
        [aTimer setFireDate:[NSDate distantPast]];
        sTime = 0;
        _mp3Slider.value = 0;
        _startTime.text=@"00:00";
        imageView.layer.speed = 0.0;
        [_playerBtn setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    }
    
}
- (IBAction)back:(UIButton *)sender {
    arrInedx--;
    if (arrInedx<0) {
        arrInedx = songArr.count-1;
    }
    [self initSong:arrInedx];
}
- (IBAction)forword:(UIButton *)sender {
    arrInedx++;
    if (arrInedx>songArr.count-1) {
        arrInedx = 0;
    }
    [self initSong:arrInedx];
}
@end
