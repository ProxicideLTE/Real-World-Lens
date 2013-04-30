//
//  LensFOVTableViewController.h
//  LensLookupTable
//
//  Created by SIRT on 12-08-13.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//  This table view will diplay all revelent FOV lens data for selected software
//  package and lens kit in the cells.
@interface LensFOVTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

{
    BOOL            dataFound;
    
    NSMutableArray* focalLengths;
    NSMutableArray* fieldOfViews;
}

@property int                           previousView;
@property (nonatomic, retain) NSString* lensKitName;
@property (nonatomic, retain) NSString* softwareName;

- (void) parseContent;
- (void) backBtnUserClick:(id)sender;

@end
