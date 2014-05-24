//
//  locationMapViewController.m
//  CAF
//
//  Created by Maricia Alleman on 10/10/13.
//  Copyright (c) 2013 maricia. All rights reserved.
//

#import "locationMapViewController.h"

@interface locationMapViewController ()

@property (strong,nonatomic)UIImageView *imageView;

-(void)centerScrollViewContents;
-(void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer;
-(void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer;
@end

@implementation locationMapViewController
@synthesize imageView = _imageView;
@synthesize locationMapScrollView = _scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)centerScrollViewContents {
    CGSize boundsSize = self.locationMapScrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.imageView.frame = contentsFrame;
}


-(void)scrollViewDoubleTapped:(UITapGestureRecognizer *)recognizer{
    //1
    CGPoint pointInView = [recognizer locationInView:self.imageView];
    
    //2
    CGFloat newZoomScale = self.locationMapScrollView.zoomScale * 1.5f;
    newZoomScale = MIN(newZoomScale, self.locationMapScrollView.maximumZoomScale);
    
    //3
    CGSize scrollViewSize = self.locationMapScrollView.bounds.size;
    
    CGFloat w = scrollViewSize.width / newZoomScale;
    CGFloat h = scrollViewSize.height / newZoomScale;
    CGFloat x = pointInView.x - (w / 2.0f);
    CGFloat y = pointInView.y - (h / 2.0f);
    
    CGRect rectToZoomTo = CGRectMake(x, y, w, h);
    
    //4
    [self.locationMapScrollView zoomToRect:rectToZoomTo animated:YES];
}

- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer *)recognizer{
    //zoom out slightly capping the min zoom scale specified by the scroll view
    CGFloat newZoomScale = self.locationMapScrollView.zoomScale / 1.5f;
    newZoomScale = MAX(newZoomScale, self.locationMapScrollView.minimumZoomScale);
    [self.locationMapScrollView setZoomScale:newZoomScale animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"image";
    
    //1
    UIImage *image = [UIImage imageNamed:@"caf_vendors.png"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    self.imageView.frame = (CGRect){.origin=CGPointMake(0.0f, 0.0f), .size=image.size};
    [self.locationMapScrollView addSubview:self.imageView];
    //2
    self.locationMapScrollView.contentSize = image.size;
    //3
    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDoubleTapped:)];
    
    doubleTapRecognizer.numberOfTapsRequired = 2;
    doubleTapRecognizer.numberOfTouchesRequired = 1;
    [self.locationMapScrollView addGestureRecognizer:doubleTapRecognizer];
    
    UITapGestureRecognizer *twoFingerTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTwoFingerTapped:)];
    twoFingerTapRecognizer.numberOfTouchesRequired = 1;
    twoFingerTapRecognizer.numberOfTouchesRequired = 2;
    [self.locationMapScrollView addGestureRecognizer:twoFingerTapRecognizer];
    
}

-(void)viewDidAppear:(BOOL)animated{

    //4
    CGRect scrollViewFrame = self.locationMapScrollView.frame;
    CGFloat scaleWidth = scrollViewFrame.size.width / self.locationMapScrollView.contentSize.width;
    CGFloat scaleHeight = scrollViewFrame.size.height / self.locationMapScrollView.contentSize.height;
    CGFloat minScale = MIN(scaleWidth,scaleHeight);
    self.locationMapScrollView.minimumZoomScale = minScale;
    
    //5
    self.locationMapScrollView.maximumZoomScale = 1.0f;
    self.locationMapScrollView.zoomScale = minScale;
    
    //6
    [self centerScrollViewContents];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // Return the view that we want to zoom
    return self.imageView;
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    //the scroll view has zoomed, so you need to recenter the contents
    [self centerScrollViewContents];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
