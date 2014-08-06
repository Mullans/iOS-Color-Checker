//
//  ViewController.m
//  iOS Color Checker
//
//  Created by Sean Mullan on 8/1/14.
//  Copyright (c) 2014 SilentLupin. All rights reserved.
//

#import "ColorViewController.h"
#define isiPhone5  ([[UIScreen mainScreen] bounds].size.height == 568)?TRUE:FALSE
@interface ColorViewController (){
}
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *redValue;
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UILabel *greenValue;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UILabel *blueValue;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation ColorViewController
- (IBAction)redShift:(id)sender {
    _redValue.text = [NSString stringWithFormat:@"%f", _redSlider.value];
    [self updateColor];
}
- (IBAction)greenShift:(id)sender {
    _greenValue.text = [NSString stringWithFormat:@"%f",_greenSlider.value];
    [self updateColor];
}
- (IBAction)blueShift:(id)sender {
    _blueValue.text = [NSString stringWithFormat:@"%f",_blueSlider.value];
    [self updateColor];
}

-(void)updateColor{
    [_colorView setBackgroundColor:[UIColor colorWithRed:_redSlider.value green:_greenSlider.value blue:_blueSlider.value alpha:1.0]];
    [_addButton setTintColor:[UIColor colorWithRed:1-_redSlider.value green:1-_greenSlider.value blue:1-_blueSlider.value alpha:1.0]];
}
- (IBAction)addButtonPressed:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];

    pasteboard.string = [NSString stringWithFormat:@"r:%.03f g:%.03f b:%.03f",[_redSlider value], [_greenSlider value], [_blueSlider value]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_colorView setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
