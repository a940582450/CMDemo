//
//  ViewController.m
//  CMDemo
//
//  Created by tianlong on 2019/2/26.
//  Copyright © 2019 tianlong. All rights reserved.
//

#import "ViewController.h"
#import <CMSDK/CMSDK.h>
#import "TimeStampTool.h"

@interface ViewController ()<UITextFieldDelegate>
//此处textfield用于测试
//输入对应的手机号就可以进行该用户的检测
//模拟的是66钱庄接入sdk时的场景
@property (nonatomic,weak) IBOutlet UITextField* mobileTextfield;

@property (nonatomic,weak) IBOutlet UILabel* blackReportDateLabel;
@property (nonatomic,weak) IBOutlet UILabel* blackReportNextDateLabel;

@property (nonatomic,weak) IBOutlet UILabel* netLoanReportDateLabel;
@property (nonatomic,weak) IBOutlet UILabel* netLoanReportNextDateLabel;

@property (nonatomic,weak) IBOutlet UILabel* comprehensiveReportDateLabel;
@property (nonatomic,weak) IBOutlet UILabel* comprehensiveReportNextDateLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//进行黑名单检测
- (IBAction)startBlackListDetection:(id)sender
{
    [self check];
    [CMSDKInterface startWithMobile:self.mobileTextfield.text detectionType:CMDetectionTypeBlackList];
}
- (IBAction)startNetLoanDetection:(id)sender
{
    [self check];
    [CMSDKInterface startWithMobile:self.mobileTextfield.text detectionType:CMDetectionTypeNetLoan];
}
- (IBAction)startComprehensiveDetection:(id)sender
{
    [self check];
    [CMSDKInterface startWithMobile:self.mobileTextfield.text detectionType:CMDetectionTypeComprehensive];
}

-(IBAction)refreshBlackReportInfo:(id)sender
{
    [CMSDKInterface queryReportStatusWithMobile:self.mobileTextfield.text detectionType:CMDetectionTypeBlackList block:^(BOOL hasReport, NSString *reportDate, NSString *updateDate) {
        if (reportDate) {
            NSString* reportDateString = [TimeStampTool timeStyle:TTTimeStyleYearMonthDay timeStamp:reportDate.doubleValue/1000];
            self.blackReportDateLabel.text = reportDateString;
        }
        else{
            self.blackReportDateLabel.text = @"暂无报告";
        }
        if (updateDate) {
            NSString* updateDateString = [TimeStampTool timeStyle:TTTimeStyleYearMonthDay timeStamp:updateDate.doubleValue/1000];
            self.blackReportNextDateLabel.text = updateDateString;
        }
        else{
            self.blackReportNextDateLabel.text = @"暂无报告";
        }
    }];
}
-(IBAction)refreshNetloanReportInfo:(id)sender
{
    [CMSDKInterface queryReportStatusWithMobile:self.mobileTextfield.text detectionType:CMDetectionTypeNetLoan block:^(BOOL hasReport, NSString *reportDate, NSString *updateDate) {
        if (reportDate) {
            NSString* reportDateString = [TimeStampTool timeStyle:TTTimeStyleYearMonthDay timeStamp:reportDate.doubleValue/1000];
            self.netLoanReportDateLabel.text = reportDateString;
        }
        else{
            self.netLoanReportDateLabel.text = @"暂无报告";
        }
        if (updateDate) {
            NSString* updateDateString = [TimeStampTool timeStyle:TTTimeStyleYearMonthDay timeStamp:updateDate.doubleValue/1000];
            self.netLoanReportNextDateLabel.text = updateDateString;
        }
        else{
            self.netLoanReportNextDateLabel.text = @"暂无报告";
        }
    }];
}
-(IBAction)refreshComprehensiveReportInfo:(id)sender
{
    [CMSDKInterface queryReportStatusWithMobile:self.mobileTextfield.text detectionType:CMDetectionTypeComprehensive block:^(BOOL hasReport, NSString *reportDate, NSString *updateDate) {
        if (reportDate) {
            NSString* reportDateString = [TimeStampTool timeStyle:TTTimeStyleYearMonthDay timeStamp:reportDate.doubleValue/1000];
            self.comprehensiveReportDateLabel.text = reportDateString;
        }
        else{
            self.comprehensiveReportDateLabel.text = @"暂无报告";
        }
        if (updateDate) {
            NSString* updateDateString = [TimeStampTool timeStyle:TTTimeStyleYearMonthDay timeStamp:updateDate.doubleValue/1000];
            self.comprehensiveReportNextDateLabel.text = updateDateString;
        }
        else{
            self.comprehensiveReportNextDateLabel.text = @"暂无报告";
        }
    }];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.mobileTextfield resignFirstResponder];
}

-(void)check{
    if (self.mobileTextfield.text.length!=11) {
        UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"手机号输入错误" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertVC animated:YES completion:nil];
        UIAlertAction* action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alertVC dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertVC addAction:action];
        return;
    }
    [[NSUserDefaults standardUserDefaults]setObject:self.mobileTextfield.text forKey:@"CCLMobile"];
}
@end
