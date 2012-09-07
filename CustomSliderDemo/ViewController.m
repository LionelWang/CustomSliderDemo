//
//  ViewController.m
//  CustomSliderDemo
//
//  Created by wangliang on 12-9-5.
//  Copyright (c) 2012年 wangliang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)valueChanged:(UISlider *)slider;

@end

@implementation ViewController
@synthesize slider;
@synthesize customSlider;

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
    // Do any additional setup after loading the view from its nib.
//    [slider setMaximumValueImage:[UIImage imageNamed:@"slideBg.png"]];
//    [slider setMinimumValueImage:[UIImage imageNamed:@"slideBg.png"]];
//    [slider setThumbImage:[UIImage imageNamed:@"slideThumb.png"] forState:UIControlStateNormal];
    
//    for (UIView *view in slider.subviews) {
//        NSLog(@"%@",NSStringFromClass([view class]));
//    }
    [slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    
//    [slider setMinimumTrackImage:[[UIImage imageNamed:@"slideBg.png"]stretchableImageWithLeftCapWidth:3 topCapHeight:3] forState:UIControlStateNormal];
//    [slider setMaximumTrackImage:[[UIImage imageNamed:@"slideBg.png"]stretchableImageWithLeftCapWidth:3 topCapHeight:3] forState:UIControlStateNormal];
//    [slider setFrame:CGRectMake(slider.frame.origin.x, slider.frame.origin.y, CGRectGetWidth(slider.frame), 10)];
    
    customSlider = [[CustomSlider alloc] initWithFrame:CGRectMake(30, 350, 260, 23)];
    customSlider.delegate = self;
    customSlider.clickEnable = YES;
    [self.view addSubview:customSlider];
}

- (void)viewDidUnload
{
    [self setSlider:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)valueChanged:(UISlider *)slider
{
    NSLog(@"value: %f", slider.value);
}

-(void) valueChangedEvent:(CGFloat )value
{
    NSLog(@"valueChangedEvent: %f", value);
}

@end
