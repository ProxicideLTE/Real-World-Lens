//
//  AppNavigationController.m
//  LensLookupTable
//
//  Created by SIRT on 12-08-15.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppNavigationController.h"

@implementation AppNavigationController

//==============================================================================================
#pragma mark - View Initialization 
//==============================================================================================


/**
 * This method is designated initializer for this class.
 *
 * @param       nibNameOrNil - name of the nib file to associate with the view controller
 *
 * @param       nibBundleOrNil - bundle in which to search for the nib file
 *
 * @return      newly initialized view controller with the nib file in the specified bundle
 *
 */
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/**
 * This method sends to the view controller when the app receives a memory warning.
 */
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

//==============================================================================================
#pragma mark - View lifecycle
//==============================================================================================


/**
 * This method gets called after the controller’s view is loaded into memory.
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/**
 * This method gets called when the controller’s view is released from memory.
 */
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

/**
 * This method indicating whether the view controller supports the specified orientation.
 *
 * @param       interfaceOrientation - orientation of the app’s user interface after the rotation
 *
 * @return      a boolean for supported orientations
 *
 */
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
