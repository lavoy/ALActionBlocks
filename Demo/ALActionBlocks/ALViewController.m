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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(60, 44, 200, 44);
    [button setTitle:@"Start" forState:UIControlStateNormal];
    [button handleControlEvents:UIControlEventTouchUpInside withBlock:^(UIButton *sender) {
        NSLog(@"buttton pressed: %@", [sender titleForState:UIControlStateNormal]);
    }];
    [self.view addSubview:button];
    
    UISwitch *aSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(120, 132, 0, 0)];
    [aSwitch handleControlEvents:UIControlEventValueChanged withBlock:^(UISwitch *sender) {
        NSLog(@"value: %d", sender.isOn);
    }];
    [self.view addSubview:aSwitch];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"One", @"Two", @"Three"]];
    segmentedControl.frame = CGRectMake(88, 220, 143, 30);
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [segmentedControl handleControlEvents:UIControlEventValueChanged withBlock:^(UISegmentedControl *sender) {
        NSLog(@"selected segment: %@", [sender titleForSegmentAtIndex:sender.selectedSegmentIndex]);
        if (sender.selectedSegmentIndex == 2) {
            NSLog(@"removing action block");
            [segmentedControl removeActionBlocksForControlEvents:UIControlEventValueChanged];
        }
    }];
    [self.view addSubview:segmentedControl];
}


@end
