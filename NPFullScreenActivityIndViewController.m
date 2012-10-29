//
//  NPFullScreenActivityIndViewController.m
//  ActivityInd
//
//  Created by Damian on 28/10/2012.
//  Copyright (c) 2012 notatkiprogramisty.blox.pl. All rights reserved.
//

#import "NPFullScreenActivityIndViewController.h"

@interface NPFullScreenActivityIndViewController ()

@end

@implementation NPFullScreenActivityIndViewController

@synthesize activityIndicator = _activityIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
   self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
   if (self) {
      // Custom initialization
   }
   return self;
}

- (void)viewDidLoad
{
   [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
   [self.activityIndicator startAnimating];
}

- (void)viewWillDisappear:(BOOL)animated {
   [self.activityIndicator stopAnimating];
}

@end
