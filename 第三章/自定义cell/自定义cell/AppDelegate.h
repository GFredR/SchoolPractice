//
//  AppDelegate.h
//  自定义cell
//
//  Created by 郭丰锐 on 2018/3/29.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

