//
//  AppDelegate.swift
//  ClimbFriends
//
//  Created by 박진수 on 2020/09/14.
//  Copyright © 2020 jinsu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let navigationController = UINavigationController()
        let coodinaotr = SceneCoordinator(navigationController: navigationController)
        let homeViewModel = HomeViewModel(coordinator: coodinaotr)
        
        window?.rootViewController = navigationController
        
        let homeScene = Scene.home(homeViewModel)
        coodinaotr.transition(to: homeScene, style: .push, animated: true)
        
        return true
    }


}

