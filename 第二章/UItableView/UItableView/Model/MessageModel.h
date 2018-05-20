//
//  MessageModel.h
//  UItableView
//
//  Created by 郭丰锐 on 2018/3/24.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject

@property(copy, nonatomic)NSString* name;
@property(copy, nonatomic)NSString* time;
@property(copy, nonatomic)NSString* icon;
@property(copy, nonatomic)NSString* message;

@end
