//
//  ALViewController.m
//  ALActionBlocks
//
//  Created by Andy LaVoy on 3/30/13.
//  Copyright (c) 2013 Andy LaVoy. All rights reserved.
//

#import "ALViewController.h"
#import "UIControl+ALActionBlocks.h"

@interface ALViewController ()

@end

@implementation ALViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(60, 88, 200, 44);
    [button setTitle:@"Start" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    [button handleControlEvents:UIControlEventTouchUpInside withBlock:^(UIButton *sender) {
        NSLog(@"buttton pressed: %@", [sender titleForState:UIControlStateNormal]);
    }];
}


@end
