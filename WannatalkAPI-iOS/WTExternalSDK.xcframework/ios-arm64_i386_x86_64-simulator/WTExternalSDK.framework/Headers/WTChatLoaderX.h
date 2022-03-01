//
//  WTChatLoaderX.h
//  WannaTalk
//
//  Created by Srikanth Ganji on 16/02/22.
//  Copyright © 2022 Wanna Talk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol WTChatLoaderDelegate;
//
//@"Source": @"Product",
//@"Image": @"https://upload.wikimedia.org/wikipedia/commons/a/ab/Apple-logo.png",
//@"Caption": @"caption 1",
//
//@"ProductID": @"123124",
//@"ProductName": @"ABC ",
//@"ProductPrice": @"MYR 21.00",
//@"StoreID": @"312312"

@interface ChatInputData : NSObject


@property NSString *source;
@property NSString *imagePath;
@property NSString *caption;
@property NSString *productName;
@property NSString *productID;
@property NSString *productPrice;
@property NSString *storeID;

@property NSString *buyerOrderRef;
@property NSString *sellerOrderRef;

@end

@interface WTChatLoaderX : NSObject

- (id) initWithDelegate:(id<WTChatLoaderDelegate>) delegate;

- (void) loadUserChatPageWithIdentifier:(NSString *) identifier message: (NSString *) message;

- (void) loadUserChatPageWithIdentifier:(NSString *) identifier userInfo:(NSDictionary *) dctObject;
- (void) loadUserChatPageWithIdentifier:(NSString *) identifier chatInputData:(ChatInputData *) chatInputData;

- (void) sendMessage:(NSString *) message orgID:(NSInteger) orgID channelID:(NSInteger) channelID onCompletion:(void(^)(BOOL success, NSString *errorMessage))completionBlock;
//
//+ (void) sendMessageToOrganization:(NSInteger) organizationID message:(NSString *) message;
//


+ (void) LoadNewOrgTopic:(struct WTGroup) group message:(NSString *) message fromNavVC:(UIViewController *) nvc;

@end
