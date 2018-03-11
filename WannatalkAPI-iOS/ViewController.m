//
//  ViewController.m
//  WannatalkAPI-iOS
//
//  Created by Srikanth Ganji on 11/03/18.
//  Copyright © 2018 Wannatalk. All rights reserved.
//

#import "ViewController.h"
#import <WTExternalSDK/WTExternalSDK.h>

@interface ViewController () <WTSDKOrgProfileDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[WTLoginManager sharedInstance] silentLoginWithIdentifier:@"<your_phone_number>"];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (IBAction)orgProfileClicked:(id)sender {
    
    [self.navigationController pushOrgProfileVCWithDelegate:self animated:YES];
    
}

- (IBAction)logoutClicked:(id)sender {
    [[WTLoginManager sharedInstance] logout];
}

#pragma mark -

- (void) wtsdkOrgProfileDidLoadFailWithError:(NSString *)error {

}

- (void) wtsdkOrgProfileDidLoadSuccesfully {

}

@end
