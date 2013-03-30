//
//  UIControl+ALActionBlocks.m
//  ALActionBlocks
//
//  Created by Andy LaVoy on 3/30/13.
//  Copyright (c) 2013 Andy LaVoy. All rights reserved.
//

#import "UIControl+ALActionBlocks.h"
#import <objc/runtime.h>

@interface ALActionBlockWrapper : NSObject

@property (nonatomic, copy) ActionBlock actionBlock;

- (void)invokeBlock:(id)sender;

@end

@implementation ALActionBlockWrapper

- (void)invokeBlock:(id)sender {
    if (self.actionBlock) {
        self.actionBlock(sender);
    }
}


@end


@implementation UIControl (ALActionBlocks)

static NSString *const ALActionBlocksArray = @"ALActionBlocksArray";

- (void)handleControlEvents:(UIControlEvents)controlEvents withBlock:(ActionBlock)actionBlock {
    NSMutableArray *blockActionsArray = objc_getAssociatedObject(self, &ALActionBlocksArray);
    if (!blockActionsArray) {
        blockActionsArray = [NSMutableArray array];
        objc_setAssociatedObject(self, &ALActionBlocksArray, blockActionsArray, OBJC_ASSOCIATION_RETAIN);
    }
    
    ALActionBlockWrapper *blockActionWrapper = [[ALActionBlockWrapper alloc] init];
    [blockActionWrapper setActionBlock:actionBlock];
    [blockActionsArray addObject:blockActionWrapper];
    
    [self addTarget:blockActionWrapper action:@selector(invokeBlock:) forControlEvents:controlEvents];
}

@end