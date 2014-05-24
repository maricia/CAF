//
//  VendorViewController.m
//  CAFPublicSafety
//
//  Created by Maricia Alleman on 10/7/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "VendorViewController.h"
#import "Vendors.h"
#import "VendorCell.h"


@interface VendorViewController ()

@end

@implementation VendorViewController{

}
/*- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
 */
-(id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if(self){
        //custon the table
        
        //the classname to query on
        self.parseClassName = @"vendors";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"name";
        
        //the key the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        //Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 10;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source



- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
    
    return query;
}


// Override to customize the look of a cell representing an object. The default is to display
// a UITableViewCellStyleDefault style cell with the label being the first key in the object.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object
{
    static NSString *simpleTableIdentifier = @"vendors";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    //config the cell
    /*
    PFFile *thumbnail = [object objectForKey:@"imageFile"];
    PFImageView *thumbnailImageView = (PFImageView*)[cell viewWithTag:100];
    thumbnailImageView.image = [UIImage imageNamed:@"placeholder.jpg"];
    thumbnailImageView.file = thumbnail;
    [thumbnailImageView loadInBackground];
    */
    UILabel *name = (UILabel*) [cell viewWithTag:101];
    name.text = [object objectForKey:@"name"];
    
    /*UILabel *locationLabel = (UILabel*) [cell viewWithTag:102];
    locationLabel.text = [object objectForKey:@"Location"];
    
    UILabel *colorLabel = (UILabel*) [cell viewWithTag:103];
    colorLabel.text = [object objectForKey:@"Color"];
    
    UILabel *desLabel = (UILabel*) [cell viewWithTag:104];
    desLabel.text = [object objectForKey:@"Description"];
     */
    return cell;
    
}

- (void) objectsDidLoad:(NSError *)error
{
    [super objectsDidLoad:error];
    
    NSLog(@"error: %@", [error localizedDescription]);
}




/*

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.vendors removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
         }
}
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

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   // if ([segue.identifier isEqualToString:@"showvendorsdetail"]){
       // NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
       // VendorViewController *destViewController = segue.destinationViewController;
        
    //    PFObject *object = [self.objects objectAtIndex:indexPath.row];
    //    Vendors *vendors = [[Vendors alloc] init];
    //    vendors.name = [object objectForKey:@"name"];
    //    vendors.location = [object objectForKey:@"location"];
     //   vendors.color = [object objectForKey:@"color"];
       // destViewController.
   // }


}


//#pragma mark - VendorViewControllerDelegate
//
//-(void)vendorDetailsViewControllerDidCancel: (VendorDetailViewController *)controller{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//-(void)vendorDetailsViewControllerDidSave:(VendorDetailViewController *)controller{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

@end
