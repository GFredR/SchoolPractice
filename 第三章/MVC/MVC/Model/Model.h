//
//  Model.h
//  MVC
//
//  Created by 郭丰锐 on 2018/3/31.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property(strong, nonatomic)NSString* image;
@property(strong, nonatomic)NSString* title;
@property(strong, nonatomic)NSString* summary;
@property(strong, nonatomic)NSString* score;


//- (NSDictionary *)dataSource;

@end
