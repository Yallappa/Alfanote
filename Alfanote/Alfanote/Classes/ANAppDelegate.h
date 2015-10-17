//
//  ANAppDelegate.h
//  Alfanote
//
//  Created by Yallappa Kuntennavar on 6/4/14.
//  Copyright (c) 2014 YPK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMDrawerController;

@interface ANAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (unsafe_unretained, nonatomic) BOOL hasLoggedIn;

@property (strong, nonatomic) MMDrawerController *drawerController;

@end
