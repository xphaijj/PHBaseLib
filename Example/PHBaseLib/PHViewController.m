//
//  PHViewController.m
//  PHBaseLib
//
//  Created by xphaijj0305@126.com on 07/08/2017.
//  Copyright (c) 2017 xphaijj0305@126.com. All rights reserved.
//

#import "PHViewController.h"

@interface PHViewController ()

@end

@implementation PHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSDictionary *data = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PHConfig" ofType:@"plist"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
