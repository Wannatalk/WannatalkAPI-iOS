# WannatalkAPI-iOS
The official Wannatalk Messenger Objective-C (iOS) API

## To run sample example
1. Request **WTService-Info.plist** from [wannatalk.ai](https://wannatalk.ai)
2. Drag your **WTService-Info.plist** file into the sample application. When prompted, select **"Copy items if needed"** and continue.
3. That's it! Run the app

## Steps to integrate wannatalksdk into your project
1. **SDK Integration**
- CocoaPods
	- Add below line to your podfile:
  
      ```pod 'WTExternalSDK', :git =>'https://github.com/edzehoo/WannatalkAPI-iOS.git'```
  
	- Run  `pod install`

- Manual Integration
	- Drag the **WTExternalSDK.framework** into your application. When prompted, select **"Copy items if needed"** and continue.
	- Go to app target’s General configuration page and add *WTExternalSDK.framework* in `Embedded Binaries`
2. Drag your **WTService-Info.plist** into your application. When prompted, select **"Copy items if needed"** and continue.
3. Set *Always Embed Swift Standard Libraries* to *Yes* in Build Settings of your application target
4. Add below keys in your application's Info.plist

    ```
   <key>NSPhotoLibraryUsageDescription</key>
   <string>To save in-chat photos and videos</string>
   <key>NSContactsUsageDescription</key>
   <string>To locate friends already on the Wannatalk network</string>
   <key>NSCameraUsageDescription</key>
   <string>To take photos and videos to send to friends in-chat</string>
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>To display it in map</string>
   <key>NSMicrophoneUsageDescription</key>
   <string>To record live photos and movies</string>
	  ```
5. Add below line in **application:didFinishLaunchingWithOptions:** method of your AppDelegate.m
```
//#import <WTExternalSDK/WTExternalSDK.h>
[[WTSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
```
## To link Wannatalk account
    [[WTLoginManager sharedInstance] loginFromVC:self];

## To link Wannatalk account without otp verification
    [[WTLoginManager sharedInstance] silentLoginWithIdentifier:@"<your_phone_number>"];

## To load your organization profile
    [self.navigationController pushOrgProfileVCWithDelegate:self animated:YES];

