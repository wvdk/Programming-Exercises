//
//  AppDelegate.swift
//  Learning Push
//
//  Created by Wesley Van der Klomp on 2/14/16.
//  Copyright © 2016 Wesley Van der Klomp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // Push stuff
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Sound, .Badge], categories: nil)
        
        application.registerUserNotificationSettings(settings)
        
        application.registerForRemoteNotifications()
        
        return true
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        print("didRegisterForRemoteNotificationsWithDeviceToken")
        let tokenString = convertDeviceTokenToString(deviceToken)
        
        print("Token: \(tokenString)")
    }
    
    private func convertDeviceTokenToString(deviceToken:NSData) -> String {
        //  Convert binary Device Token to a String (and remove the <,> and white space charaters).
        var deviceTokenStr = deviceToken.description.stringByReplacingOccurrencesOfString(">", withString: "", options: .CaseInsensitiveSearch, range: nil)
        deviceTokenStr = deviceTokenStr.stringByReplacingOccurrencesOfString("<", withString: "", options: .CaseInsensitiveSearch, range: nil)
        deviceTokenStr = deviceTokenStr.stringByReplacingOccurrencesOfString(" ", withString: "", options: .CaseInsensitiveSearch, range: nil)
        
        // Our API returns token in all uppercase, regardless how it was originally sent.
        // To make the two consistent, I am uppercasing the token string here.
        deviceTokenStr = deviceTokenStr.uppercaseString
        return deviceTokenStr
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject], fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        // display the userInfo
        if let notification = userInfo["aps"] as? NSDictionary,
            let alert = notification["alert"] as? String {
                let alertCtrl = UIAlertController(title: "Time Entry", message: alert as String, preferredStyle: UIAlertControllerStyle.Alert)
                alertCtrl.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                // Find the presented VC...
                var presentedVC = self.window?.rootViewController
                while (presentedVC!.presentedViewController != nil)  {
                    presentedVC = presentedVC!.presentedViewController
                }
                presentedVC!.presentViewController(alertCtrl, animated: true, completion: nil)
                
                // call the completion handler
                // -- pass in NoData, since no new data was fetched from the server.
                completionHandler(UIBackgroundFetchResult.NoData)
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

