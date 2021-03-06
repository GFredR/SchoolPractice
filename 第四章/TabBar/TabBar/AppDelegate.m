//
//  AppDelegate.m
//  TabBar
//
//  Created by 郭丰锐 on 2018/4/16.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SecondViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    
    ViewController* vc = [[ViewController alloc]init];
    
    SecondViewController* secondVC = [[SecondViewController alloc]init];
    
    UINavigationController* firstNav = [[UINavigationController alloc]initWithRootViewController:vc];
    
    UINavigationController* secondNav = [[UINavigationController alloc]initWithRootViewController:secondVC];
    
    UITabBarController* tab = [[UITabBarController alloc]init];
    
    [tab setViewControllers:@[firstNav,secondNav]];
    
    firstNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"第一页" image:[UIImage imageNamed:@"ff_IconBottle@2x"] selectedImage:[UIImage imageNamed:@"ff_IconBottle@2x"]];
    
    secondNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"第二页" image:[UIImage imageNamed:@"ff_IconLocationService@2x"] selectedImage:[UIImage imageNamed:@"ff_IconLocationService@2x"]];
    
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
