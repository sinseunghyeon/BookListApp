//
//  CollectionViewCellDelegate.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/9/24.
//

import Foundation

protocol CollectionViewCellDelegate: AnyObject {
    func didSelectItemAt(_ cell: CollectionViewCell, indexPath: IndexPath)
}
