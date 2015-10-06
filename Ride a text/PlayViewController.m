//
//  PlayViewController.m
//  Ride a text
//
//  Created by Semen on 09.09.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "PlayViewController.h"
#import "AverageSpeed.h"

@interface PlayViewController ()
@property (weak, nonatomic) IBOutlet UIButton *singleplayerButton;
@property (weak, nonatomic) IBOutlet UIButton *multiplayerButton;
@property (weak, nonatomic) IBOutlet UILabel *labelOfLastResult;

@property AverageSpeed *speed;

@end

@implementation PlayViewController

#pragma mark - setup

-(void)setup{
    [self customizeStyleOfView];
    [self customizeButton];
    [self showLastResult];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

#pragma mark - customize

-(void)showLastResult{
    
    self.speed = [AverageSpeed new];
    
    if ([self.speed showAverageSpeed] == nil) {
        self.labelOfLastResult.text = @"";
    }else{
        self.labelOfLastResult.text = [NSString stringWithFormat:@"Last game result: %@", [self.speed showAverageSpeed]];
    }
}

-(void)customizeStyleOfView{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.view.backgroundColor = [UIColor colorWithRed:127/255.0 green:181/255.0 blue:181/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

-(void)customizeButton{
    
    NSArray *sliders = [[NSArray alloc] initWithObjects: self.singleplayerButton, self.multiplayerButton, nil];
    
    for (UIButton* button in sliders) {
        
        CALayer *layer = button.layer;

        [button layoutIfNeeded];
        
        //Закруглим края
        CGRect frame = button.frame;
        
        //половина высоты кнопки -> получим овал;
        CGFloat radious = CGRectGetHeight(frame) / 7;
        layer.cornerRadius = radious;
        
        
        //Обведем кнопку
        layer.borderColor = [UIColor whiteColor].CGColor;
        layer.borderWidth = 2;
        
        layer.backgroundColor = [UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1].CGColor;
        button.tintColor = [UIColor whiteColor];
    }
}

@end
