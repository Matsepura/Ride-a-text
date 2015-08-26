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

@end

@implementation YouWinViewController

-(void)youWinGame{
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"win.png"]];
    self.imageView.image = [self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageView setTintColor:[UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1]];
}

-(void)setup{
    [self.restartButton setTintColor:[UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1]];
        [self youWinGame];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

@end
