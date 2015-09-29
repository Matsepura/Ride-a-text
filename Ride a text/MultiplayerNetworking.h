//
//  MultiplayerNetworking.h
//  Ride a text
//
//  Created by Semen on 17.09.15.
//  Copyright © 2015 Semen Matsepura. All rights reserved.
//

#import "GameKitHelper.h"

@protocol MultiplayerNetworkingProtocol <NSObject>
- (void)matchEnded;
- (void)setCurrentPlayerIndex:(NSUInteger)index;
- (void)movePlayerAtIndex:(NSUInteger)index;
@end

@interface MultiplayerNetworking : NSObject<GameKitHelperDelegate>
@property (nonatomic, assign) id<MultiplayerNetworkingProtocol> delegate;

- (void)sendMove;

@end

