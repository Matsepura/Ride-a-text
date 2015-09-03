//
//  RaceViewController.m
//  Race on keyboard
//
//  Created by Semen on 11.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "RaceViewController.h"
#import "Race.h"
#import "CarsCollection.h"
#import "CarSelect.h"
#import "YouWinViewController.h"
#import "YouLoseViewController.h"
#import "BotView.h"
#import "trafficOneTwoThreeViewController.h"

@interface RaceViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelForTextRace;
@property (weak, nonatomic) IBOutlet UITextField *enterRaceTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imagePlayerSider;
@property (weak, nonatomic) IBOutlet UIImageView *imageFirstOpponent;
@property (weak, nonatomic) IBOutlet UIImageView *imageSecondOpponent;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xPositionOfPlayer;

@property (nonatomic) Race* raceProperty;
@property (nonatomic) CarsCollection* makeCar;
@property (nonatomic) BotView* bot;
@property (nonatomic) trafficOneTwoThreeViewController* goRace;

@property (assign, nonatomic) NSInteger countOfWords;

@end

@implementation RaceViewController

#pragma mark - setup

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [UIColor colorWithRed:127/255.0 green:181/255.0 blue:181/255.0 alpha:1];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self setup];
    NSLog(@"wiilappear");
}

-(void)setup{
    [self customizeTextView];
    self.raceProperty = [[Race alloc] init];
    self.makeCar = [[CarsCollection alloc] init];
    self.bot = [[BotView alloc] init];
    
    [self.enterRaceTextField becomeFirstResponder];
    [self.raceProperty setUpTextInRace:self.labelForTextRace];
    self.view.backgroundColor = [UIColor colorWithRed:127/255.0 green:181/255.0 blue:181/255.0 alpha:1];
    [self setImageCarOfOpponents];
    [self customizePlayerSlider];
}

-(void)setImageCarOfOpponents{
    
    [self.bot setImageBot:self.imageFirstOpponent];
    [self.makeCar changeCarsColor:self.imageFirstOpponent];
    NSLog(@"first secc is %ld", (long)self.bot.timeToGameOverStart);
    NSInteger firstTime = self.bot.timeToGameOverStart;
    NSLog(@"firstTime %ld", (long)firstTime);
    
    [self.bot setImageBot:self.imageSecondOpponent];
    [self.makeCar changeCarsColor:self.imageSecondOpponent];
    NSLog(@"second secc is %ld", (long)self.bot.timeToGameOverStart);
    NSInteger secondTime = self.bot.timeToGameOverStart;
    NSLog(@"secondTime %ld", (long)secondTime);
    
    if (firstTime < secondTime) {
        NSLog(@"first win");
        [self performSelector:@selector(youLose)
                   withObject:nil
                   afterDelay:firstTime];
    }else{
        NSLog(@"second win");
        [self performSelector:@selector(youLose)
                   withObject:nil
                   afterDelay:secondTime];
    }
    
}

-(void)customizeTextView{
    CALayer *layer = self.labelForTextRace.layer;
    
    //Закруглим края
    CGRect frame = self.labelForTextRace.frame;
    
    //половина высоты кнопки -> получим овал;
    CGFloat radious = CGRectGetHeight(frame) / 10;
    layer.cornerRadius = radious;
    //Обведем кнопку
    layer.borderColor = [UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1].CGColor;
    layer.borderWidth = 3;
}

-(void)customizePlayerSlider{
    CarSelect* car = [CarSelect new];
    self.imagePlayerSider.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@ ", [car loadFromUserDefaults]]];

    NSLog(@"машинка игрока установлена");
}

#pragma mark - check and play

- (IBAction)touchOnEnterRaceTextFieldEnded:(id)sender {
    
    if ([self.raceProperty edittingLetter:self.labelForTextRace :self.enterRaceTextField] == YES) {
        NSLog(@"width %f", self.view.bounds.size.width * 2);
        CGFloat oneShift = (self.view.frame.size.width - 122) / [self.raceProperty textLenght];
        NSLog(@"%f", oneShift);
        self.xPositionOfPlayer.constant += oneShift;
        [UIView animateWithDuration:1.0 animations:^{
            
        [self.view layoutIfNeeded];
        }];
        NSLog(@"yes!!!!!!");
        //self.xPositionOfPlayer.constant = 0;
        self.countOfWords ++;
    }
    if (self.countOfWords == [self.raceProperty textLenght]) {
        [self youWin];
    }
}

#pragma  mark - you win / you lose

-(void)youWin{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YouWinViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"YouWinViewController"];
    [rvc setModalPresentationStyle:UIModalPresentationFullScreen];
    
    [self presentViewController:rvc animated:NO completion:nil];
}

-(void)youLose{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YouLoseViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"YouLoseViewController"];
    [rvc setModalPresentationStyle:UIModalPresentationFullScreen];
    
    [self presentViewController:rvc animated:NO completion:nil];
}


@end
