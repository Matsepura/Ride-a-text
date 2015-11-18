//
//  Race.h
//  Race on keyboard
//
//  Created by Semen on 13.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Race : UIView

-(BOOL)edittingLetter:(UILabel *)label :(UITextField *)textField;
-(void)setUpTextInRace:(UILabel *)label;
-(CGFloat)textLenght;
-(void)initSetting;

@property (assign, nonatomic) CGFloat         lenghtOfText;
@property (assign, nonatomic) NSInteger       countOfTouchOnKeyboard;
@property (assign, nonatomic) NSInteger       comma;
@property (assign, nonatomic) NSInteger       afterComma;
@property (assign, nonatomic) NSInteger       keyboardChange;


@end
