//
//  ViewController.m
//  WannatalkAPI-iOS
//
//  Created by Srikanth Ganji on 11/03/18.
//  Copyright © 2018 Wannatalk. All rights reserved.
//

#import "ViewController.h"
#import <WTExternalSDK/WTExternalSDK.h>

@interface ViewController () <WTLoginManagerDelegate, WTSDKManagerDelegate, WTChatLoaderDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnOrgProfile;
@property (weak, nonatomic) IBOutlet UIButton *btnSilentLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnLogout;

@property WTChatLoaderX *chatLoader;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.chatLoader = [[WTChatLoaderX alloc] initWithDelegate:self];
    [WTLoginManager sharedInstance].delegate = self;
    [self updateButtons];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
- (void) updateButtons {
    
    BOOL userLoggedIn = [WTLoginManager sharedInstance].isUserLoggedIn;
    self.btnLogin.hidden = userLoggedIn;
    self.btnSilentLogin.hidden = userLoggedIn;
    self.btnOrgProfile.hidden = !userLoggedIn;
    self.btnLogout.hidden = !userLoggedIn;
}

#pragma mark -

- (IBAction)silentLoginBtnClicked:(id)sender {
    
    NSDictionary *userInfo = @{ @"displayname": @"<display_name>", @"key1": @"value1", @"key2": @"value2"};
    [[WTLoginManager sharedInstance] silentLoginWithIdentifier:@"<identifier>" userInfo:userInfo fromVC:self];

}

- (IBAction)loginBtnClicked:(id)sender {
    
    [[WTLoginManager sharedInstance] loginFromVC:self];
    
}

- (IBAction)orgProfileClicked:(id)sender {
//    [self.navigationController pushOrgProfileVCWithAutoOpenChat:YES delegate:self animated:YES];
    [self presentOrgProfileVCWithAutoOpenChat:YES delegate:self animated:YES completion:nil];
}

- (void) loadChatList {
//    [self.navigationController pushChatListVCWithDelegate:self animated:YES];
    [self presentChatListVCWithDelegate:self animated:YES completion:nil];
}

- (void) loadUsers {
//    [self.navigationController pushUsersVCWithDelegate:self animated:YES];
    [self presentUsersVCWithDelegate:self animated:YES completion:nil];
}

- (IBAction)loadChatPageClicked:(id)sender {
    
    [self.chatLoader loadUserChatPageWithIdentifier:@"<identifier>" message:@"<message>"];
}


- (IBAction)loadProductPageClicked:(id)sender {
    NSDictionary *dctProduct = @{
      
        @"Source": @"Product",
        @"Image": @"https://upload.wikimedia.org/wikipedia/commons/a/ab/Apple-logo.png",
        @"Caption": @"caption sample text",
        
        @"ProductID": @"product_identifier",
        @"ProductName": @"sample text",
        @"ProductPrice": @"MYR 21.00",
        @"StoreID": @"store_identifier"
        
    };
    
    
    [self.chatLoader loadUserChatPageWithIdentifier:@"<identifier>" userInfo:dctProduct];
    
    
}


- (IBAction)loadOrderPageClicked:(id)sender {
//
    
    NSDictionary *dctOrder = @{
      
        @"Source": @"Order",
        @"OrderBuyerRef": @"order_buyer_ref_no",
        @"OrderSellerRef": @"order_seller_ref_no",
        
        @"Image": @"http://logok.org/wp-content/uploads/2014/04/Apple-logo-grey.png",
        @"Caption": @"caption sample text",
        
        @"StoreID": @"store_identifier"
        
    };
    
    
    [self.chatLoader loadUserChatPageWithIdentifier:@"<identifier>" userInfo:dctOrder];
    
}
- (IBAction)logoutClicked:(id)sender {
    [[WTLoginManager sharedInstance] logout];
}

#pragma mark - Delegate Methods
#pragma mark -
- (void) wtAccountDidLoginSuccessfully {
    [self updateButtons];
}

- (void) wtAccountDidLogOutSuccessfully {
    [self updateButtons];
}

// If implemented, this method will be invoked when login fails
- (void) wtAccountDidLoginFailWithError:(NSString *) error {
    NSLog(@"wtAccountDidLoginFailWithError: %@", error);
}
// If implemented, this method will be invoked when logout fails
- (void) wtAccountDidLogOutFailedWithError:(NSString *) error {
    NSLog(@"wtAccountDidLogOutFailedWithError: %@", error);
}

#pragma mark -
- (void) wtsdkOrgProfileDidLoadFailWithError:(NSString *)error {
    
}

- (void) wtsdkOrgProfileDidLoadSuccesfully {
    
}

#pragma mark -

- (void) WTChatLoaderDelegateDidShowSpinner:(BOOL) show {
    
}
- (void) WTChatLoaderDelegateDidLoadTopic:(nullable NSString *) error {
    
}
- (UIViewController *) getParentVC {
    return self;
}

@end
