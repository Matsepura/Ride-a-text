//
//  Race.h
//  Race on keyboard
//
//  Created by Semen on 13.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Race : UIView

//-(void)makeProgressBySlider:(UIImageView *)slider and:(UITextView *)textView;
-(BOOL)edittingLetter:(UILabel *)textView :(UITextField *)textField;
-(void)setUpTextInRace:(UILabel *)label AndMakeMaxValueOfSlider:(UISlider *)slider;
-(CGFloat)textLenght;

@end
