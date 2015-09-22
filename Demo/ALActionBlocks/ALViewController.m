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
    self.button.frame = CGRectMake(60, 44 + 64, 200, 44);
    [self.button setTitle:@"Start" forState:UIControlStateNormal];
    [self.button handleControlEvents:UIControlEventTouchUpInside withBlock:^(UIButton *weakButton) {
        NSLog(@"buttton pressed: %@", [weakButton titleForState:UIControlStateNormal]);
        
    }];
    [self.view addSubview:self.button];
    
    UISwitch *aSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(120, 132 + 64, 0, 0)];
    [aSwitch handleControlEvents:UIControlEventValueChanged withBlock:^(id weakControl) {
        NSLog(@"value: %d", aSwitch.isOn);
        
        
        
    }];
    [self.view addSubview:aSwitch];
    
    
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"One", @"Two", @"Three"]];
    segmentedControl.frame = CGRectMake(88, 220 + 64, 143, 30);
    [segmentedControl handleControlEvents:UIControlEventValueChanged withBlock:^(id weakControl) {
        NSLog(@"selected segment: %@", [segmentedControl titleForSegmentAtIndex:segmentedControl.selectedSegmentIndex]);
        if (segmentedControl.selectedSegmentIndex == 2) {
            NSLog(@"removing action block");
            [segmentedControl removeActionBlocksForControlEvents:UIControlEventValueChanged];
        }
    }];
    [self.view addSubview:segmentedControl];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Boom!" style:UIBarButtonItemStyleDone block:^(UIBarButtonItem *weakButton) {
        NSLog(@"%@", [NSString stringWithFormat:@"%@", weakButton.title]);
    }];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd block:^(id weakSender) {
        NSLog(@"add");
    }];
    
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44)];
    [self.view addSubview:toolbar];
    
    UIBarButtonItem *powButton = [[UIBarButtonItem alloc] init];
    [powButton setTitle:@"Pow!"];
    [powButton setBlock:^(id weakSender) {
        NSLog(@"pow!");
    }];
    [toolbar setItems:@[powButton]];
    
    __weak ALViewController *wSelf = self;
    UIPanGestureRecognizer *gr = [[UIPanGestureRecognizer alloc] initWithBlock:^(UIPanGestureRecognizer *weakGR) {
        NSLog(@"pan %@", NSStringFromCGPoint([weakGR locationInView:wSelf.view]));
    }];
    [self.view addGestureRecognizer:gr];
}

@end
