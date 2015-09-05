//
//  PlayerCarChooseViewController.m
//  Race on keyboard
//
//  Created by Semen on 15.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "CarSelect.h"
#import "CarsCollection.h"
#import "RaceViewController.h"
#import "trafficOneTwoThreeViewController.h"
#import "SettingsViewController.h"

@interface CarSelect ()

@property (strong, nonatomic) id note;

@end

@implementation CarSelect

#pragma mark - setup

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self listOfCarToSelect];
    [self setup];
}

-(void)setup{
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1];
    
    self.view.backgroundColor = [UIColor colorWithRed:127/255.0 green:181/255.0 blue:181/255.0 alpha:1];
}

#pragma mark - list of car

//создаем два столбика со всеми машинами для выбора машины игрока
-(void)listOfCarToSelect{
    CarsCollection *quantity = [CarsCollection new];
    
    NSInteger y = self.view.center.y / 2.3;
    NSInteger moveToTheRight = 1;
    NSInteger moveToTheDownward = 0;
    NSInteger carToShow = 1;
    
    for (int i = 0; i != [quantity quantityOfCar]; i++) {
        NSInteger x = self.view.center.x / 2;
        
        if (moveToTheRight == 2) {
            
            moveToTheRight = 0;
            x+=self.view.center.x;
        }
        if (moveToTheDownward == 2) {
            
            y+=self.view.center.y / 5;
            moveToTheDownward = 0;
        }
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:[NSString stringWithFormat:@"car%ld.png", (long)carToShow] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor clearColor] forState:UIControlStateNormal];
        button.frame = CGRectMake(x, y, 90, 90);
        button.center = CGPointMake(x, y);
        
        
        // Add an action in current code file (i.e. target)
        [button addTarget:self action:@selector(saveToUserDefaults:)
         forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"car%ld.png", (long)carToShow]] forState:UIControlStateNormal];
        
        [self.view addSubview:button];
        
        carToShow++;
        moveToTheRight++;
        moveToTheDownward++;
    }
}

#pragma mark - go to another view
//выбираем машинку по нажатию и переходим на окно назад
-(void)goToRaceViewController{
    
    NSUInteger ownIndex = [self.navigationController.viewControllers indexOfObject:self];
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:ownIndex - 1] animated:YES];
}

#pragma mark - save player car into NSUserDefaults

-(void)saveToUserDefaults:(UIButton *)button {
    NSString *valueToSave = [NSString stringWithFormat:@"%@", button.currentTitle];
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"playerCar"];
    [[NSUserDefaults standardUserDefaults] synchronize];


    [self goToRaceViewController];
}

-(NSString *)loadFromUserDefaults{
    if ([[NSUserDefaults standardUserDefaults]
         stringForKey:@"playerCar"] == nil) {
        NSString *valueToSave = [NSString stringWithFormat:@"car1.png"];
        [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"playerCar"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSLog(@"car select is nil!");
    }
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"playerCar"];
    
    return savedValue;
}

@end
