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

@interface WTSDKManager : NSObject

@property (nonatomic, weak) id<WTSDKManagerDelegate> delegate;

+ (WTSDKManager *) sharedInstance;

+ (UIViewController *) getInitialViewController;
+ (UIViewController *) getAllTopicsViewController;
+ (UIViewController *) getPeopleViewController;

+ (void) ClearTempDirectory;
+ (void) ShowGuideButton:(BOOL) show;
+ (void) ShouldAllowSendAudioMessage:(BOOL) allow;
+ (void) ShouldAllowAddParticipant:(BOOL) allow;
+ (void) ShouldAllowRemoveParticipant:(BOOL) allow;
+ (void) ShowWelcomeMessage:(BOOL) show;
+ (void) ShowProfileInfoPage:(BOOL) show;
+ (void) EnableAutoTickets:(BOOL) enable;

+ (void) ShowExitButton:(BOOL) show;
+ (void) ShowChatParticipants:(BOOL) show;
+ (void) EnableChatProfile:(BOOL) enable;
+ (void) AllowModifyChatProfile:(BOOL) allow;

+ (void) ShowDebugLogs:(BOOL) show;

@end
