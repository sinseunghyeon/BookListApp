//
//  SceneDelegate.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/7/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        // UICollectionViewFlowLayout의 인스턴스를 생성합니다.
        let layout = UICollectionViewFlowLayout()
        
        // ViewController의 인스턴스를 생성하면서 layout을 전달합니다.
        let viewController = ViewController(collectionViewLayout: layout)
        
        // 탭바컨트롤러의 생성
        let tabBarVC = UITabBarController()
        if #available(iOS 13.0, *) {
            let appearance = UITabBarAppearance()
            appearance.stackedLayoutAppearance.selected.iconColor = .black // 선택된 아이템의 아이콘 색상
            appearance.stackedLayoutAppearance.normal.iconColor = .gray // 선택되지 않은 아이템의 아이콘 색상
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black] // 선택된 아이템의 텍스트 색상
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray] // 선택되지 않은 아이템의 텍스트 색상

            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        } else {
            // iOS 13 미만 버전에 대한 색상 설정
            UITabBar.appearance().tintColor = .black // 선택된 아이템 색상
            UITabBar.appearance().unselectedItemTintColor = .gray // 선택되지 않은 아이템 색상
        }
        
        // 첫번째 화면은 네비게이션컨트롤러로 만들기 (기본루트뷰 설정)
        let vc1 = UINavigationController(rootViewController: viewController)
        let vc2 = WishListView()
        
        // 탭바 이름들 설정
        vc1.title = "Main"
        vc2.title = "WishList"
        
        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([vc1, vc2], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white
        
        // 탭바 이미지 설정 (이미지는 애플이 제공하는 것으로 사용)
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        items[0].image = UIImage(systemName: "magnifyingglass")
        items[1].image = UIImage(systemName: "cart")
        
        // 기본루트뷰를 탭바컨트롤러로 설정
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

