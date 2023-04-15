//
//  AppDelegate.swift
//  DeepLinkUnder13ver
//
//  Created by SeungYeon Yoo on 2023/04/15.
//

import UIKit

//iOS 11.0 target (13이하에서 SceneDelegate 동작 안하므로 AppDelegate에서 모두 구현)

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        print(url)
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let host = urlComponents?.host ?? ""
        print(host)
        if host == "customerdetail" { //url 주소 중에 customerdetail이 포함되어 있는 경우 특정 화면으로 이동 유도
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let customerMessageVC = storyboard.instantiateViewController(withIdentifier: "CustomerMessageViewController") as? CustomerMessageViewController else {
                fatalError("Failed to instantiate CustomerMessageViewController from storyboard.")
            }
            customerMessageVC.customerId = urlComponents?.queryItems?.first?.value
            window?.rootViewController = customerMessageVC
        }
        
        return true
    }
}

