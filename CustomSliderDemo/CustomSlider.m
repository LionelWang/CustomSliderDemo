//
//  CustomSlider.m
//  CustomSliderDemo
//
//  Created by wangliang on 12-9-5.
//  Copyright (c) 2012年 wangliang. All rights reserved.
//

#import "CustomSlider.h"

@interface CustomSlider () <UIGestureRecognizerDelegate>

@property (assign, nonatomic) BOOL tapGestureEnable;

- (void)valueChanged;

@end

@implementation CustomSlider
@synthesize delegate;
@synthesize clickEnable;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setThumbImage:[UIImage imageNamed:@"slideThumb.png"] forState:UIControlStateNormal];
        [self setMinimumTrackImage:[[UIImage imageNamed:@"slideBg.png"]stretchableImageWithLeftCapWidth:3 topCapHeight:3] forState:UIControlStateNormal];
        [self setMaximumTrackImage:[[UIImage imageNamed:@"slideBg.png"]stretchableImageWithLeftCapWidth:3 topCapHeight:3] forState:UIControlStateNormal];
        
        [self addTarget:self action:@selector(valueChanged) forControlEvents:UIControlEventValueChanged];
        
        UITapGestureRecognizer* singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
        singleTapGesture.numberOfTapsRequired = 1;
        singleTapGesture.delegate = self;
        [self addGestureRecognizer:singleTapGesture];
        
        self.tapGestureEnable = YES;
    }
    return self;
}

- (void)setCustomSliderBg:(UIImage *)image
{
    if (!image) {
        return;
    }
    [self setMinimumTrackImage:[image stretchableImageWithLeftCapWidth:3 topCapHeight:3] forState:UIControlStateNormal];
    [self setMaximumTrackImage:[image stretchableImageWithLeftCapWidth:3 topCapHeight:3] forState:UIControlStateNormal];
}

- (void)setCustomSliderThumb:(UIImage *)image
{
    if (!image) {
        return;
    }
    [self setThumbImage:image forState:UIControlStateNormal];
}

- (void)setValue:(float)value animated:(BOOL)animated
{
    [super setValue:value animated:animated];
}

- (void)valueChanged
{
#ifdef DEBUG
    NSLog(@"value: %f", self.value);
#endif
    self.tapGestureEnable = NO;

    if (self.delegate && [self.delegate respondsToSelector:@selector(valueChangedEvent:)]) {
        [self.delegate valueChangedEvent:self.value];
    }
}

- (void)handleSingleTapGesture:(UITapGestureRecognizer*)gestureRecognizer
{
    if (!self.clickEnable) {
        return;
    }
    
    if (!self.tapGestureEnable) {
        self.tapGestureEnable = YES;
        return;
    }
    
    CGPoint point = [gestureRecognizer locationInView:gestureRecognizer.view];
#ifdef DEBUG
    NSLog(@"x: %.f, y: %.f",point.x, point.y);
#endif
    
    CGRect thumbPosition = [self thumbRectForBounds:self.bounds trackRect:[self trackRectForBounds:self.bounds]
                                                value:self.value];
    if (CGRectContainsPoint(thumbPosition, point)){
        return;
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded){
        
        CGFloat value = point.x / CGRectGetWidth(gestureRecognizer.view.frame);
        [self setValue:value animated:YES];
        if (self.delegate && [self.delegate respondsToSelector:@selector(valueChangedEvent:)]) {
            [self.delegate valueChangedEvent:self.value];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
