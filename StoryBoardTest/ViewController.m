//
//  ViewController.m
//  StoryBoardTest
//
//  Created by MACBOOK-MUM on 07/02/15.
//  Copyright (c) 2015 MACBOOK-MUM. All rights reserved.
//


#import "ViewController.h"

#define EMPTY_STRING @"";

//Ref.http://jayprakashdubey.blogspot.in/2014/07/animate-scrollview-on-editing.html

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;

@interface ViewController () {

    NSString *strUsername;
    NSString *password;
    
    float animatedDistance;
}

@end

@implementation ViewController

@synthesize txtUsername,txtPassword,objScrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)btnLoginClicked {
    NSLog(@"btnLoginClicked!");
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Info"
                                                     ofType:@"plist"];
    
    NSDictionary *names = [[NSDictionary alloc]
                           initWithContentsOfFile:plistPath];
    
    // NSLog(@"plistPath : %@ [names description] : %@",plistPath,[names description]);
    NSLog(@"Uname : %@  Pwd : %@",[names valueForKey:@"Username"],
          [names valueForKey:@"Password"]);
    
    if ([txtUsername.text isEqualToString:[names valueForKey:@"Username"]] && [txtPassword.text isEqualToString:[names valueForKey:@"Password"]]) {
        
        [self performSelector:@selector(pushToNextVC)
                   withObject:nil afterDelay:1.0];
    }
    else {
        
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Login Fail" message:@"Invalid username/password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];

        [error show];
    }
    
    
  /*  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    MyNewViewController *myVC = (MyNewViewController *)[storyboard instantiateViewControllerWithIdentifier:@"myViewCont"]; */
}

- (void)pushToNextVC {
    [self performSegueWithIdentifier:@"NextViewController" sender:self];
}

-(IBAction)btnResetClicked {
    NSLog(@"btnResetClicked!");
   
    txtUsername.text = EMPTY_STRING;
    txtPassword.text = EMPTY_STRING;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    //Perform Animation during Keyboard show and Hide
    CGRect textFieldRect = [self.view.window convertRect:textField.bounds fromView:textField];
    CGRect viewRect = [self.view.window convertRect:self.view.bounds fromView:self.view];
    
    CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
    CGFloat numerator = midline - viewRect.origin.y - MINIMUM_SCROLL_FRACTION * viewRect.size.height;
    
    CGFloat denominator = (MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION) * viewRect.size.height;
    CGFloat heightFraction = numerator / denominator;
    
    if (heightFraction < 0.0) {
        heightFraction = 0.0;
    }
    else if (heightFraction > 1.0) {
        heightFraction = 1.0;
    }
    
    animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y -= animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {

   // [textField resignFirstResponder];
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {

    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
