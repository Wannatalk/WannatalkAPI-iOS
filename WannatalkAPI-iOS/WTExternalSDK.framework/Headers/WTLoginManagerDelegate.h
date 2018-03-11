//
//  WTLoginManagerDelegate.h
//  Wannatalk
//
//  Created by Srikanth Ganji on 04/03/17.
//  Copyright © 2017 Wannatalk. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WTLoginManagerDelegate <NSObject>


- (void) wtAccountDidLoginSuccessfully;
- (void) wtAccountDidLogOutSuccessfully;
@optional
- (void) wtAccountDidLoginFailWithError:(NSString *) error;
- (void) wtAccountDidLogOutFailedWithError:(NSString *) error;


@end
