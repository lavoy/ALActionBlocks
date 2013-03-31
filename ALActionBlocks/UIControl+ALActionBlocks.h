//
//  UIControl+ALActionBlocks.h
//  ALActionBlocks
//
//  Created by Andy LaVoy on 3/30/13.
//  Copyright (c) 2013 Andy LaVoy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)(id sender);

@interface UIControl (ALActionBlocks)

- (void)handleControlEvents:(UIControlEvents)controlEvents withBlock:(ActionBlock)actionBlock;
- (void)removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;

@end