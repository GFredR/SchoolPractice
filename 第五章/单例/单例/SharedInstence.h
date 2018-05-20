//
//  SharedInstence.h
//  单例
//
//  Created by 郭丰锐 on 2018/4/28.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SharedInstence : NSObject
@property(strong, nonatomic)NSString* name;
@property(strong, nonatomic)UIColor* cl;
+ (SharedInstence*)shareTools;
@end
