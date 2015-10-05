//
//  Text.m
//  Race on keyboard
//
//  Created by Semen on 14.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "Text.h"
#import "SettingsViewController.h"

@implementation Text

-(NSString *)text{
    SettingsViewController *textSet = [SettingsViewController new];
    
    NSString *selectedText = [NSString new];
    NSString *localizeText = [NSString stringWithFormat:NSLocalizedString(@"localizeLanguage", nil)];
    
    if ([[textSet loadTextSelect] isEqualToString:@"englishText"] || [localizeText isEqualToString:@"englishText"]) {
        selectedText = [self englishText];
    } else if ([[textSet loadTextSelect] isEqualToString:@"russianText"] || [localizeText isEqualToString:@"russianText"]) {
        selectedText = [self russianText];
    }
    
    return selectedText;
}


-(NSString *)russianText{
    
    NSArray *russian = [NSArray arrayWithObjects:@"Когда проблемы тянут ко дну, смотри вверх! Там есть нужное тебе решение.", @"Может, это звучит глупо, но именно глупости запоминаются лучше всего.", @"Мне слишком грустно, чтобы идти; может, я смогу через несколько недель.", @"Любовь - это когда ты ставишь интересы другого выше своих. Остальное неважно.", @"Первым признаком глупости является полное отсутствие стыда.", @"Задача сделать человека счастливым не входила в план сотворения мира.", @"Только в русском языке можно составить предложение из трех гласных букв.", @"Богат и могуч русский язык. Борщ пересолила = с солью переборщила.", @"Часы могут идти, когда лежат, и стоять, когда висят. Парадокс русского языка.", @"Если вы предприниматель и не делали ошибок, значит вы не предприниматель.", nil];
    
    return [russian objectAtIndex:arc4random_uniform((unsigned)russian.count)];
}

-(NSString *)englishText{
    
    NSArray *english = [NSArray arrayWithObjects:@"You do not choose your family. They are God's gift to you, as you are to them.", @"Walking with a friend in the dark is better than walking alone in the light.", @"All our dreams can come true, if we have the courage to pursue them.", @"When you believe in a thing, believe in it all the way, implicitly and unquestionable.", @"People will not have time for you if you are always angry or complaining.", @"However difficult life may seem, there is always something you can do and succeed at.", @"Once you replace negative thoughts with positive ones, you'll start having positive results.", @"You only live once, but if you do it right, once is enough.", @"Live as if you were to die tomorrow. Learn as if you were to live forever.", @"To live is the rarest thing in the world. Most people exist, that is all.", nil];
    
    return [english objectAtIndex:arc4random_uniform((unsigned)english.count)];
}

@end
