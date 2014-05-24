//
//  VendorsViewController.m
//  CAF
//
//  Created by Maricia Alleman on 11/3/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "VendorsViewController.h"
#import "VendorDetialViewController.h"
#import "vendor.h"


@interface VendorsViewController ()

@end

@implementation VendorsViewController{
    
}
 - (id)initWithCoder:(NSCoder *)aCoder
{
    
    self = [super initWithCoder:aCoder];
    if (self) {
    //custom table
    
    //the className to query on
    self.parseClassName =@"vendors";
    //the key of the PFObject to display in the label of the default cell style
    self.textKey = @"Name";
    //Whether the built-in pagination is enabled
    self.paginationEnabled = NO;
    //whether the built-in pull-to-refresh is enabled
    self.pullToRefreshEnabled = YES;
    //The number of objects to show per page
   // self.objectsPerPage = 10;
        
   }
return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshTable:)
                                                 name:@"refreshTable"
                                               object:nil];

    
}

- (void)refreshTable:(NSNotification *) notification
{
    // Reload the vendors
    [self loadObjects];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    // If no objects are loaded in memory, we look to the cache first to fill the table
    // and then subsequently do a query against the network.
    
    if ([self.objects count] == 0) {
     query.cachePolicy = kPFCachePolicyCacheThenNetwork;
     }
    
        [query orderByAscending:@"Location"];
    
    return query;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Override to customize the look of a cell representing an object. The default is to display
// a UITableViewCellStyleDefault style cell with the label being the first key in the object.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *simpleTableIdentifier = @"vendorcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    //configure the cell
    PFFile *thumbnail = [object objectForKey:@"Image"];
    PFImageView *thumbnailImageView = (PFImageView*)[cell viewWithTag:100];
    thumbnailImageView.image = [UIImage imageNamed:@"placeholder.jpg"];
    thumbnailImageView.file = thumbnail;
    [thumbnailImageView loadInBackground];
    
    UILabel *nameLabel = (UILabel*) [cell viewWithTag:101];
    nameLabel.text = [object objectForKey:@"Name"];
    
    
    UILabel *locationlabel = (UILabel*) [cell viewWithTag:109];
    locationlabel.text = [object objectForKey:@"Location"];
  //  [locationlabel getcolors];
    
    
    
    UILabel *colorlabel = (UILabel*) [cell viewWithTag:102];
    colorlabel.text = [object objectForKey:@"Color"];
   /* 
    NSString *thecolor = colorlabel.text;
    
  
    if ([thecolor isEqual:@"red"]) {
        UIView *bgColor = [[UIView alloc]init];
        [bgColor setBackgroundColor:[UIColor redColor]];
        [cell setBackgroundView:bgColor];
    }else if ([thecolor isEqual:@"Blue"])
    {
        UIView *bgColor = [[UIView alloc]init];
        [bgColor setBackgroundColor:[UIColor blueColor]];
        [cell setBackgroundView:bgColor];
        
    }else if ([thecolor isEqual:@""])
    {
        UIView *bgColor = [[UIView alloc]init];
        [bgColor setBackgroundColor:[UIColor grayColor]];
        [cell setBackgroundView:bgColor];
    }
  */
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    PFObject *object = [self.objects objectAtIndex:indexPath.row];
    [object deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [self refreshTable:nil];
    }];
}

- (void) objectsDidLoad:(NSError *)error
{
    [super objectsDidLoad:error];
    
    NSLog(@"error: %@", [error localizedDescription]);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showvendordetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        VendorDetialViewController *destViewController = segue.destinationViewController;
        
        PFObject *object = [self.objects objectAtIndex:indexPath.row];
        vendors *vendor = [[vendors alloc] init];
        vendor.name = [object objectForKey:@"Name"];
        vendor.location = [object objectForKey:@"Location"];
        vendor.color = [object objectForKey:@"Color"];
        vendor.description = [object objectForKey:@"description"];
        vendor.fname = [object objectForKey:@"Contact_First_Name"];
        vendor.lname = [object objectForKey:@"Contact_Last_Name"];
        vendor.phone = [object objectForKey:@"Contact_Phone1"];
        vendor.phone2 = [object objectForKey:@"Contact_Phone2"];
        vendor.special = [object objectForKey:@"Misc"];
        vendor.issues = [object objectForKey:@"Issues"];
        vendor.image = [object objectForKey:@"Image"];
        destViewController.vendor = vendor;
        
    }else if ([segue.identifier isEqualToString:@"showaddvendor"])
    {
    
    }
    
}

@end
