//
//  ViewController.m
//  ArcadeShareDemo
//
//  Created by Karl Diao on 2018/7/15.
//  Copyright © 2018年 Omlet Inc. All rights reserved.
//

#import "ViewController.h"
#import "OMLArcadeShareKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    BOOL installed = [OMLArcadeShareKit isInstalled];
    NSLog(@"Arcade installed: %@", installed ? @"YES" : @"NO");
}


-(IBAction)shareURLToOmletArcade:(id)sender {
    NSURL *URLToShare = [NSURL URLWithString:@"http://google.com?q=123&a=345"];
    NSURL *callback = [NSURL URLWithString:@"omletarcadedemo://"]; // optional
    BOOL success = [OMLArcadeShareKit shareURL:URLToShare callbackURL:callback];
    if (!success) {
        [OMLArcadeShareKit openArcadeInAppStore];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
