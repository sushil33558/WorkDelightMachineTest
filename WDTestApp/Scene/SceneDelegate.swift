//
//  SceneDelegate.swift
//  WDTestApp
//
//  Created by Sushil Chaudhary on 9/29/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    //MARK: - Variables
    //-----------------

    var window: UIWindow?
    //MARK: - func For RootVC
    //----------------------
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        let login = UserDefaults.standard.bool(forKey: "Login")
        if login == true{
            let vc = UIStoryboard(name: "WDTest", bundle: nil).instantiateViewController(identifier: "HomeVC") as! HomeViewController
            let navigationCont = UINavigationController(rootViewController: vc)
            navigationCont.navigationBar.prefersLargeTitles = false
            window?.rootViewController = navigationCont
            self.window?.makeKeyAndVisible()
        }else{
            let vc = UIStoryboard(name: "WDTest", bundle: nil).instantiateViewController(identifier: "LoginVC") as! LoginViewController
            let navigationCont = UINavigationController(rootViewController: vc)
            navigationCont.navigationBar.prefersLargeTitles = false
            window?.rootViewController = navigationCont
            self.window?.makeKeyAndVisible()
        }
    }

    //MARK: - APP States
    //------------------

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

