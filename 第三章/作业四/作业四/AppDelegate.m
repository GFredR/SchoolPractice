//
//  AppDelegate.m
//  作业四
//
//  Created by 郭丰锐 on 2018/4/1.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow* window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window = window;
    
    FirstViewController* firstVC = [[FirstViewController alloc] init];
    
    SecondViewController* secondVC = [[SecondViewController alloc] init];
    
    ThirdViewController* thirdVC = [[ThirdViewController alloc] init];
    
    FourthViewController* fourthVC = [[FourthViewController alloc] init];
    
    FifthViewController* fifthVC = [[FifthViewController alloc] init];
    
    UINavigationController* firstNav = [[UINavigationController alloc] initWithRootViewController:firstVC];
    UINavigationController* secondNav = [[UINavigationController alloc] initWithRootViewController:secondVC];
    UINavigationController* thirdNav = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    UINavigationController* fourthNav = [[UINavigationController alloc] initWithRootViewController:fourthVC];
    UINavigationController* fifthNav = [[UINavigationController alloc] initWithRootViewController:fifthVC];

    UITabBarController* tab = [[UITabBarController alloc]init];
    
    
    [tab setViewControllers:@[firstNav,secondNav,thirdNav,fourthNav, fifthNav]];
    
    
    
    [firstNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background_ios7@2x"] forBarMetrics:UIBarMetricsDefault];
    
    [secondNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background_ios7@2x"] forBarMetrics:UIBarMetricsDefault];
    
    [thirdNav.navigationBar setBackgroundImage:[UIImage imageNamed:@"top_navigation_background_ios7@2x"] forBarMetrics:UIBarMetricsDefault];
    
   firstVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:[UIImage imageNamed:@"depth_finalPage_zoomIn_button_highlighted@2x"] selectedImage:[UIImage imageNamed:@"depth_finalPage_zoomIn_button_normal@2x"]];
    
    [firstNav.tabBarItem setSelectedImage:[[UIImage imageNamed:@"depth_finalPage_zoomIn_button_normal@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
    
    secondVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"收藏" image:[UIImage imageNamed:@"depth_finalPage_collect_button_normal@2x"] selectedImage:[UIImage imageNamed:@"depth_finalPage_collect_button_highlighted@2x"]];
    
    
    thirdVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"评论" image:[UIImage imageNamed:@"depth_finalPage_comment_button_highlighted@2x"] selectedImage:[UIImage imageNamed:@"depth_finalPage_comment_button_normal@2x"]];

    fourthVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"分享" image:[UIImage imageNamed:@"depth_finalPage_share_button_highlighted@2x"] selectedImage:[UIImage imageNamed:@"depth_finalPage_share_button_normal@2x.png"]];
    
    fifthVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[UIImage imageNamed:@"depth_finalPage_love_button_normal@2x"] selectedImage:[UIImage imageNamed:@"depth_finalPage_love_button_normal@2x.png"]];
    
    [tab.tabBar setBackgroundImage:[UIImage imageNamed:@"depth_finalPage_buttons_background@2x"]];
    
    //firstNav.navigationBar setBackgroundImage:<#(nullable UIImage *)#> forBarMetrics:<#(UIBarMetrics)#>
    
    [self.window setRootViewController:tab];
    
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"___"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
