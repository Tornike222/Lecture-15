//
//  SceneDelegate.swift
//  HW15Horoscope
//
//  Created by telkanishvili on 10.04.24.
//
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let navigationController = UINavigationController(rootViewController: SearchViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

    }
    
}

