//
//  Person.m
//  设计模式
//
//  Created by 郭丰锐 on 2018/4/26.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"age1"]) {
        _age = [value intValue];
    }
}

@end
