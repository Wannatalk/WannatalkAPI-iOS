//
//  WTSDKManagerDelegate.h
//  Wannatalk
//
//  Created by Srikanth Ganji on 31/05/17.
//  Copyright © 2017 Wannatalk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WTSDKManagerDelegate <NSObject>

- (UINavigationController *) prepareViewHierachiesToLoadChatRoom;
- (UINavigationController *) prepareViewHierachiesToLoadChatRoom:(BOOL) aiTopic;

@optional
- (void) wtsdkOrgProfileDidLoadSuccesfully;
- (void) wtsdkOrgProfileDidLoadFailWithError:(NSString *) error;

//- (void) wtsdkChatListDidLoadSuccesfully;
- (void) wtsdkChatListDidLoadFailWithError:(NSString *) error;

//- (void) wtsdkUsersDidLoadSuccesfully;
- (void) wtsdkUsersDidLoadFailWithError:(NSString *) error;

@end
