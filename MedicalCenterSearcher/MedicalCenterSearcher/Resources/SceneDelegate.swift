//
//  SceneDelegate.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let window = UIWindow(windowScene: windowScene)
    window.rootViewController = createdNavigationController()
    window.makeKeyAndVisible()
    self.window = window
  }
  
  func createdNavigationController() -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: CenterListViewController())
    
    return navigationController
  }
}
