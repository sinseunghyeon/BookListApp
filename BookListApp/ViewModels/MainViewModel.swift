//
//  MainViewModel.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/8/24.
//

import UIKit

class MainViewModel {
    static let defaults = UserDefaults.standard
    static var indexPathRow: Int = 0
    static var recentArray = [BookData]()
    
    static func setRecentArray() {
        MainViewModel.recentArray = MainViewModel.defaults.array(forKey: "recentSelectBook") as? [BookData] ?? [BookData]()
    }
}
