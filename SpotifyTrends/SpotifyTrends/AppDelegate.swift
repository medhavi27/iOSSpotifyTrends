//
//  AppDelegate.swift
//  SpotifyTrends
//
//  Created by Michael Zhang on 11/23/18.
//  Copyright © 2018 Michael Zhang. All rights reserved.
//

import UIKit
import SpotifyLogin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate  {
    //SPTSessionManagerDelegate, SPTAppRemoteDelegate, SPTAppRemotePlayerStateDelegate
    
//    static var spotifySession: SPTSession?
//
//    let SpotifyClientID = "0bbbb8a0172e460cbbdf9b278063e15f"
//    let SpotifyRedirectURL = URL(string: "spotify-trends://login")! // TODO: HERE <-----------
//
//    lazy var configuration = SPTConfiguration(
//        clientID: SpotifyClientID,
//        redirectURL: SpotifyRedirectURL
//    )
//
//    func sessionManager(manager: SPTSessionManager, didInitiate session: SPTSession) {
//        self.appRemote.connectionParameters.accessToken = session.accessToken
//        self.appRemote.connect()
//        print("success", session)
//        AppDelegate.spotifySession = session
//    }
//    func sessionManager(manager: SPTSessionManager, didFailWith error: Error) {
//        print("fail", error)
//    }
//    func sessionManager(manager: SPTSessionManager, didRenew session: SPTSession) {
//        print("renewed", session)
//    }
//
//    lazy var sessionManager: SPTSessionManager = {
//        if let tokenSwapURL = URL(string: "http://35.245.9.254/"),
//            let tokenRefreshURL = URL(string: "http://35.245.9.254/callback/q") {
//            self.configuration.tokenSwapURL = tokenSwapURL
//            self.configuration.tokenRefreshURL = tokenRefreshURL
//            self.configuration.playURI = ""
//        }
//        let manager = SPTSessionManager(configuration: self.configuration, delegate: self)
//        return manager
//    }()
//
//
//    func appRemoteDidEstablishConnection(_ appRemote: SPTAppRemote) {
//        print("connected")
//    }
//    func appRemote(_ appRemote: SPTAppRemote, didDisconnectWithError error: Error?) {
//        print("disconnected")
//    }
//    func appRemote(_ appRemote: SPTAppRemote, didFailConnectionAttemptWithError error: Error?) {
//        print("failed")
//    }
//    func playerStateDidChange(_ playerState: SPTAppRemotePlayerState) {
//        print("player state changed")
//    }
//
//    lazy var appRemote: SPTAppRemote = {
//        let appRemote = SPTAppRemote(configuration: self.configuration, logLevel: .debug)
//        appRemote.delegate = self
//        return appRemote
//    }()
//
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let navigationController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navigationController
        
        SpotifyLogin.shared.configure(clientID: "0bbbb8a0172e460cbbdf9b278063e15f", clientSecret: " 170f44b4442143e2a007cd788b84c1c3", redirectURL: URL(string: "spotify-trends://login")! )
        
//        //Spotify
//        self.configuration.playURI = ""
//        let requestedScopes: SPTScope = [.appRemoteControl]
//        self.sessionManager.initiateSession(with: requestedScopes, options: .default)
        
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        //self.sessionManager.application(app, open: url, options: options)
        //return true
        let handled = SpotifyLogin.shared.applicationOpenURL(url) { (error) in
            
        }
        return handled
    }

//    func applicationWillResignActive(_ application: UIApplication) {
//        if self.appRemote.isConnected {
//            self.appRemote.disconnect()
//        }
//    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
//        if let _ = self.appRemote.connectionParameters.accessToken {
//            self.appRemote.connect()
//        }
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
