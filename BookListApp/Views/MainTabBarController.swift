//
//  MainTabBarController.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/8/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTabBar()
    }


    private func configureTabBar() {
//        let appearanceTabbar = UITabBarAppearance()
//        appearanceTabbar.configureWithOpaqueBackground()
//        appearanceTabbar.backgroundColor = UIColor.white
//        tabBar.standardAppearance = appearanceTabbar
//        tabBar.tintColor = .black
//        tabBar.backgroundColor = .white
        let firstVC = ViewController(collectionViewLayout: UICollectionViewFlowLayout())
        let firstNavVC = UINavigationController(rootViewController: firstVC)
        firstNavVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        let secondVC = UIViewController()
        let secondNavVC = UINavigationController(rootViewController: secondVC)
        secondNavVC.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
        
        viewControllers = [firstNavVC, secondNavVC]
    }

}
