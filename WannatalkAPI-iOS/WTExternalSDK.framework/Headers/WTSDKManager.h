//
//  WTSDKManager.h
//  Wannatalk
//
//  Created by Srikanth Ganji on 09/03/17.
//  Copyright © 2017 Wannatalk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol WTSDKManagerDelegate;
@protocol WTSDKOrgProfileDelegate;

@interface WTSDKManager : NSObject


@property (nonatomic, weak) id<WTSDKManagerDelegate> delegate;

+ (WTSDKManager *) sharedInstance;

- (void) clearTempDirectory;

@end

