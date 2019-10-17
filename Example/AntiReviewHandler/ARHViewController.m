//
//  ARHViewController.m
//  AntiReviewHandler
//
//  Created by linus on 10/17/2019.
//  Copyright (c) 2019 linus. All rights reserved.
//

#import "ARHViewController.h"
#import <AntiReviewHandler/AntiReviewHandler.h>

@interface ARHViewController ()

@end

@implementation ARHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [AntiReviewHandler configureDefaultInReviewSwitch:false]; // With or without this sentence, default switch is always false.
    NSLog(@"configureDefaultInReviewSwitch:false");
    [AntiReviewHandler dealInReviewWithSwitchOnBlock:^{
        NSLog(@"inReview");
    } SwitchOffBlock:^{
        NSLog(@"notInReview");
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [AntiReviewHandler saveInReviewSwitchFromServer:true];
    NSLog(@"saveInReviewSwitchFromServer:true");
    [AntiReviewHandler dealInReviewWithSwitchOnBlock:^{
        NSLog(@"inReview");
    } SwitchOffBlock:^{
        NSLog(@"notInReview");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
