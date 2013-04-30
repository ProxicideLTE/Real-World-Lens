//
//  SoftwareByLensTableViewController.h
//  LensLookupTable
//
//  Created by SIRT on 12-08-08.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//  This class will generate a list of software programs that are filtered 
//  by the name of the lens kit selected.
@interface SoftwareByLensTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

{    
    NSMutableArray *listOfItems;
}

@property (nonatomic, retain) NSString* lensKitName;

- (void) parseContent;
- (void) backBtnUserClick:(id)sender;

@end
