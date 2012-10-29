//
//  NPViewController.h
//  ActivityInd
//
//  Created by Damian on 28/10/2012.
//  Copyright (c) 2012 notatkiprogramisty.blox.pl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NPFullScreenActivityIndViewController.h"

@interface NPViewController : UIViewController

@property (strong, nonatomic) UIViewController *fullScreenActivityIndicatorViewController;

-(IBAction)longRunningActionWillStart:(id)sender;

@end
