//
//  AboutViewController.m
//  Race on keyboard
//
//  Created by Semen on 23.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

-(void)setup{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:4/255.0 green:133/255.0 blue:126/255.0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.view.backgroundColor = [UIColor colorWithRed:6/255.0 green:184/255.0 blue:175/255.0 alpha:1];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (IBAction)goToSitePuredRu:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.pured.ru"]];

}

@end
