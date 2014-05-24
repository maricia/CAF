//
//  VendorDetialViewController.m
//  CAF
//
//  Created by Maricia Alleman on 11/3/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "VendorDetialViewController.h"
#import <Parse/Parse.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "MBProgressHUD.h"

@interface VendorDetialViewController ()
-(void)textInputChanged:(NSNotification *)note;
-(BOOL)shoulenablephonebutton;

@end

@implementation VendorDetialViewController

@synthesize vendor;
@synthesize vsneedstextfield;
@synthesize vendorPhoto;
@synthesize vphone1txtbox;
@synthesize colortextfield;
@synthesize locationtextfield;
@synthesize vfullnametextfield;
@synthesize vnametextbox;
@synthesize vissuestextbox;
@synthesize phone1;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   
    NSString *thecolor = vendor.color;
  //  NSString *thespot = vendor.location;
    
  
    if ([thecolor  isEqual: @"red"]) {
        self.colortextfield.textColor = [UIColor redColor];
        self.locationtextfield.textColor = [UIColor redColor];
        self.vfullnametextfield.textColor = [UIColor redColor];
        self.vnametextbox.textColor = [UIColor redColor];
    }else if ([thecolor isEqual:@"Blue"]){
        self.colortextfield.textColor = [UIColor blueColor];
        self.locationtextfield.textColor = [UIColor blueColor];
        self.vfullnametextfield.textColor = [UIColor blueColor];
        self.vnametextbox.textColor = [UIColor blueColor];
    }else{
        self.colortextfield.textColor = [UIColor purpleColor];
        self.locationtextfield.textColor = [UIColor purpleColor];
        self.vfullnametextfield.textColor = [UIColor purpleColor];
        self.vnametextbox.textColor = [UIColor purpleColor];
    }
    
    
    //self.title = [NSString stringWithFormat:@"%@ (%@%@)",vendor.Name,thecolor,thespot];
    
    self.title = vendor.Name;
    NSLog(@"firstname>>=%@",vendor.fname);
    NSLog(@"lastname>>=%@",vendor.lname);
  //  if (vendor.fname == nil && vendor.lname == nil) {
  //      vendor.fname = @"no";
  //      vendor.lname = @"name";
  //      self.vfullnametextfield.text = [NSString stringWithFormat:@"%@, %@",vendor.fname,vendor.lname];
  //  }else{
   self.vfullnametextfield.text = [NSString stringWithFormat:@"%@, %@",vendor.fname,vendor.lname];
  //  }
    self.vnametextbox.text = vendor.Name;
    NSLog(@"vnametextbox = %@",vendor.Name);
    NSLog(@"vendor.phone = %@",vendor.phone);
//    NSLog(@"vendor.phone2 = %@",vendor.phone2);
    NSString *thephone = vendor.phone;
//    NSString *thephone2 = vendor.phone2;
    NSLog(@"thephone = %@",thephone);
//    NSLog(@"thephone2 = %@",thephone2);
    
    /*two phone numbers
     
    if (thephone  && thephone2 ) {
        NSString *formatedphone = [NSString stringWithFormat:@"(%@)-%@-%@",[thephone substringWithRange:NSMakeRange(0, 3)],[thephone substringWithRange:NSMakeRange(3, 3)],[thephone substringWithRange:NSMakeRange(6, 4)]];
        self.vphone1txtbox.text = formatedphone;
        NSString *formatedphone2 = [NSString stringWithFormat:@"(%@)-%@-%@",[thephone2 substringWithRange:NSMakeRange(0, 3)],[thephone2 substringWithRange:NSMakeRange(3, 3)],[thephone2 substringWithRange:NSMakeRange(6, 4)]];
        self.vphone2txtbox.text = formatedphone2;
    }else if (thephone  && thephone2 == nil ) {
        self.vphone2txtbox.text = vendor.phone2;
        NSString *formatedphone = [NSString stringWithFormat:@"(%@)-%@-%@",[thephone substringWithRange:NSMakeRange(0, 3)],[thephone substringWithRange:NSMakeRange(3, 3)],[thephone substringWithRange:NSMakeRange(6, 4)]];
        self.vphone1txtbox.text = formatedphone;
    }else if (thephone == nil  && thephone2){
        self.vphone1txtbox.text = vendor.phone;
        NSString *formatedphone2 = [NSString stringWithFormat:@"(%@)-%@-%@",[thephone2 substringWithRange:NSMakeRange(0, 3)],[thephone2 substringWithRange:NSMakeRange(3, 3)],[thephone2 substringWithRange:NSMakeRange(6, 4)]];
        self.vphone2txtbox.text = formatedphone2;
    }else{
        self.vphone2txtbox.text = vendor.phone2;
        self.vphone1txtbox.text = vendor.phone;
    }
  */
  
    if (thephone) {
            NSString *formatedphone = [NSString stringWithFormat:@"(%@)-%@-%@",[thephone substringWithRange:NSMakeRange(0, 3)],[thephone substringWithRange:NSMakeRange(3, 3)],[thephone substringWithRange:NSMakeRange(6, 4)]];
    self.vphone1txtbox.text = formatedphone;
    }else{
    self.vphone1txtbox.text = vendor.phone;
     phone1.enabled = [self shoulenablephonebutton];
    }
    
    
    // self.phone2label.text = [NSString stringWithFormat:@"(%@)-%@-%@",];
    self.colortextfield.text = vendor.color;
    self.locationtextfield.text = vendor.location;
    self.vdescriptiontextfield.text = vendor.description;
    self.vsneedstextfield.text = vendor.special;
    self.vissuestextbox.text=vendor.issues;
    self.vendorPhoto.file = vendor.image;
    
 //   NSMutableString *descriptiontext = [NSMutableString string];
 //   for (NSString* description in vendor.description) {
 //       [descriptiontext appendFormat:@"%@\n", descriptiontext];
 //   }
 //   self.descriptiontext.text = descriptiontext;
