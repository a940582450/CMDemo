//
//  ViewController.m
//  CMDemo
//
//  Created by tianlong on 2019/2/26.
//  Copyright © 2019 tianlong. All rights reserved.
//

#import "ViewController.h"
#import <CMSDK/CMSDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)startBlackListDetection:(id)sender
{
    [CMSDKInterface startWithMobile:@"用户的手机号" detectionType:CMDetectionTypeBlackList];
}
- (IBAction)startNetLoanDetection:(id)sender
{
    [CMSDKInterface startWithMobile:@"用户的手机号" detectionType:CMDetectionTypeNetLoan];
}
- (IBAction)startComprehensiveDetection:(id)sender
{
    [CMSDKInterface startWithMobile:@"用户的手机号" detectionType:CMDetectionTypeComprehensive];
}
@end
