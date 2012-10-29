//
//  NPViewController.m
//  ActivityInd
//
//  Created by Damian on 28/10/2012.
//  Copyright (c) 2012 notatkiprogramisty.blox.pl. All rights reserved.
//

#import "NPViewController.h"

@interface NPViewController ()

   -(void)longRunningOperation;
   -(void)longRunningOperationDidFinish;

@end

@implementation NPViewController

@synthesize fullScreenActivityIndicatorViewController = _fullScreenActivityIndicatorViewController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	//Do any additional setup after loading the view, typically from a nib.
   
   self.fullScreenActivityIndicatorViewController = [[NPFullScreenActivityIndViewController alloc] init];
   //we want to be notified when our long running task ends...
   [[NSNotificationCenter defaultCenter] addObserver:self
                                            selector:@selector(longRunningOperationDidFinish)
                                                name:@"longRunningOperationDidFinish"
                                              object:nil];
}

- (void)dealloc{
   //Please note! We do not call super dealloc here as it's an ARC project!
   [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)longRunningActionWillStart:(id)sender {
   //show activity view
   [self.view addSubview:self.fullScreenActivityIndicatorViewController.view];
   //wait 10 sec... our long running task performed in a separate thread
   [self performSelectorInBackground:@selector(longRunningOperation) withObject:nil];
}

-(void)longRunningOperation {
   sleep(10);
   //notify main thread we're done
   [[NSNotificationCenter defaultCenter] postNotificationName:@"longRunningOperationDidFinish" object:nil];
}

-(void)longRunningOperationDidFinish {
   //hide activity view
   [self.fullScreenActivityIndicatorViewController.view removeFromSuperview];
}

@end
