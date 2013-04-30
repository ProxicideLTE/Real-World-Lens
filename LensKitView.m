//
//  LensKitView.m
//  LensLookupTable
//
//  Created by SIRT on 12-07-31.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <libxml2/libxml/xmlreader.h>

#import "LensKitView.h"
#import "AppNavigationController.h"
#import "SoftwareByLensTableViewController.h"

@implementation LensKitView

//==============================================================================================
#pragma mark - View Initialization 
//==============================================================================================


/**
 * This method initializes a table-view controller to manage a table view of a given style.
 *
 * @param       style - constant that specifies the style of table view that the controller
 *              object is to manage
 *
 * @return      initialized UITableViewController object or nil if the object couldn’t be created
 *
 */
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

    // Initialize array.
    listOfItems = [[NSMutableArray alloc] init];
    
    // Back button.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(backBtnUserClick:)];
	
    // Parse content.
    [self parseContent];
    
    // Set the title.
    self.navigationItem.title = @"Lens Kit";
    
}

/**
 * This method gets called when the controller’s view is released from memory.
 */
- (void)viewDidUnload
{
    [super viewDidUnload];
}

/**
 * This method notifies the view controller that its view is about to be added to a view hierarch.
 *
 * @param       animated - if YES, the view is being added to the window using an animation
 *
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

/**
 * This method notifies the view controller that its view was added to a view hierarchy.
 *
 * @param       animated - if YES, the view was added to the window using an animation
 *
 */
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

/**
 * Notifies the view controller that its view is about to be removed from a view hierarchy.
 *
 * @param       animated - if YES, the disappearance of the view is being animated
 *
 */
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

/**
 * Notifies the view controller that its view was removed from a view hierarchy.
 *
 * @param       animated - if YES, the disappearance of the view is going to be animated
 *
 */
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//==============================================================================================
#pragma mark - Table view data source
//==============================================================================================


/**
 * This method determines the number of sections.
 *
 * @param       tableView - table-view object requesting this information
 *
 * @return      number of sections in the view
 *
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/**
 * This method determines the number of rows in each section.
 *
 * @param       tableView - table-view object requesting this information 
 *
 * @param       section - index number identifying a section in tableView
 *
 * @return      number of rows per section
 *
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [listOfItems count];
}

/**
 * This method sets the cells in the table view.
 *
 * @param       tableView - table-view object requesting the cell.
 *
 * @param       indexPath - index path locating the row in the receiver
 *
 * @return      the table cell at the specified index path.
 *
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // String for the cell id.
    static NSString *CellIdentifier = @"LensKit";
    
    // Re-use a cell.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Otherwise, create a cell in the table.
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    NSString* cellValue = [listOfItems objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Return the cell.
    return cell;
}

//==============================================================================================
#pragma mark - Table view delegate
//==============================================================================================


/**
 * This method tells the delegate that the specified row is now selected.
 *
 * @param       tableView - table-view object informing the delegate about the new row selection
 *
 * @param       indexPath - index path locating the new selected row in tableView
 *
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // New view controller to switch to.
    SoftwareByLensTableViewController* table = [SoftwareByLensTableViewController alloc];
    AppNavigationController* view = [[AppNavigationController alloc] initWithRootViewController:table];
    
    // Set the lens kit name.
    table.lensKitName = [listOfItems objectAtIndex:indexPath.row];
    
    // Switch view.
    [self presentModalViewController:view animated:YES];

}


//==============================================================================================
#pragma mark - Table Data Filtering
//==============================================================================================


/**
 * This method will parse the content for the table cells for this view.
 */
- (void) parseContent {
    
    // Name and path of the XML file.
    NSString* path = [[NSBundle mainBundle] pathForResource:@"software_by_lens" ofType:@"xml"];
    NSData* xmlData = [NSData dataWithContentsOfFile:path];
    
    // Create an NSXML parser.
    xmlTextReaderPtr reader = xmlReaderForMemory([xmlData bytes], 
                                                 [xmlData length], 
                                                 [path UTF8String], nil, 
                                                 (XML_PARSE_NOBLANKS | XML_PARSE_NOCDATA | XML_PARSE_NOERROR | XML_PARSE_NOWARNING));
    
    // If the XML cannot be found.
    if (!reader) {
        NSLog(@"Failed to load xmlreader");
        return;
    }
    
    // Otherwise, start parsing the XML file.
    else {
        
        // Instance variables.
        char*     temp;
        NSString* currentTagName;
        NSString* currentTagValue;
        
        while (true) {
            
            // End of file, end of loop.
            if (!xmlTextReaderRead(reader)) 
                break;
            
            // Determine each node type.
            switch (xmlTextReaderNodeType(reader)) {
                    
                // Starting an element.
                case XML_READER_TYPE_ELEMENT:
                    
                    // Get the current name of the element.
                    temp =  (char*) xmlTextReaderConstName(reader);
                    currentTagName = [NSString stringWithCString:temp 
                                                        encoding:NSUTF8StringEncoding];
                                        
                    continue;
                    
                // Starting the element's value.
                case XML_READER_TYPE_TEXT:
                    
                    // Get the current element's value as a NSString.
                    temp = (char*)xmlTextReaderConstValue(reader);
                    currentTagValue = [NSString stringWithCString:temp 
                                                         encoding:NSUTF8StringEncoding];
                    
                    // Add the lens kit to the list.
                    if ([currentTagName isEqualToString:@"name"]) {
                        [listOfItems addObject:currentTagValue];
                    }
                    
                    continue;
                                        
                // Default, continue loop.
                default:
                    continue;
                    
            }
            
        }
        
    }
}

//==============================================================================================
#pragma mark - Navigation Bar Events
//==============================================================================================


/**
 * This method will trigger when the navigation button gets clicked.
 */
- (IBAction) backBtnUserClick:(id)sender {
    
    // Go back to the main menu of the app.
    NSLog(@"Back to the main menu");
    
}

@end
