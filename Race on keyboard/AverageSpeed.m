//
//  AverageSpeed.m
//  Race on keyboard
//
//  Created by Semen on 06.09.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "AverageSpeed.h"
#import "RaceViewController.h"

@interface AverageSpeed ()

@property RaceViewController *lenght;

@property                     NSDate *timingDate;
@property (assign, nonatomic) CGFloat countOfSec;


@end

@implementation AverageSpeed

-(void)startStopwatch{
    self.timingDate = [NSDate date];
}

-(NSString *)showAverageSpeed{
    self.lenght = [RaceViewController new];
    NSString *string = [NSMutableString new];
    string = [NSString stringWithFormat:@"%@ sign in %@ seconds", [self loadCountOfText], [self loadFromUserDefaults]];
    return string;
}

#pragma mark - save and load

-(void)saveTime{
NSString *valueToSave = [NSString stringWithFormat:@"%.0f", [[NSDate date] timeIntervalSinceDate:self.timingDate]];
[[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"AverageSpeed"];
[[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString *)loadFromUserDefaults{

    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"AverageSpeed"];
    
    return savedValue;
}

-(void)saveCountOfText{
    NSString *valueToSave = [NSString stringWithFormat:@"%ld", (long)self.counfOfSign];
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"Count"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(NSString *)loadCountOfText{
    
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"Count"];
    return savedValue;
}

@end
