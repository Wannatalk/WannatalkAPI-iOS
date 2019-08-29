//
//  WTLoginManager.h
//  Wannatalk
//
//  Created by Srikanth Ganji on 04/03/17.
//  Copyright © 2017 Wannatalk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WTLoginManagerDelegate;

@interface WTLoginManager : NSObject

// Returns a shared WTLoginManager instance
+ (WTLoginManager *) sharedInstance;

// A delegate to get the events of authentication
@property (nonatomic, weak) id<WTLoginManagerDelegate> delegate;

// User login status
@property (nonatomic, assign, readonly) BOOL isUserLoggedIn;

// To login into wannatalk account
- (void) loginFromVC:(UIViewController *) fromVC;

// To login with user details
- (void) silentLoginWithIdentifier:(NSString *) identifier userInfo:(NSDictionary *)userInfo fromVC:(UIViewController *) fromVC;

// To logout from wannatalk
- (void) logout;

@end
