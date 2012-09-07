//
//  ViewController.h
//  CustomSliderDemo
//
//  Created by wangliang on 12-9-5.
//  Copyright (c) 2012年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomSlider.h"

@interface ViewController : UIViewController <CustomSliderDelegate>


@property (unsafe_unretained, nonatomic) IBOutlet UISlider *slider;

@property (strong, nonatomic) CustomSlider *customSlider;

@end
