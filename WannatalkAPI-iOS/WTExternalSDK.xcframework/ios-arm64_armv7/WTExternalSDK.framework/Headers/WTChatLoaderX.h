//
//  WTChatLoaderX.h
//  WannaTalk
//
//  Created by Srikanth Ganji on 16/02/22.
//  Copyright © 2022 Wanna Talk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol WTChatLoaderDelegate;

@interface WTChatLoaderX : NSObject

- (id) initWithDelegate:(id<WTChatLoaderDelegate>) delegate;

- (void) loadUserChatPageWithIdentifier:(NSString *) identifier message: (NSString *) message;

- (void) loadUserChatPageWithIdentifier:(NSString *) identifier userInfo:(NSDictionary *) dctObject;

- (void) sendMessage:(NSString *) message orgID:(NSInteger) orgID channelID:(NSInteger) channelID onCompletion:(void(^)(BOOL success, NSString *errorMessage))completionBlock;
//
//+ (void) sendMessageToOrganization:(NSInteger) organizationID message:(NSString *) message;
//


+ (void) LoadNewOrgTopic:(struct WTGroup) group message:(NSString *) message fromNavVC:(UIViewController *) nvc;

@end
