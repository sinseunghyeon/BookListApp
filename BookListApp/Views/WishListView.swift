//
//  WishListView.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/8/24.
//

import SnapKit
import UIKit

class WishListView: UICollectionViewController {
    
    let headLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.setupLongPressGesture()
    }

    private func configureCollectionView() {
        view.backgroundColor = .systemBackground
        view.addSubview(headLabel)
        headLabel.text = "위시 리스트"
        headLabel.textAlignment = .center
        headLabel.backgroundColor = .systemBackground
        headLabel.font = .systemFont(ofSize: 25, weight: .heavy)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(SearchListViewCell.self, forCellWithReuseIdentifier: SearchListViewCell.identifier)
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        headLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaInsets)
            make.height.equalTo(50)
        }
        collectionView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(headLabel.snp.bottom)
        }
    }
    
    private func setupLongPressGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(gesture:)))
        collectionView.addGestureRecognizer(longPressGesture)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CoreDataManager.wishListDatas.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchListViewCell.identifier, for: indexPath) as? SearchListViewCell else {
            return UICollectionViewCell()
        }
        
        cell.layer.cornerRadius = 20
        cell.layer.masksToBounds = true
        cell.backgroundColor = .white
        cell.layer.borderWidth = 2.0
        cell.titleLabel.text = CoreDataManager.wishListDatas[indexPath.row].title
        cell.authorLabel.text = CoreDataManager.wishListDatas[indexPath.row].authors
        cell.priceLabel.text = "\(CoreDataManager.wishListDatas[indexPath.row].price)원"
        
        return cell
    }
    
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
        ButtonManager.handleLongPress(gesture: gesture, collectionView: collectionView)
    }
}

extension WishListView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = max(collectionView.bounds.width - 16, 0)
        return CGSize(width: width, height: 80)
    }
}
