//
//  AppDelegate.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import UIKit
import CoreData
import GoogleMaps
import GooglePlaces

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        LocalDataBase.shared.fetchUserDetails()
        
        GMSServices.provideAPIKey(GoogleMapsHelper.shared.googleMapKey)
        GMSPlacesClient.provideAPIKey(GoogleMapsHelper.shared.googleMapKey)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let launch = UINavigationController(rootViewController: UserListVC())
        launch.interactivePopGestureRecognizer?.isEnabled = false
        self.window?.rootViewController = launch
        self.window?.makeKeyAndVisible()
        
        return true
    }

    
    func applicationWillTerminate(_ application: UIApplication) {
        LocalDataBase.shared.saveContext()
        
    }
}

