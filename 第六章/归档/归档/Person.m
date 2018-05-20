//
//  Person.m
//  归档
//
//  Created by 郭丰锐 on 2018/5/17.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntForKey:@"age"];

    }
    return self;
    }

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
}
- (NSString *)description{
    return [NSString stringWithFormat:@"name=%@,age=%d",_name,_age];
}
@end
