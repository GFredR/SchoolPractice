//
//  SharedInstence.m
//  单例
//
//  Created by 郭丰锐 on 2018/4/28.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "SharedInstence.h"

static SharedInstence* shareInstance = nil;


@implementation SharedInstence

+ (SharedInstence*)shareTools{
    @synchronized(self){
        if (shareInstance==nil) {
            shareInstance = [[SharedInstence alloc]init];
        }
    }
    
    
    
    return shareInstance;
}
@end
