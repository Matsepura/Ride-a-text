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
@property (assign, nonatomic) CGFloat         lenghtOfText;

@end

@implementation Race

#pragma mark - setup tex in race

-(CGFloat)textLenght{
    return self.lenghtOfText;
}

-(void)setUpTextInRace:(UILabel *)label AndMakeMaxValueOfSlider:(UISlider *)slider{
    UIFont *font = [UIFont fontWithName:@"Palatino-Roman" size:19.0];
    NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:font
                                                                forKey:NSFontAttributeName];
    Text *makeText = [[Text alloc] init];
    NSString *text = [makeText text];
    slider.maximumValue = text.length;
    self.lenghtOfText = (CGFloat)text.length;
    self.now = [[NSMutableAttributedString alloc]initWithString:text attributes:attrsDictionary ];
//    textView.font = [UIFont systemFontOfSize:20];
    label.attributedText = self.now ;
    
    NSLog(@"%@", text);
    
}

#pragma mark - slider progress count


-(BOOL)edittingLetter:(UILabel *)textView :(UITextField *)textField{
    
    NSLog(@"touch ended on keyboard %ld", (long)self.countOfTouchOnKeyboard);
    self.range = NSMakeRange(0+self.countOfTouchOnKeyboard, 1);
    
    if ([textField.text isEqual:[textView.text substringWithRange:self.range]]) {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor colorWithRed:89/255.0 green:188/255.0 blue:227/255.0 alpha:1] range:self.range];
        textView.attributedText = self.now;
        textField.text = @"";
        self.countOfTouchOnKeyboard++;
//        [self makeProgressBySlider:slider and:nil];
        NSLog(@"work");
        return YES;
    } else {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:self.range];
        textView.attributedText = self.now;
        textField.text = @"";
        //вибрация при неправильном вводе буквы
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        return NO;
    }
}


@end
