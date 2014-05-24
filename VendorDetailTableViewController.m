//
//  VendorDetailTableViewController.m
//  CAF
//
//  Created by Maricia Alleman on 11/8/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "VendorDetailTableViewController.h"


@interface VendorDetailTableViewController ()

@end

@implementation VendorDetailTableViewController

@synthesize vendor;
@synthesize colorlabel;
@synthesize locationlabel;
@synthesize vendornamelabel;
@synthesize vfnamelname;
@synthesize vphone1;
@synthesize vphone2;
@synthesize vdescription;
@synthesize vmisc;
@synthesize vissues;
@synthesize vendorPhoto;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  //  self.navigationItem.rightBarButtonItem = self.editButtonItem;
 
    
    
    
    NSString *thecolor = vendor.color;
    //  NSString *thespot = vendor.location;
    if ([thecolor  isEqual: @"red"]) {
        self.locationlabel.textColor = [UIColor redColor];
        self.vendornamelabel.textColor = [UIColor redColor];
        self.vfnamelname.textColor = [UIColor redColor];
    }else if ([thecolor isEqual:@"Blue"]){
        self.locationlabel.textColor = [UIColor blueColor];
        self.vendornamelabel.textColor = [UIColor blueColor];
        self.vfnamelname.textColor = [UIColor blueColor];
    }else{
        self.locationlabel.textColor = [UIColor grayColor];
        self.vendornamelabel.textColor = [UIColor grayColor];
        self.vfnamelname.textColor = [UIColor grayColor];
    }
    //self.title = [NSString stringWithFormat:@"%@ (%@%@)",vendor.Name,thecolor,thespot];
    self.title = vendor.Name;
    self.vphone1.text = vendor.phone;
    self.vphone2.text = vendor.phone2;
    self.vfnamelname.text = vendor.fname;
 //   self.lnamelabel.text = vendor.lname;
    self.colorlabel.text = vendor.color;
    self.locationlabel.text = vendor.location;
    self.vdescription.text = vendor.description;
    self.vmisc.text = vendor.special;
    self.vissues.text=vendor.issues;
   // self.vendorPhoto.file = vendor.image;
    
    


}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
