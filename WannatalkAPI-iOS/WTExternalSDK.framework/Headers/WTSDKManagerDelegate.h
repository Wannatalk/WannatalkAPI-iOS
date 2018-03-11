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


@end
