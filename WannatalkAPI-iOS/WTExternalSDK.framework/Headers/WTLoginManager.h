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

+ (WTLoginManager *) sharedInstance;
@property (nonatomic, weak) id<WTLoginManagerDelegate> delegate;
@property (nonatomic, assign, readonly) BOOL isUserLoggedIn;

- (void) loginFromVC:(UIViewController *) fromVC;

- (void) logout;

@end
