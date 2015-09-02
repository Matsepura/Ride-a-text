//
//  Race.h
//  Race on keyboard
//
//  Created by Semen on 13.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Race : UIView

-(void)makeProgressBySlider:(UISlider *)slider and:(UITextView *)textView;
-(void)edittingLetter:(UISlider *)slider and:(UILabel *)textView :(UITextField *)textField;
-(void)setUpTextInRace:(UILabel *)textView AndMakeMaxValueOfSlider:(UISlider *)slider;

@end
