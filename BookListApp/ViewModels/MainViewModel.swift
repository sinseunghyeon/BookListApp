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
    static var recentBooks = [BookData]()
    static var mainView: UICollectionViewController = UICollectionViewController()
    
    static func addRecentBook(_ book: BookData) {
        // 배열의 맨 앞에 책 데이터 추가. 필요하면 중복 제거 등의 로직을 추가할 수 있습니다.
        recentBooks.insert(book, at: 0)
        print(book)
        // 배열의 크기가 특정 수를 넘지 않도록 조정
        if recentBooks.count > 10 { // 최대 10개의 책만 저장
            recentBooks.removeLast()
        }
    }
}
