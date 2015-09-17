//
//  MultiplayerViewController.h
//  Ride a text
//
//  Created by Semen on 10.09.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiplayerNetworking.h"


@interface MultiplayerViewController : UIViewController <MultiplayerNetworkingProtocol>
@property (nonatomic, copy) void (^gameOverBlock)(BOOL didWin);
@property (nonatomic, copy) void (^gameEndedBlock)();
@property (nonatomic, strong) MultiplayerNetworking *networkingEngine;

@property (strong, nonatomic) NSString* car;
-(void)youWin;
@property (assign, nonatomic) NSInteger countOfWords;


@end
