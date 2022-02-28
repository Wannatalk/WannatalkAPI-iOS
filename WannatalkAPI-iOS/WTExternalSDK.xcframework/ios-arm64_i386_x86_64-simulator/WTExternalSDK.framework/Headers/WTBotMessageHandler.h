//
//  WTBotMessageHandler.h
//  WannaTalkSDK
//
//  Created by Srikanth Ganji on 13/10/21.
//  Copyright © 2021 Wanna Talk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WTBotMessageHandler : NSObject

- (void) sendMessage:(NSString *) message orgID:(NSInteger) orgID channelID:(NSInteger) channelID onCompletion:(void(^)(BOOL success, NSString *errorMessage))completionBlock;

@end

NS_ASSUME_NONNULL_END
