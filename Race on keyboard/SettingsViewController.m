//
//  SettingsViewController.m
//  Race on keyboard
//
//  Created by Semen on 22.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "SettingsViewController.h"
#import "CarSelect.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *textLanguage;
@property (weak, nonatomic) IBOutlet UISegmentedControl *botDifficult;
@property (weak, nonatomic) IBOutlet UIImageView *carImage;
@property (weak, nonatomic) IBOutlet UIButton *carSelectButton;

@end

@implementation SettingsViewController

#pragma mark - setup

-(void)setup{
    self.view.backgroundColor = [UIColor colorWithRed:127/255.0 green:181/255.0 blue:181/255.0 alpha:1];
    [self selectSegmentedControll];
    [self selectSegmentedControllOfBot];
    [self customizeButtonOfSelectCar];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupCarImage];
}

#pragma mark - customize segmented control of language

- (IBAction)textLanguageSegmentedControl:(id)sender {
    
    switch ([((UISegmentedControl *)sender) selectedSegmentIndex])
    {
        case 0:
            [self saveTextSelect:@"russianText"];
            NSLog(@"case 0");
            break;
        case 1:
            [self saveTextSelect:@"englishText"];
            NSLog(@"case 1");
            break;
        default: //Make sure this button is checked off as Selected in IB
            NSLog(@"case default");
            break;
    }
    return;
    
}

-(void)saveTextSelect:(NSString *)string{
    NSString *valueToSave = [NSString stringWithFormat:@"%@", string];
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"textSelect"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString *)loadTextSelect{
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"textSelect"];
    
    return savedValue;
}

-(void)selectSegmentedControll{
    
    if ([[self loadTextSelect] isEqualToString:@"russianText"]) {
        self.textLanguage.selectedSegmentIndex = 0;
    }
    if ([[self loadTextSelect] isEqualToString:@"englishText"]) {
        self.textLanguage.selectedSegmentIndex = 1;
    }
    
}

#pragma mark - customize segmented control of bot

- (IBAction)botDifficultSegmentedContorl:(id)sender {
    
    switch ([((UISegmentedControl *)sender) selectedSegmentIndex])
    {
        case 0:
            [self saveBotSelect:@"easy"];
            NSLog(@"case easy");
            break;
        case 1:
            [self saveBotSelect:@"normal"];
            NSLog(@"case normal");
            break;
        case 2:
            [self saveBotSelect:@"hard"];
            NSLog(@"case hard");
            break;
    }
}

-(void)saveBotSelect:(NSString *)string{
    NSString *valueToSave = [NSString stringWithFormat:@"%@", string];
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"botSelect"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString *)loadBotSelect{
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"botSelect"];
    
    return savedValue;
}

-(void)selectSegmentedControllOfBot{
    
    if ([[self loadBotSelect] isEqualToString:@"easy"]) {
        self.botDifficult.selectedSegmentIndex = 0;
    }
    if ([[self loadBotSelect] isEqualToString:@"normal"]) {
        self.botDifficult.selectedSegmentIndex = 1;
    }
    if ([[self loadBotSelect] isEqualToString:@"hard"]) {
        self.botDifficult.selectedSegmentIndex = 2;
    }
    
}

#pragma mark - customize car select

-(void)setupCarImage{
//    [self.carImage.image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"playerCar"]]] forState:UIControlStateNormal];
    CarSelect *car = [CarSelect new];
    
    self.carImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [car loadFromUserDefaults]]];
    
}

-(void)customizeButtonOfSelectCar{
    CALayer *layer = self.carSelectButton.layer;
    
    //Сделаем отсутпы по краям от текста
//    [self.carSelectButton setContentEdgeInsets:UIEdgeInsetsMake(10, 20, 10, 20)];
    
    [self.carSelectButton layoutIfNeeded];
    
    //Закруглим края
    CGRect frame = self.carSelectButton.frame;
    
    //половина высоты кнопки -> получим овал;
    CGFloat radious = CGRectGetHeight(frame) / 7;
    layer.cornerRadius = radious;
    
    
    //Обведем кнопку
    layer.borderColor = [UIColor whiteColor].CGColor;
    layer.borderWidth = 1;
    
    layer.backgroundColor = (__bridge CGColorRef)([UIColor clearColor]);
}


@end
