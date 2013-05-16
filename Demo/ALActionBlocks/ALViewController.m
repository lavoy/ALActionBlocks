//
//  ALViewController.m
//  ALActionBlocks
//
//  Created by Andy LaVoy on 3/30/13.
//  Copyright (c) 2013 Andy LaVoy. All rights reserved.
//

#import "ALViewController.h"
#import "ALActionBlocks.h"

@interface ALViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation ALViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"ALActionBlocks";
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button.frame = CGRectMake(60, 44, 200, 44);
    [self.button setTitle:@"Start" forState:UIControlStateNormal];
    [self.button handleControlEvents:UIControlEventTouchUpInside withBlock:^(UIButton *weakButton) {
        NSLog(@"buttton pressed: %@", [weakButton titleForState:UIControlStateNormal]);
    }];
    [self.view addSubview:self.button];
    
    UISwitch *aSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(120, 132, 0, 0)];
    [aSwitch handleControlEvents:UIControlEventValueChanged withBlock:^(id weakControl) {
        NSLog(@"value: %d", aSwitch.isOn);
    }];
    [self.view addSubview:aSwitch];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"One", @"Two", @"Three"]];
    segmentedControl.frame = CGRectMake(88, 220, 143, 30);
    segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [segmentedControl handleControlEvents:UIControlEventValueChanged withBlock:^(id weakControl) {
        NSLog(@"selected segment: %@", [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex]);
        if (segmentedControl.selectedSegmentIndex == 2) {
            NSLog(@"removing action block");
            [segmentedControl removeActionBlocksForControlEvents:UIControlEventValueChanged];
        }
    }];
    [self.view addSubview:segmentedControl];
    
    
}


@end
