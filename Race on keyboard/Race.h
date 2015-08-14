//
//  Race.h
//  Race on keyboard
//
//  Created by Semen on 13.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Race : UIView

-(void)test:(UITextView *)textField;
-(void)testNumberTwo:(UITextView *)textView;
-(void)makeProgressBySlider:(UISlider *)slider and:(UITextView *)textView;
-(void)edittingLetter:(UISlider *)slider and:(UITextView *)textView :(UITextField *)textField;

@property (assign, nonatomic) NSInteger countOfTouchOnKeyboard;
@property (nonatomic) NSMutableAttributedString *now;


@end