//
//  trafficOneTwoThreeViewController.m
//  Race on keyboard
//
//  Created by Semen on 16.08.15.
//  Copyright (c) 2015 Semen Matsepura. All rights reserved.
//

#import "trafficOneTwoThreeViewController.h"
#import "RaceViewController.h"

@interface trafficOneTwoThreeViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (assign, nonatomic) NSInteger a;

@end

@implementation trafficOneTwoThreeViewController



-(void)countingOneTwoThree{
    self.a = 3;
    [self colorOfTrafficRed];

    NSLog(@"self.a %ld", (long)self.a);
    [self performSelector:@selector(colorOfTrafficYellow)
               withObject:nil
               afterDelay:1];

    NSLog(@"self.a %ld", (long)self.a);
    [self performSelector:@selector(colorOfTrafficGreen)
               withObject:nil
               afterDelay:1.8];
}

-(void)colorOfTrafficRed{
    [self counting];
    self.imageView.image = [self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageView setTintColor:[UIColor colorWithRed:204/255.0 green:51/255.0 blue:51/255.0 alpha:1]];
}

-(void)colorOfTrafficYellow{
        [self counting];
    self.imageView.image = [self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageView setTintColor:[UIColor colorWithRed:255/255.0 green:136/255.0 blue:0/255.0 alpha:1]];
}

-(void)colorOfTrafficGreen{
        [self counting];
    self.imageView.image = [self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.imageView setTintColor:[UIColor colorWithRed:62/255.0 green:180/255.0 blue:137/255.0 alpha:1]];
    //попадаем в гонку
    [self performSelector:@selector(goRace)
               withObject:nil
               afterDelay:0.5];

}

-(void)counting{
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"traffic%ld.png", (long)self.a]];
    self.a--;
}

-(void)goRace{
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        RaceViewController *rvc = [storyboard instantiateViewControllerWithIdentifier:@"RaceViewController"];
        [rvc setModalPresentationStyle:UIModalPresentationFullScreen];
        
        [self presentViewController:rvc animated:NO completion:nil];
    }

}

- (void)viewDidLoad {
    [self countingOneTwoThree];

}

@end
