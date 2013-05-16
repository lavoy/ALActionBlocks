//
//  ALActionBlockWrapper.h
//  ALActionBlocks
//
//  Created by Andy LaVoy on 5/16/13.
//  Copyright (c) 2013 Andy LaVoy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ALActionBlock.h"

@interface ALActionBlockWrapper : NSObject

@property (nonatomic, copy) ALActionBlock actionBlock;
@property (nonatomic, assign) UIControlEvents controlEvents;

- (void)invokeBlock:(id)sender;

@end