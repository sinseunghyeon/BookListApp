//
//  WishListView.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/8/24.
//

import UIKit

class WishListView: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
    }

    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.headLabel.text = "위시 리스트"
        cell.state = .searchResultBooks
        cell.backgroundColor = .gray
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 5.0
        return cell
    }
}

extension WishListView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 16
        let height = collectionView.frame.height / 1.2
        
        return CGSize(width: width, height: height)
    }
}
