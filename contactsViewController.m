//
//  contactsViewController.m
//  CAF
//
//  Created by Maricia Alleman on 10/10/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "contactsViewController.h"

@interface contactsViewController ()

@end

@implementation contactsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)loadDocument:(NSString *)documentName inView:(UIWebView *)webView
{
  // UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectMake(10,10,200,200)];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"ASD-PSSOPpart1"ofType:@"pdf"];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [webView loadRequest:request];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   [self loadDocument:@"ASD-PSSOPpart1.pdf" inView:self.phonelistwebview];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
