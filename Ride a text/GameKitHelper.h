//
//  GameKitHelper.h
//  Ride a text
//
//  Created by Semen on 10.09.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import <Foundation/Foundation.h>
#pragma mark - How To Make A Simple Multiplayer Game with Sprite Kit: Part 1/2
@import GameKit;

@protocol GameKitHelperDelegate
- (void)matchStarted;
- (void)matchEnded;
- (void)match:(GKMatch *)match didReceiveData:(NSData *)data
   fromPlayer:(NSString *)playerID;
@end

extern NSString *const PresentAuthenticationViewController;
extern NSString *const LocalPlayerIsAuthenticated;

@interface GameKitHelper : NSObject <GKMatchmakerViewControllerDelegate, GKMatchDelegate>

@property (nonatomic, readonly) UIViewController *authenticationViewController;
@property (nonatomic, readonly) NSError *lastError;

@property (nonatomic, strong) GKMatch *match;
@property (nonatomic, assign) id <GameKitHelperDelegate> delegate;
@property (nonatomic, strong) NSMutableDictionary *playersDict;

+ (instancetype)sharedGameKitHelper;
- (void)authenticateLocalPlayer;

- (void)findMatchWithMinPlayers:(int)minPlayers maxPlayers:(int)maxPlayers
                 viewController:(UIViewController *)viewController
                       delegate:(id<GameKitHelperDelegate>)theDelegate;

@end