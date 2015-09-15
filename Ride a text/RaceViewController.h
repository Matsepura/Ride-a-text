//
//  RaceViewController.h
//  Race on keyboard
//
//  Created by Semen on 11.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RaceViewController : UIViewController

@property (strong, nonatomic) NSString* car;
-(void)youWin;
@property (assign, nonatomic) NSInteger countOfWords;

@end
