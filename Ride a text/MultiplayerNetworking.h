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
@end

@interface MultiplayerNetworking : NSObject<GameKitHelperDelegate>
@property (nonatomic, assign) id<MultiplayerNetworkingProtocol> delegate;

@end

