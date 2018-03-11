//
//  UINavigationController+WannatalkSDK.h
//  WannaTalk
//
//  Created by Srikanth Ganji on 06/03/18.
//  Copyright © 2018 Wanna Talk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WTSDKOrgProfileDelegate;

@interface UINavigationController (WannatalkSDK)

- (void) pushOrgProfileVCWithDelegate:(id <WTSDKOrgProfileDelegate>) delegate animated:(BOOL) animated;

@end
