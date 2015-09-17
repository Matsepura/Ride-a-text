//
//  MultiplayerNetworking.m
//  Ride a text
//
//  Created by Semen on 17.09.15.
//  Copyright © 2015 Semen Matsepura. All rights reserved.
//

#import "MultiplayerNetworking.h"

@implementation MultiplayerNetworking

#pragma mark GameKitHelper delegate methods

- (void)matchStarted {
    NSLog(@"Match has started successfully");
}

- (void)matchEnded {
    NSLog(@"Match has ended");
    [_delegate matchEnded];
}

- (void)match:(GKMatch *)match didReceiveData:(NSData *)data
   fromPlayer:(NSString *)playerID {
    
}
@end