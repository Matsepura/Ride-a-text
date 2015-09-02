//
//  Race.m
//  Race on keyboard
//
//  Created by Semen on 13.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Race.h"
#import "Text.h"
#import <AudioToolbox/AudioToolbox.h>

@interface Race ()

@property (nonatomic) NSRange                   range;
@property (nonatomic) NSMutableAttributedString *now;
@property (assign, nonatomic) NSInteger         countOfTouchOnKeyboard;

@end

@implementation Race

#pragma mark - setup tex in race

-(void)setUpTextInRace:(UILabel *)textView AndMakeMaxValueOfSlider:(UISlider *)slider{
    UIFont *font = [UIFont fontWithName:@"Palatino-Roman" size:19.0];
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:font
                                                                forKey:NSFontAttributeName];
    Text *makeText = [[Text alloc] init];
    NSString *text = [makeText text];
    slider.maximumValue = text.length;
    self.now = [[NSMutableAttributedString alloc]initWithString:text attributes:attrsDictionary ];
    textView.font = [UIFont systemFontOfSize:20];
    textView.attributedText = self.now ;
    
    NSLog(@"%@", text);
    
}

#pragma mark - slider progress count

-(void)makeProgressBySlider:(UISlider *)slider and:(UITextView *)textView{
//    if (slider.value == slider.maximumValue - 1) {
//        textView.text = @"You win!";
//    }
    [UIView animateWithDuration:1.0 animations:^{
        [slider setValue:self.countOfTouchOnKeyboard animated:YES];
    }];
}

-(void)edittingLetter:(UISlider *)slider and:(UILabel *)textView :(UITextField *)textField{
    
    NSLog(@"touch ended on keyboard %ld", (long)self.countOfTouchOnKeyboard);
    self.range = NSMakeRange(0+self.countOfTouchOnKeyboard, 1);
    
    
    if (slider.value == slider.maximumValue) {
        return;
    }
    
    if ([textField.text isEqual:[textView.text substringWithRange:self.range]]) {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor colorWithRed:89/255.0 green:188/255.0 blue:227/255.0 alpha:1] range:self.range];
        textView.attributedText = self.now;
        textField.text = @"";
        self.countOfTouchOnKeyboard++;
//        [self makeProgressBySlider:slider and:textView];
    } else {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:self.range];
        textView.attributedText = self.now;
        textField.text = @"";
        //вибрация при неправильном вводе буквы
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
}


@end
