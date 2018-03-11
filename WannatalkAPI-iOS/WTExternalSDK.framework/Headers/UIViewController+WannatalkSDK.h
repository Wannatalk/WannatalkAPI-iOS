//
//  UIViewController+WannatalkSDK.h
//  WannaTalk
//
//  Created by Srikanth Ganji on 06/03/18.
//  Copyright © 2018 Wanna Talk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WTSDKOrgProfileDelegate;

@interface UIViewController (WannatalkSDK)

- (void) presentOrgProfileVCWithDelegate:(id <WTSDKOrgProfileDelegate>) delegate animated:(BOOL) animated completion:(void (^ __nullable)(void))completion;

@end
