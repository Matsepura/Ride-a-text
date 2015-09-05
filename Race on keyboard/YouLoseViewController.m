//
//  YouLoseViewController.m
//  Race on keyboard
//
//  Created by Semen on 17.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "YouLoseViewController.h"

@interface YouLoseViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *restartButton;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;

@end

@implementation YouLoseViewController

-(void)setup{
    [self.restartButton setTintColor:[UIColor colorWithRed:204/255.0 green:51/255.0 blue:51/255.0 alpha:1]];
    [self customizeButton:self.restartButton];
    [self.menuButton setTintColor:[UIColor colorWithRed:204/255.0 green:51/255.0 blue:51/255.0 alpha:1]];
    [self customizeButton:self.menuButton];
    [self youGameIsOver];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)youGameIsOver{
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"gameover.png"]];
    self.imageView.image = [self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageView setTintColor:[UIColor colorWithRed:204/255.0 green:51/255.0 blue:51/255.0 alpha:1]];
}

-(void)customizeButton:(UIButton *)button{
    CALayer *layer = button.layer;
    
    //Закруглим края
    CGRect frame = button.frame;
    
    //половина высоты кнопки -> получим овал;
    CGFloat radious = CGRectGetHeight(frame) / 10;
    layer.cornerRadius = radious;
    //Обведем кнопку
    layer.borderColor = [UIColor colorWithRed:204/255.0 green:51/255.0 blue:51/255.0 alpha:1].CGColor;
    layer.borderWidth = 1;
}


@end
