//
//  WTChatLoaderDelegate.h
//  WannaTalk
//
//  Created by Srikanth Ganji on 16/02/22.
//  Copyright © 2022 Wanna Talk. All rights reserved.
//

#import <UIKit/UIKit.h>

//NS_ASSUME_NONNULL_BEGIN

@protocol WTChatLoaderDelegate <NSObject>

- (void) WTChatLoaderDelegateDidShowSpinner:(BOOL) show;
- (void) WTChatLoaderDelegateDidLoadTopic:(nullable NSString *) error;
- (UIViewController *) getParentVC;

@end


//NS_ASSUME_NONNULL_END
