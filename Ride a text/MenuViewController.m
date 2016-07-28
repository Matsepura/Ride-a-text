//
//  MenuViewController.m
//  Race on keyboard
//
//  Created by Semen on 18.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIButton *settingButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutButon;

@end

@implementation MenuViewController

#pragma mark - setup

-(void)setup{
    [self customizeStyleOfView];
    [self customizeButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self setup];
}

#pragma mark - customize

-(void)customizeStyleOfView{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:4/255.0 green:133/255.0 blue:126/255.0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.view.backgroundColor = [UIColor colorWithRed:6/255.0 green:184/255.0 blue:175/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

-(void)customizeButton{
    
    NSArray *sliders = [[NSArray alloc] initWithObjects: self.playButton, self.settingButton, self.aboutButon, nil];
    
    for (UIButton* button in sliders) {
        
        CALayer *layer = button.layer;
        
        //Сделаем отсутпы по краям от текста
        [button setContentEdgeInsets:UIEdgeInsetsMake(10, 20, 10, 20)];
        
        [button layoutIfNeeded];
        
        //Закруглим края
        CGRect frame = button.frame;
        
        //половина высоты кнопки -> получим овал;
        CGFloat radious = CGRectGetHeight(frame) / 7;
        layer.cornerRadius = radious;
        
        
        //Обведем кнопку
        layer.borderColor = [UIColor whiteColor].CGColor;
        layer.borderWidth = 2;
        
        layer.backgroundColor = [UIColor colorWithRed:4/255.0 green:133/255.0 blue:126/255.0 alpha:1].CGColor;
        button.tintColor = [UIColor whiteColor];
    }
}


@end
