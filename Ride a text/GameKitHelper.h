//
//  GameKitHelper.h
//  Ride a text
//
//  Created by Semen on 10.09.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import <Foundation/Foundation.h>
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

- (void)findMatchWithMinPlayers:(int)minPlayers maxPlayers:(int)maxPlayers
                 viewController:(UIViewController *)viewController
                       delegate:(id<GameKitHelperDelegate>)delegate;

+ (instancetype)sharedGameKitHelper;
- (void)authenticateLocalPlayer;

@end