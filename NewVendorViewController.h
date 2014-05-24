//
//  NewVendorViewController.h
//  CAF
//
//  Created by Maricia Alleman on 11/5/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface NewVendorViewController : UITableViewController <UITextFieldDelegate>
@interface NewVendorViewController : UITableViewController < UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate >


@property (weak, nonatomic) IBOutlet UIPickerView *colorpicker;
@property (weak, nonatomic) IBOutlet UILabel *colorlabel;

@property(strong, nonatomic) NSArray *colorarray;
@end
