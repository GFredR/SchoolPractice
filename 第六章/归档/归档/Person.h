//
//  Person.h
//  归档
//
//  Created by 郭丰锐 on 2018/5/17.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property(strong, nonatomic)NSString* name;
@property(assign, nonatomic)int age;

@end
