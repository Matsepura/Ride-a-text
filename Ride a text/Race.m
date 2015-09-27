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
#import "SettingsViewController.h"

@interface Race ()

@property (nonatomic) NSRange                   range;
@property (nonatomic) NSMutableAttributedString *now;

@property SettingsViewController *setting;

@end

@implementation Race

#pragma mark - setup tex in race

-(void)initSetting{
    self.setting = [[SettingsViewController alloc] init];
}

-(CGFloat)textLenght{
    return self.lenghtOfText;
}

-(void)setUpTextInRace:(UILabel *)label{
    Text *makeText = [[Text alloc] init];
    NSString *text = [makeText text];
    self.lenghtOfText = (CGFloat)text.length;
    self.now = [[NSMutableAttributedString alloc]initWithString:text];
    label.attributedText = self.now ;
    
}

#pragma mark - editting letter

-(BOOL)edittingLetter:(UILabel *)label :(UITextField *)textField{
    
    self.range = NSMakeRange(0+self.countOfTouchOnKeyboard, 1);
    
    // делает первую букву текста заглавной
    if (self.countOfTouchOnKeyboard == 0) {
        NSString *text = [textField text];
        NSString *capitalized = [[[text substringToIndex:1] uppercaseString] stringByAppendingString:[text substringFromIndex:1]];
        textField.text = capitalized;
    }
    
    if ([textField.text isEqual:[label.text substringWithRange:self.range]]) {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor colorWithRed:89/255.0 green:188/255.0 blue:227/255.0 alpha:1] range:self.range];
        label.attributedText = self.now;
        textField.text = @"";
        self.countOfTouchOnKeyboard++;
        return YES;
    } else {
        [self.now addAttribute:NSBackgroundColorAttributeName value:[UIColor colorWithRed:204/255.0 green:51/255.0 blue:51/255.0 alpha:1] range:self.range];
        label.attributedText = self.now;
        textField.text = @"";
        //вибрация при неправильном вводе буквы
        
        if ([[self.setting loadVibrateSelect] isEqualToString:@"off"]) {
            nil;
        }else{
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        }
        
        return NO;
    }
}

@end
