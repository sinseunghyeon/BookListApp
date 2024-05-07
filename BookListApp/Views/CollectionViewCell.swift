//
//  CollectionViewCell.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/7/24.
//

import SnapKit
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    var state : State = .searchResultBooks
    let stackView = UIStackView()
    let headLabel = UILabel()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        switch state {
        case .recentTappedBooks:
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 100, height: 100)
        case .searchResultBooks:
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(width: 350, height: 50)
            layout.minimumLineSpacing = 4
            layout.sectionInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        }
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: ImageViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageViewCell.identifier)
        collectionView.register(UINib(nibName: SearchListViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SearchListViewCell.identifier)
        return collectionView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureCollectionViewCell()
    }
    
    private func configureCollectionViewCell() {
        contentView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.addArrangedSubview(headLabel)
        stackView.addArrangedSubview(collectionView)
        headLabel.font = .systemFont(ofSize: 18)
        headLabel.textColor = .systemGray6
        
        stackView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview().inset(10)
        }
    }

}

extension CollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch state {
        case .recentTappedBooks:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageViewCell.identifier, for: indexPath) as? ImageViewCell else {
                return UICollectionViewCell()
            }
            
            cell.layer.cornerRadius = cell.frame.width / 2
            cell.layer.masksToBounds = true
            cell.backgroundColor = .white
            cell.layer.borderWidth = 2.0
            
            return cell
        case .searchResultBooks:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchListViewCell.identifier, for: indexPath) as? SearchListViewCell else {
                return UICollectionViewCell()
            }
            
            cell.layer.cornerRadius = 20
            cell.layer.masksToBounds = true
            cell.backgroundColor = .white
            cell.layer.borderWidth = 2.0
            
            return cell
        }
    }
}

