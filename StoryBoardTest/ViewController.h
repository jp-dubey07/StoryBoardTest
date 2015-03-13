//
//  ViewController.h
//  StoryBoardTest
//
//  Created by MACBOOK-MUM on 07/02/15.
//  Copyright (c) 2015 MACBOOK-MUM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>


@property(nonatomic,strong) IBOutlet UITextField *txtUsername;
@property(nonatomic,strong) IBOutlet UITextField *txtPassword;
@property(nonatomic,strong) IBOutlet UIScrollView *objScrollView;

-(IBAction)btnLoginClicked;
-(IBAction)btnResetClicked;

@end

