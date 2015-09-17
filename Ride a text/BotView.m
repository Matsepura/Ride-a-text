//
//  BotView.m
//  Race on keyboard
//
//  Created by Semen on 17.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "BotView.h"
#import "SettingsViewController.h"
#import "YouLoseViewController.h"

@interface BotView ()

@property (assign, nonatomic) NSInteger randomValue;


@end

@implementation BotView

//задаем время исходя из выбора сложности бота

-(NSInteger)setRandomValue{
    SettingsViewController *textSet = [SettingsViewController new];
    NSInteger time = 0;
    
    if ([[textSet loadBotSelect] isEqualToString:@"easy"]) {
        time = 53;
    }
    if ([[textSet loadBotSelect] isEqualToString:@"normal"]) {
        time = 33;
    }
    if ([[textSet loadBotSelect] isEqualToString:@"hard"]) {
        time = 23;
    }else{
        time = 53;
    }
    
    self.randomValue = time + arc4random_uniform(13);
    return self.randomValue;
}

-(void)moveImageBot:(UIImageView *)image{
    NSInteger i = [self setRandomValue];
    self.timeToGameOverStart = i;
    [UIView animateWithDuration:i animations:^{
        image.frame = CGRectMake(image.frame.origin.x + image.frame.origin.x - 16,
                                 image.frame.origin.y,
                                 image.frame.size.width,
                                 image.frame.size.height);
    }];
    
}

@end
