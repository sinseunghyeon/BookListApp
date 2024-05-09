//
//  CoreDataManager.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/9/24.
//

import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    static let wishListDatas: [WishListData] = shared.readData()
    
    private init() { }
    
    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    
    func createCoreData(bookData: BookData) {
        guard let context = self.persistentContainer?.viewContext else {
            print("Error: Can't access Core Data view context")
            return
        }

        let newWishList = WishListData(context: context)

        newWishList.title = bookData.title
        newWishList.authors = bookData.authors.first
        newWishList.price = Int64(bookData.price)

        do {
            try context.save()
            print("Data saved successfully")
        } catch {
            print("Failed to save data: \(error.localizedDescription)")
        }
    }
    
    func readData() -> [WishListData] {
        guard let context = self.persistentContainer?.viewContext else {
            print("Error: Can't access Core Data view context")
            return []
        }
        
        let request = WishListData.fetchRequest()
        
        do {
            let wishListDatas = try context.fetch(request)
            return wishListDatas
        } catch {
            print("Error fetching data from CoreData: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteData(at index: Int) {
        guard let viewContext = self.persistentContainer?.viewContext else {
            print("Error: Can't access Core Data view context")
            return
        }
        
        let request = WishListData.fetchRequest()
        
        do {
            let wishListDatas = try viewContext.fetch(request)
            // 인덱스 유효성 검사
            guard wishListDatas.indices.contains(index) else {
                print("Error: Index out of range")
                return
            }
            // 인덱스에 해당하는 데이터 삭제
            let dataToDelete = wishListDatas[index]
            viewContext.delete(dataToDelete)
            
            // 변경 사항 저장
            try viewContext.save()
            print("Data deleted successfully")
        } catch {
            print("Failed to delete data: \(error.localizedDescription)")
        }
    }
}
