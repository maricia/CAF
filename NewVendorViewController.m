//
//  NewVendorViewController.m
//  CAF
//
//  Created by Maricia Alleman on 11/5/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "NewVendorViewController.h"
#import <Parse/Parse.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "MBProgressHUD.h"



@interface NewVendorViewController ()
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *vendorimageview;
@property (weak, nonatomic) IBOutlet UITextField *vfnametextfield;
@property (weak, nonatomic) IBOutlet UITextField *vlastnametextfield;
@property (weak, nonatomic) IBOutlet UITextField *cphone1textfield;
@property (weak, nonatomic) IBOutlet UITextField *vphone2textfield;
@property (weak, nonatomic) IBOutlet UITextField *vsneedstextfield;
@property (weak, nonatomic) IBOutlet UITextField *vissuetextfield;
@property (weak, nonatomic) IBOutlet UITextField *vloctiontextfield;
@property (weak, nonatomic) IBOutlet UITextField *vendornametextfield;
@property (weak, nonatomic) IBOutlet UITextField *venderdesctectfield;
@property (weak, nonatomic) IBOutlet UITextField *imagename;


@end

@implementation NewVendorViewController

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
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _vfnametextfield.delegate = self;
    _vlastnametextfield.delegate = self;
    _cphone1textfield.delegate = self;
    _vphone2textfield.delegate = self;
    _vsneedstextfield.delegate = self;
    _vissuetextfield.delegate = self;
    _vloctiontextfield.delegate = self;
    _vendornametextfield.delegate = self;
    _venderdesctectfield.delegate = self;
    _imagename.delegate = self;
    
    self.colorarray = [[NSArray alloc] initWithObjects:@"White",@"Blue",@"red", nil];
    _colorpicker.delegate = self;
    _colorpicker.dataSource = self;
    
    
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

#pragma mark - Table view delegate

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    //create PFObject with vendor info
    PFObject *vendor = [PFObject objectWithClassName:@"vendors"];

    [vendor setObject:_vendornametextfield.text forKey:@"Name"];
    [vendor setObject:_vloctiontextfield.text forKey:@"Location"];
    [vendor setObject:_vfnametextfield.text forKey:@"Contact_First_Name"];
    [vendor setObject:_vlastnametextfield.text forKey:@"Contact_Last_Name"];
    [vendor setObject:_venderdesctectfield.text forKey:@"description"];
    [vendor setObject:_vsneedstextfield.text forKey:@"Misc"];
    [vendor setObject:_vissuetextfield.text forKey:@"Issues"];
    [vendor setObject:_cphone1textfield.text forKey:@"Contact_Phone1"];
    [vendor setObject:_vphone2textfield.text forKey:@"Contact_Phone2"];
     /*
    NSArray *issue = [_vissuetextfield.text componentsSeparatedByString: @","];
    [vendor setObject:issue forKey:@"Issues"];
    
    NSArray *misc = [_vsneedstextfield.text componentsSeparatedByString:@","];
    [vendor setObject:misc forKey:@"Misc"];
 */
    //vendor image
    NSData *imageData = UIImageJPEGRepresentation(_vendorimageview.image, 0.0);

    NSString *filename = [NSString stringWithFormat:@"%@.jpg",_imagename.text];
    PFFile *imageFile = [PFFile fileWithName:filename data:imageData];
    [vendor setObject:imageFile forKey:@"Image"];
    //vendor[@"Image"] = imageFile;
   
   
    //show progress
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Uploading";
    [hud show:YES];
    
    //upload vendor to parse
    [vendor saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
   
        [hud hide:YES];
        
        if (!error) {
            //show success message
       //     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload Complete" message:@"Vendor saved" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
          //  [alert show];
            
            //reload table from cloud
            [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshTable" object:self];
            
            //dismiss controller
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Upload failed" message:[error localizedDescription] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            
        }
        
    
    }];
    
}

#pragma mark - Textfield delegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(BOOL)textBoxShouldReturn:(UITextField *)textBox
{
    [textBox resignFirstResponder];
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     if ((indexPath.section == 4) && (indexPath.row == 1)) {
        [self showPhotoLibary];
    }
}

- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    UIImage *originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    self.vendorimageview.image = originalImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.colorarray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.colorarray objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Selected Row %ld", (long)row);
    switch (row) {
        case 0:
            self.colorlabel.text = @"White ";
            self.colorlabel.textColor = [UIColor purpleColor];
            break;
        case 1:
            self.colorlabel.text = @"Blue ";
            self.colorlabel.textColor = [UIColor blueColor];
            break;
        case 2:
            self.colorlabel.text = @"red ";
            self.colorlabel.textColor = [UIColor redColor];
            break;
        default:
            break;
    }
}

@end
