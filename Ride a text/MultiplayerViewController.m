//
//  MultiplayerViewController.m
//  Ride a text
//
//  Created by Semen on 10.09.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "MultiplayerViewController.h"
#import "GameKitHelper.h"

#import "RaceViewController.h"
#import "Race.h"
#import "CarCheck.h"
#import "CarSelect.h"
#import "YouWinViewController.h"
#import "YouLoseViewController.h"
#import "BotView.h"
#import "TrafficOneTwoThreeViewController.h"
#import "AverageSpeed.h"


@interface MultiplayerViewController ()


@property (weak, nonatomic) IBOutlet UIView *viewOfLabel;
@property (weak, nonatomic) IBOutlet UILabel *labelForTextRace;
@property (weak, nonatomic) IBOutlet UITextField *enterRaceTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imagePlayerSider;
@property (weak, nonatomic) IBOutlet UIImageView *imageSecondOpponent;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *xPositionOfPlayer;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelConstraint;


@property (nonatomic) Race* raceProperty;
@property (nonatomic) CarCheck* makeCar;
@property (nonatomic) BotView* bot;
@property (nonatomic) TrafficOneTwoThreeViewController* goRace;
@property (nonatomic) AverageSpeed* averageSpeed;

@end

@implementation MultiplayerViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//
//    // Do any additional setup after loading the view.
//}

// Add to the implementation section

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //from game!
    [self moveAndSetImageCarOfOpponents];
    
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(showAuthenticationViewController)
     name:PresentAuthenticationViewController
     object:nil];
    
    [[GameKitHelper sharedGameKitHelper]
     authenticateLocalPlayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerAuthenticated)
                                                 name:LocalPlayerIsAuthenticated object:nil];
    NSLog(@"work");
}

- (void)showAuthenticationViewController
{
    GameKitHelper *gameKitHelper =
    [GameKitHelper sharedGameKitHelper];
    
    [self presentViewController:
     gameKitHelper.authenticationViewController
                                         animated:YES
                                       completion:nil];
}


//- (void)playerAuthenticated {
//    [[GameKitHelper sharedGameKitHelper] findMatchWithMinPlayers:2 maxPlayers:2 viewController:self delegate:self];
//}
- (void)playerAuthenticated {
    
//    SKView *skView = (SKView*)self.view;
//    GameScene *scene = (GameScene*)skView.scene;
    
//    UIView *gameView = self.view;
//    MultiplayerNetworking *scene = (MultiplayerNetworking*)gameView;
    
    _networkingEngine = [[MultiplayerNetworking alloc] init];
    _networkingEngine.delegate = self;
    self.networkingEngine = _networkingEngine;
    
    [[GameKitHelper sharedGameKitHelper] findMatchWithMinPlayers:2 maxPlayers:2 viewController:self delegate:_networkingEngine];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// Add new methods to bottom of file
//#pragma mark GameKitHelperDelegate
//
//- (void)matchStarted {
//    NSLog(@"Match started");
//}
//
//- (void)matchEnded {
//    NSLog(@"Match ended");
//}
//
//- (void)match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID {
//    NSLog(@"Received data");
//}
#pragma mark MultiplayerNetworkingProtocol

- (void)matchEnded {
    if (self.gameEndedBlock) {
        self.gameEndedBlock();
    }
}

#pragma mark - game
#pragma mark - setup

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setup];
    [UIApplication sharedApplication].applicationSupportsShakeToEdit = NO;
}

-(void)setup{
    [self customizeTextView];
    self.raceProperty = [[Race alloc] init];
    self.makeCar = [[CarCheck alloc] init];
    self.bot = [[BotView alloc] init];
    self.averageSpeed = [[AverageSpeed alloc] init];
    [self setupBackground];
    
    [self.enterRaceTextField becomeFirstResponder];
    [self.raceProperty setUpTextInRace:self.labelForTextRace];
    //    self.view.backgroundColor = [UIColor colorWithRed:127/255.0 green:181/255.0 blue:181/255.0 alpha:1];
    [self customizePlayerSlider];
    [self.averageSpeed startStopwatch];
    [self.raceProperty initSetting];
}

-(void)moveAndSetImageCarOfOpponents{
    
//    [self.bot moveImageBot:self.imageFirstOpponent];
//    [self.makeCar makeImageForCars:self.imageFirstOpponent];
//    NSInteger firstTime = self.bot.timeToGameOverStart;
    
//    [self.bot moveImageBot:self.imageSecondOpponent];
    [self.makeCar makeImageForCars:self.imageSecondOpponent];
//    NSInteger secondTime = self.bot.timeToGameOverStart;
    
//    if (firstTime < secondTime) {
//        [self performSelector:@selector(youLose)
//                   withObject:nil
//                   afterDelay:firstTime];
//    }else{
//        [self performSelector:@selector(youLose)
//                   withObject:nil
//                   afterDelay:secondTime];
//    }
}

-(void)customizeTextView{
    CALayer *layer = self.viewOfLabel.layer;
    
    //Закруглим края
    CGRect frame = self.viewOfLabel.frame;
    
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
}

#pragma mark - check and play

- (IBAction)touchOnEnterRaceTextFieldEnded:(id)sender {
    
    if ([self.raceProperty edittingLetter:self.labelForTextRace :self.enterRaceTextField] == YES) {
        CGFloat oneShift = (self.view.frame.size.width - 32 - self.imagePlayerSider.frame.size.width) / [self.raceProperty textLenght];
        self.xPositionOfPlayer.constant += oneShift;
        [UIView animateWithDuration:1.0
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
                             [self.view layoutIfNeeded];
                         }
                         completion:nil];
        
        self.countOfWords ++;
        self.averageSpeed.counfOfSign ++;
        [self.averageSpeed saveCountOfText];
    }
    if (self.countOfWords == [self.raceProperty textLenght]) {
        [self youWin];
    }
}

#pragma  mark - you win / you lose

-(void)youWin{
    [self.averageSpeed saveTime];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YouWinViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"YouWinViewController"];
    [rvc setModalPresentationStyle:UIModalPresentationFullScreen];
    
    [self presentViewController:rvc animated:NO completion:nil];
}

-(void)youLose{
    [self.averageSpeed saveTime];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YouLoseViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"YouLoseViewController"];
    [rvc setModalPresentationStyle:UIModalPresentationFullScreen];
    
    [self presentViewController:rvc animated:NO completion:nil];
}

#pragma mark - setup background

-(void)setupBackground{
    if (self.view.frame.size.height == 480) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4s-full.png"]];
    };
    if (self.view.frame.size.height == 568) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"5-and-5s-full.png"]];
    };
    if (self.view.frame.size.height == 667) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"6-full.png"]];
    };
    if (self.view.frame.size.height == 736) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"6+-full.png"]];
        self.viewOfLabel.frame = CGRectMake(self.viewOfLabel.frame.origin.x, self.viewOfLabel.frame.origin.y - 30, self.viewOfLabel.frame.size.width, self.viewOfLabel.frame.size.height);
        self.labelConstraint.constant += 5;
        [self.view layoutIfNeeded];
    };
}





@end