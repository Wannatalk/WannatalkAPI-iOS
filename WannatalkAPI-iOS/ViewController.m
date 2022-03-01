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

@property (weak, nonatomic) IBOutlet UIStackView *svLoginButtons;
@property (weak, nonatomic) IBOutlet UIStackView *svOptions;

@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnOrgProfile;
@property (weak, nonatomic) IBOutlet UIButton *btnSilentLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnLogout;
@property (weak, nonatomic) IBOutlet UIButton *btnChatWithSeller;
@property (weak, nonatomic) IBOutlet UIButton *btnEnquireProduct;

@property WTChatLoaderX *chatLoader;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.chatLoader = [[WTChatLoaderX alloc] initWithDelegate:self];
    [WTLoginManager sharedInstance].delegate = self;
    WTSDKManager.sharedInstance.delegate = self;
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
    self.btnEnquireProduct.hidden = !userLoggedIn;
    self.btnChatWithSeller.hidden = !userLoggedIn;
    
    self.svLoginButtons.hidden = userLoggedIn;
    self.svOptions.hidden = !userLoggedIn;
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
    
    NSString *sellerUserIdentifier = @"<+seller_phone_number_with_calling_code>"; // Seller phone number
    [self.chatLoader loadUserChatPageWithIdentifier:sellerUserIdentifier message:@"<message>"];
}


- (IBAction)enquireProductBtnClicked:(id)sender {
    NSString *sellerUserIdentifier = @"<+seller_phone_number_with_calling_code>"; // Seller phone number
    
    ChatInputData *chatInputData = [ChatInputData new];
    chatInputData.source = @"Product";
    chatInputData.imagePath = @"https://upload.wikimedia.org/wikipedia/commons/a/ab/Apple-logo.png";
    chatInputData.caption = @"caption sample text";
    chatInputData.productID = @"12312";
    chatInputData.productName = @"Sample text";
    chatInputData.productPrice = @"MYR 21.00";
    chatInputData.storeID = @"12312421421";
    
    [self.chatLoader loadUserChatPageWithIdentifier:sellerUserIdentifier chatInputData:chatInputData];
    
}


- (IBAction)chatWithSellerBtnClicked:(id)sender {
    
    [self.chatLoader sendMessage:@"Hi" orgID:360 channelID:399 onCompletion:^(BOOL success, NSString *errorMessage) {
            
    }];
    
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


- (void) wtsdkLoadProductPage:(NSString *) userIdentifier productID:(NSString *) productID {
    NSLog(@"wtsdkLoadProductPage");
}

- (void) wtsdkLoadOrderPage:(NSString *) userIdentifier storeID:(NSString *) storeID buyerRefOrderID:(NSString *) buyerRefOrderID sellerRefOrderID:(NSString *) sellerRefOrderID {
    NSLog(@"wtsdkLoadOrderPage");
}

- (void) wtsdkLoadStorePage:(NSString *) userIdentifier storeID:(NSString *) storeID {
    NSLog(@"wtsdkLoadStorePage");
}

- (UINavigationController *) prepareViewHierachiesToLoadChatRoom:(BOOL) aiTopic {
    return self.navigationController;
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
