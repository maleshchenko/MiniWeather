//
//  InterfaceController.swift
//  MiniWeather WatchKit Extension
//
//  Created by Mykola Aleschenko on 8/2/19.
//  Copyright © 2019 Mykola Aleschenko. All rights reserved.
//

import WatchKit
import WatchConnectivity

class InterfaceController: WKInterfaceController {
    @IBOutlet var label: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)        
    }
    
    override func willActivate() {
        super.willActivate()
        
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
            session.sendMessage([Constants.requestKey: Constants.requestValue], replyHandler: nil)
        }
    }
}

extension InterfaceController: WCSessionDelegate {    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) { }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        guard let text = message[Constants.receivedTextKey] as? String else { return }
        label.setText(text)
    }
}
