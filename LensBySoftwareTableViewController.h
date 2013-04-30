//
//  LensBySoftwareTableView.h
//  LensLookupTable
//
//  Created by SIRT on 12-08-08.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//  This class will generate a list of lens kits that are filtered by the software programs.
@interface LensBySoftwareTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

{    
    NSMutableArray *listOfItems;
}

@property (nonatomic, retain) NSString* softwareName;

- (void) parseContent;
- (void) backBtnUserClick:(id)sender;

@end
