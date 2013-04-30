//
//  LensKitView.h
//  LensLookupTable
//
//  Created by SIRT on 12-07-31.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//  This class view generates all the lens type (found in software_by_lens.xml) 
//  in the table.
@interface LensKitView : UITableViewController <UITableViewDelegate>

{    
    NSMutableArray *listOfItems;
}

- (void) parseContent;
- (void) backBtnUserClick:(id)sender;

@end
