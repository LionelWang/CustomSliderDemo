//
//  CustomSlider.h
//  CustomSliderDemo
//
//  Created by wangliang on 12-9-5.
//  Copyright (c) 2012年 wangliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSliderDelegate;

@interface CustomSlider : UISlider

@property (assign, nonatomic) id <CustomSliderDelegate> delegate;
@property (assign, nonatomic) BOOL clickEnable;

- (void)setCustomSliderBg:(UIImage *)image;
- (void)setCustomSliderThumb:(UIImage *)image;

- (void)setValue:(float)value animated:(BOOL)animated; 

@end


@protocol CustomSliderDelegate<NSObject>

@optional

-(void) valueChangedEvent:(CGFloat )value;

@end