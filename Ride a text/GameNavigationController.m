//
//  GameNavigationController.m
//  Ride a text
//
//  Created by Semen on 29.09.15.
//  Copyright © 2015 Semen Matsepura. All rights reserved.
//

#import "GameNavigationController.h"
#import "GameKitHelper.h"

@interface GameNavigationController ()

@end

@implementation GameNavigationController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [[NSNotificationCenter defaultCenter]
//     addObserver:self
//     selector:@selector(showAuthenticationViewController)
//     name:PresentAuthenticationViewController
//     object:nil];
//    
//    [[GameKitHelper sharedGameKitHelper]
//     authenticateLocalPlayer];
}

- (void)showAuthenticationViewController
{
    GameKitHelper *gameKitHelper =
    [GameKitHelper sharedGameKitHelper];
    
    [self.topViewController presentViewController:
     gameKitHelper.authenticationViewController
                                         animated:YES
                                       completion:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
