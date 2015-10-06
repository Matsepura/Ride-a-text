//
//  SettingsViewController.h
//  Race on keyboard
//
//  Created by Semen on 22.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

-(NSString *)loadTextSelect;
-(NSString *)loadBotSelect;
-(NSString *)loadVibrateSelect;

-(NSString*)showLastResultForAnotherVC;
@end
