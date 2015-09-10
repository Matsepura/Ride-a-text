//
//  GCHelper.h
//  Ride a text
//
//  Created by Semen on 10.09.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>
#import <GameController/GameController.h>

@protocol GCHelperDelegate
- (void)matchStarted;
- (void)matchEnded;
- (void)match:(GKMatch *)match didReceiveData:(NSData *)data
   fromPlayer:(NSString *)playerID;
@end

@interface GCHelper : UIViewController <GKMatchmakerViewControllerDelegate, GKMatchDelegate> {
    BOOL gameCenterAvailable;
    BOOL userAuthenticated;
    GKMatch *match;
    BOOL matchStarted;


}

//@property (nonatomic, weak) id <GCHelperDelegate> delegate;
@property (assign, readonly) BOOL gameCenterAvailable;
@property GKLocalPlayer* localPlayer;


+ (GCHelper *)sharedInstance;
- (void)authenticateLocalUser;

@property (nonatomic, copy) UIViewController *presentingViewController;
@property (retain) GKMatch *match;
@property (assign) id <GCHelperDelegate> delegate;

- (void)findMatchWithMinPlayers:(int)minPlayers maxPlayers:(int)maxPlayers
                 viewController:(UIViewController *)viewController
                       delegate:(id<GCHelperDelegate>)theDelegate;

@end

