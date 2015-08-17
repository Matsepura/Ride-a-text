//
//  CarsColor.m
//  Race on keyboard
//
//  Created by Semen on 15.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "CarsCollection.h"
#import "CarSelect.h"

@interface CarsCollection ()

@property (assign , nonatomic) NSInteger checkRepeatFirstAndSecondCar;
@property (assign, nonatomic)  NSInteger checkAboutRepeat;
@property (assign , nonatomic) NSInteger numberOfCar;

@end

@implementation CarsCollection

// количество машин
-(int)quantityOfCar{
    int quantity = 16;
    
    return quantity;
}

//  проверка, чтобы машинки не попадались одинаковые
-(void)changeCarsColor:(UISlider *)slider{
    CarSelect* car = [CarSelect new];
    
    self.numberOfCar = arc4random_uniform([self quantityOfCar]) + 1;
    
    //проверка на совпадение с машинкой игрока
    if ([[NSString stringWithFormat:@"car%ld.png", (long)self.numberOfCar] isEqualToString:[car loadFromFile]]) {
        [self changeCarsColor:slider];
    }else{
        // проверка на совпадение 2 и 3 машины
        if (self.numberOfCar == self.checkRepeatFirstAndSecondCar) {
            
            [self changeCarsColor:slider];
        }
        else{
            [slider setThumbImage:[UIImage imageNamed:[NSString stringWithFormat:@"car%ld.png", (long)self.numberOfCar]] forState:UIControlStateNormal];
            self.checkRepeatFirstAndSecondCar = self.numberOfCar;
            
        }
    }
}


@end

