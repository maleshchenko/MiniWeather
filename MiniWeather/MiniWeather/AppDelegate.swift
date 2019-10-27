//
//  AppDelegate.swift
//  MiniWeather
//
//  Created by Mykola Aleschenko on 8/2/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import UIKit
import WatchConnectivity

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }

        return true
    }
}

extension AppDelegate: WCSessionDelegate {
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {        
        guard let value = message[Constants.requestKey] as? String else { return }
        if value == Constants.requestValue {
            session.sendMessage([Constants.receivedTextKey: PersistenceManager().load()], replyHandler: nil)
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {}

    func sessionDidDeactivate(_ session: WCSession) {}

    func sessionDidBecomeInactive(_ session: WCSession) {}
}
