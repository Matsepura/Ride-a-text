//
//  YouWinYouLoseViewController.m
//  Race on keyboard
//
//  Created by Semen on 17.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "YouWinViewController.h"

@interface YouWinViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;

@end

@implementation YouWinViewController

-(void)setup{
    [self.restartButton setTintColor:[UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1]];
    [self customizeButton:self.restartButton];
    [self.menuButton setTintColor:[UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1]];
    [self customizeButton:self.menuButton];
    [self youWinGame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)youWinGame{
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"win.png"]];
    self.imageView.image = [self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageView setTintColor:[UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1]];
}


-(void)customizeButton:(UIButton *)button{
    CALayer *layer = button.layer;
    
    //Закруглим края
    CGRect frame = button.frame;
    
    //половина высоты кнопки -> получим овал;
    CGFloat radious = CGRectGetHeight(frame) / 10;
    layer.cornerRadius = radious;
    //Обведем кнопку
    layer.borderColor = [UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1].CGColor;
    layer.borderWidth = 1;
}

@end
