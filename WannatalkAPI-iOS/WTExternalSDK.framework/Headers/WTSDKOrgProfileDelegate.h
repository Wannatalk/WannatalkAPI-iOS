//
//  WTSDKOrgProfileDelegate.h
//  WTExternalSDK
//
//  Created by Srikanth Ganji on 08/03/18.
//  Copyright © 2018 Wanna Talk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WTSDKOrgProfileDelegate <NSObject>

@optional
- (void) wtsdkOrgProfileDidLoadSuccesfully;
- (void) wtsdkOrgProfileDidLoadFailWithError:(NSString *) error;

@end
