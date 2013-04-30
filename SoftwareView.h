//
//  SoftwareView.h
//  LensLookupTable
//
//  Created by SIRT on 12-08-08.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * This class view generates all the software programs 
 * (found in lens_by_software.xml) in the table.
 */
@interface SoftwareView : UITableViewController

{    
    NSMutableArray *listOfItems;
}

- (void) parseContent;
- (void) backBtnUserClick:(id)sender;

@end
