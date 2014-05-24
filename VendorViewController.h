//
//  VendorViewController.h
//  CAFPublicSafety
//
//  Created by Maricia Alleman on 10/7/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@class VendorViewController;

 @protocol VendorViewControllerDelegate <NSObject>
-(void)VendorViewControllerDidCancel:
(VendorViewController *)controller;
-(void)VendorViewControllerDidSave:
(VendorViewController *)controller;
@end

@interface VendorViewController : PFQueryTableViewController

/*@property (nonatomic, strong) NSMutableArray *vendors;

@property (nonatomic,weak) id <VendorViewControllerDelegate>delegate;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;
*/
 @end
