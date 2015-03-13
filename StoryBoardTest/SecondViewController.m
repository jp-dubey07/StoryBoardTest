//
//  SecondViewController.m
//  StoryBoardTest
//
//  Created by MACBOOK-MUM on 11/02/15.
//  Copyright (c) 2015 MACBOOK-MUM. All rights reserved.
//

//#define IMAGE_URL @"http://intercollege-website.s3.amazonaws.com/ios.png";

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.       
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startLocalNotification {  // Bind this method to UIButton action
    NSLog(@"startLocalNotification");
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:7];
    notification.alertBody = @"This is local notification!";
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.applicationIconBadgeNumber = 10;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
