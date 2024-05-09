//
//  ButtonManager.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/9/24.
//

import Toast
import UIKit

class ButtonManager {
    static func tapBackButton(viewController: UIViewController) {
        print("뒤로 이동")
        viewController.dismiss(animated: true, completion: nil)
    }
    
    static func tapAddButton(bookData: BookData, viewController: UIViewController) {
        print("위시리스트 추가")
        CoreDataManager.shared.createCoreData(bookData: bookData)
        CoreDataManager.shared.readData()
        viewController.dismiss(animated: true, completion: {
            // 모달이 완전히 닫힌 후에 실행됩니다.
            if let parentView = viewController.presentingViewController?.view {
                parentView.makeToast("위시리스트에 추가했습니다", duration: 1.5, position: .center)
            }
        })
        
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
                    CoreDataManager.shared.readData()
                    collectionView.deleteItems(at: [indexPath])
                }, completion: nil)
            }
        }
    }
}
