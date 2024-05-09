//
//  ButtonManager.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/9/24.
//

import UIKit

class ButtonManager {
    static func tapBackButton(viewController: UIViewController) {
        print("뒤로 이동")
        viewController.dismiss(animated: true, completion: nil)
    }
    
    static func tapAddButton(bookData: BookData) {
        print("위시리스트 추가")
        CoreDataManager.shared.createCoreData(bookData: bookData)
    }
    
    static func handleLongPress(gesture: UILongPressGestureRecognizer, collectionView: UICollectionView) {
        print("위시리스트 삭제")
        if gesture.state != .began {
            return // 롱 프레스가 시작될 때만 반응하도록 함
        }
        
        let point = gesture.location(in: collectionView)
        if let indexPath = collectionView.indexPathForItem(at: point) {
            DispatchQueue.main.async {
                collectionView.performBatchUpdates({
                    CoreDataManager.shared.deleteData(at: indexPath.row)
                    collectionView.deleteItems(at: [indexPath])
                }, completion: nil)
            }
        }
    }
}
