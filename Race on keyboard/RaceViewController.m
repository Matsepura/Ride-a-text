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

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *enterRaceTextField;
@property (weak, nonatomic) IBOutlet UISlider *opponentSliderOne;
@property (weak, nonatomic) IBOutlet UISlider *opponentSliderTwo;
@property (weak, nonatomic) IBOutlet UISlider *playerProgressRaceSlider;

@property (nonatomic) Race* raceProperty;
@property (nonatomic) CarsCollection* makeCar;
@property (nonatomic) BotView* bot;
@property (nonatomic) trafficOneTwoThreeViewController* goRace;

@end

@implementation RaceViewController

#pragma mark - setup

-(void)customizeTextView{
    //    [self.textView setTextAlignment:NSTextAlignmentCenter];
    CALayer *layer = self.textView.layer;
    
    //Сделаем отсутпы по краям от текста
    //   [self.textView setContentEdgeInsets:UIEdgeInsetsMake(10, 20, 10, 20)];
    
    [self.textView layoutIfNeeded];
    
    //Закруглим края
    CGRect frame = self.textView.frame;
    
    //половина высоты кнопки -> получим овал;
    CGFloat radious = CGRectGetHeight(frame) / 7;
    layer.cornerRadius = radious;
    
    
    //Обведем кнопку
    layer.borderColor = [UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1].CGColor;
    layer.borderWidth = 3;
}

-(void)customizeViewOfSider:(UISlider *)slider{
    
    NSLog(@"setup");
    slider.minimumTrackTintColor = [UIColor clearColor];
    slider.maximumTrackTintColor = [UIColor clearColor];
    slider.userInteractionEnabled = NO;
    slider.value = 0;
}

-(void)customizePlayerSlider{
    CarSelect* car = [CarSelect new];
    [self.playerProgressRaceSlider setThumbImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ ", [car loadFromUserDefaults]]] forState:UIControlStateNormal];
    NSLog(@"машинка игрока установлена");
    [self customizeViewOfSider:self.playerProgressRaceSlider];
}

-(void)customizeOpponentSliders{
    
    NSArray *sliders = [[NSArray alloc] initWithObjects: self.opponentSliderOne, self.opponentSliderTwo, nil];
    
    for (UISlider* n in sliders) {
        [self customizeViewOfSider:n];
        [self.makeCar changeCarsColor:n];
        [self.bot setEasyBotByTimer:n];
        
        n.maximumValue = self.playerProgressRaceSlider.maximumValue;
        NSLog(@"%f", self.playerProgressRaceSlider.maximumValue);
        NSLog(@"%f", self.opponentSliderOne.maximumValue);
        
        
        NSLog(@"бот настроен");
    }
}

-(void)setupAllSliders{
    [self customizePlayerSlider];
    [self customizeOpponentSliders];
    
}

-(void)setup{
    [self customizeTextView];
    self.raceProperty = [[Race alloc] init];
    self.makeCar = [[CarsCollection alloc] init];
    self.bot = [[BotView alloc] init];
    
    [self.enterRaceTextField becomeFirstResponder];
    [self setupAllSliders];
    [self.raceProperty setUpTextInRace:self.textView AndMakeMaxValueOfSlider:self.playerProgressRaceSlider];
    [self.textView setTextAlignment:NSTextAlignmentCenter];
    self.playerProgressRaceSlider.value = 0;
    self.view.backgroundColor = [UIColor colorWithRed:127/255.0 green:181/255.0 blue:181/255.0 alpha:1];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setup];
    //    [self.bot setEasyBotByTimer:self.opponentSliderOne];
    //    [self.bot setEasyBotByTimer:self.opponentSliderTwo];
    NSLog(@"wiilappear");
}

// !!! Если запустить через вью дид лоад, анимация слайдеров не работает=( почему?

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    NSLog(@"didload");
//}

#pragma mark - check and play

- (IBAction)touchOnEnterRaceTextFieldEnded:(id)sender {
    
    [self.raceProperty edittingLetter:self.playerProgressRaceSlider and:self.textView :self.enterRaceTextField];
    [self.textView setTextAlignment:NSTextAlignmentCenter];
    if (self.playerProgressRaceSlider.value == self.playerProgressRaceSlider.maximumValue) {
        [self performSelector:@selector(youWin)
                   withObject:nil
                   afterDelay:0.5];
    }
    if (self.opponentSliderOne.value == self.opponentSliderOne.maximumValue || self.opponentSliderTwo.value == self.opponentSliderTwo.maximumValue) {
        [self youLose];
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
