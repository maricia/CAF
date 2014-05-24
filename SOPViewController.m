//
//  SOPViewController.m
//  CAF
//
//  Created by Maricia Alleman on 10/10/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "SOPViewController.h"

@interface SOPViewController ()

@end

@implementation SOPViewController
@synthesize sopwebview = _UIWebView;

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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"contact"ofType:@"html"];
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [webView loadRequest:request];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"Phone List";
    
    [super viewDidLoad];
    
//    NSString *fullURL = @"http://webadvisor.odessa.edu/mtest/contact.html";
//    NSURL *url = [NSURL URLWithString:fullURL];
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//    [self.sopwebview loadRequest:requestObj];

    [self loadDocument:@"contact.html" inView:self.sopwebview];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end