//
   }

- (IBAction)phone1:(id)sender {
    if ((vendor.phone == nil))return;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",vendor.phone]]];
}

- (IBAction)imessage1:(id)sender {
    if ((vendor.phone == nil))return;
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",vendor.phone]]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Textfield delegate

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
  //  UITouch *touch = [[event allTouches]anyObject];
    [locationtextfield resignFirstResponder];
    [vfullnametextfield resignFirstResponder];
    [_vdescriptiontextfield resignFirstResponder];
    [vsneedstextfield resignFirstResponder];
    [colortextfield resignFirstResponder];
    [vnametextbox resignFirstResponder];
    [vissuestextbox resignFirstResponder];
    [vphone1txtbox resignFirstResponder];
    
}

- (IBAction)locationtextfield:(id)sender {
    [locationtextfield resignFirstResponder];
}
- (IBAction)vfullnametextfield:(id)sender {
    [vfullnametextfield resignFirstResponder];
}

- (IBAction)vdescriptiontextfield:(id)sender {
    [_vdescriptiontextfield resignFirstResponder];
}
- (IBAction)vsneedstextfield:(id)sender {
    [vsneedstextfield resignFirstResponder];
}
- (IBAction)colortextfield:(id)sender {
    [colortextfield resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showPhotoLibary
{
    if (([UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)) {
        return;
    }
    
    //make object
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    //type of picker
    mediaUI.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    // Displays saved pictures from the Camera Roll album.
    mediaUI.mediaTypes = @[(NSString*)kUTTypeImage];
    
    // Hides the controls for moving & scaling pictures
    mediaUI.allowsEditing = NO;
    
    mediaUI.delegate = self;
    
    [self presentViewController:mediaUI animated:YES completion:NULL];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)mediaUI {
    
    [mediaUI dismissViewControllerAnimated:YES completion:NULL];
    
}

-(BOOL)shoulenablephonebutton{
    BOOL enablePhoneButton = NO;
    if (vphone1txtbox.text != nil && vphone1txtbox.text > 0) {
        enablePhoneButton = YES;
        
    }
    return enablePhoneButton;
}
-(void)textInputChanged:(NSNotification *)note{
    phone1.enabled = [self shoulenablephonebutton];
}
/*
- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    UIImage *originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    self.vendorimageview.image = originalImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

*/


/*
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 NSLog(@"prepareForSegue: %@", segue.identifier);
 
 if ([segue.identifier isEqualToString:@"showedit"]) {
 
 NSLog(@"inside if: %@", segue.identifier);
 
     
 //     NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
 
 VendorDetialViewController *destViewController = [segue destinationViewController];
 //PFObject *object = [object [object.allKeys]init];
 //     vendors *vendor = [[vendors alloc] init];
 [segue.destinationViewController setObjectId:@"Name"];
 [segue.destinationViewController setObjectId:@"vendor"];


 vendor.name = [segue.destinationViewController setObjectId:@"Name"];
 
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

 // destViewController.vendor = vendor;
 
 }else if ([segue.identifier isEqualToString:@"showaddvendor"])
 {
 
 }
 
 }

 */
@end
