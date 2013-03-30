//
//  ALAppDelegate.h
//  ALActionBlocks
//
//  Created by Andy LaVoy on 3/30/13.
//  Copyright (c) 2013 Andy LaVoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ALViewController;

@interface ALAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ALViewController *viewController;

@end
