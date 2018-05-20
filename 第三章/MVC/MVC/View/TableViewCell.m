//
//  TableViewCell.m
//  MVC
//
//  Created by 郭丰锐 on 2018/3/31.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "TableViewCell.h"
#import "Model.h"
@implementation TableViewCell

- (void)setModel:(Model *)model{
    _model = model;
    
    //获取网络图片
    NSString* furl = _model.image;
    NSURL* url = [NSURL URLWithString:furl];
    NSData* data = [NSData dataWithContentsOfURL:url];
    UIImage* image = [UIImage imageWithData:data];
    
    _moiveView.image = image;
    
    //
    _title.text = _model.title;
    
    _detail.text = _model.summary;
    
}




























@end
