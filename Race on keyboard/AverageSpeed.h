//
//  AverageSpeed.h
//  Race on keyboard
//
//  Created by Semen on 06.09.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AverageSpeed : NSObject

-(void)startStopwatch;
-(NSString *)showAverageSpeed;
-(void)saveTime;
-(NSString *)loadFromUserDefaults;
-(void)saveCountOfText;
-(NSString *)loadCountOfText;

@property (assign, nonatomic) NSInteger counfOfSign;

@end
