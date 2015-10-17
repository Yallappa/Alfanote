//
//  ANUtility.m
//  Alfanote
//
//  Created by Yallappa Kuntennavar on 6/5/14.
//  Copyright (c) 2014 YPK. All rights reserved.
//

#import "ANUtility.h"

@implementation ANUtility

+ (BOOL)iOSVersionIsAtLeastiOS7
{
    return (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1);
}

@end
