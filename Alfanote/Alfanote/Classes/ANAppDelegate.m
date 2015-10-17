//
//  ANAppDelegate.m
//  Alfanote
//
//  Created by Yallappa Kuntennavar on 6/4/14.
//  Copyright (c) 2014 YPK. All rights reserved.
//

#import "ANAppDelegate.h"
#import "ANDrawerBaseVC.h"
#import "MMDrawerController.h"
#import "MMExampleDrawerVisualStateManager.h"
#import "ANDrawerBaseVC.h"
#import "ANLoginViewController.h"
#import "ANLeftMainMenuVC.h"

@implementation ANAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    self.hasLoggedIn = YES;
    
    UIViewController *rootViewController = nil;
    
    if (_hasLoggedIn)
    {
        ANLeftMainMenuVC *leftSideDrawerViewController = [[ANLeftMainMenuVC alloc] init];
        UIViewController *centerViewController = [[ANDrawerBaseVC alloc] init];
        
        UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
        [navigationController setRestorationIdentifier:@"MMExampleCenterNavigationControllerRestorationKey"];
        if([ANUtility iOSVersionIsAtLeastiOS7])
        {
            UINavigationController * leftSideNavController = [[UINavigationController alloc] initWithRootViewController:leftSideDrawerViewController];
            [leftSideNavController setRestorationIdentifier:@"MMExampleLeftNavigationControllerRestorationKey"];
            
            self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:navigationController
                                                                    leftDrawerViewController:leftSideDrawerViewController];
            
            [_drawerController setShowsShadow:NO];
        }
        else
        {
            _drawerController = [[MMDrawerController alloc] initWithCenterViewController:navigationController
                                                                leftDrawerViewController:leftSideDrawerViewController];
        }
        
        [_drawerController setRestorationIdentifier:@"MMDrawer"];
        _drawerController.maximumRightDrawerWidth = 200.0;
        _drawerController.showsShadow = YES;
        [_drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
        [_drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
        [[MMExampleDrawerVisualStateManager sharedManager] setLeftDrawerAnimationType:MMDrawerAnimationTypeParallax];
        [[MMExampleDrawerVisualStateManager sharedManager] setRightDrawerAnimationType:MMDrawerAnimationTypeParallax];
        
        [_drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
            
            MMDrawerControllerDrawerVisualStateBlock block;
            block = [[MMExampleDrawerVisualStateManager sharedManager] drawerVisualStateBlockForDrawerSide:drawerSide];
            
            if(block)
            {
                block(drawerController, drawerSide, percentVisible);
            }
        }];
        
        rootViewController = _drawerController;
    }
    else
    {
        ANLoginViewController *loginViewController = [[ANLoginViewController alloc] init];
        rootViewController = loginViewController;
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    if([ANUtility iOSVersionIsAtLeastiOS7])
    {
        UIColor * tintColor = [UIColor colorWithRed:29.0/255.0
                                              green:173.0/255.0
                                               blue:234.0/255.0
                                              alpha:1.0];
        [self.window setTintColor:tintColor];
    }
    
    self.window.rootViewController = rootViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
