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
    var state: State = .searchResultBooks {
        didSet {
            self.configureLayoutForState()
        }
    }
    weak var delegate: CollectionViewCellDelegate?
    let stackView = UIStackView()
    let headLabel = UILabel()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageViewCell.self, forCellWithReuseIdentifier: ImageViewCell.identifier)
        collectionView.register(SearchListViewCell.self, forCellWithReuseIdentifier: SearchListViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureCollectionViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayoutForState() {
        let layout = UICollectionViewFlowLayout()
        switch state {
        case .recentTappedBooks:
            layout.scrollDirection = .horizontal
            let height = max(collectionView.bounds.height - 8, 1)
            layout.itemSize = CGSize(width: height, height: height)
            layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        case .searchResultBooks:
            layout.scrollDirection = .vertical
            let width = max(collectionView.bounds.width - 8, 1)
            layout.itemSize = CGSize(width: width, height: 50)
            layout.minimumLineSpacing = 4
            layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        }
        
        collectionView.setCollectionViewLayout(layout, animated: false)
        collectionView.reloadData()
    }
    
    private func configureCollectionViewCell() {
        contentView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.addArrangedSubview(headLabel)
        stackView.addArrangedSubview(collectionView)
        headLabel.font = .systemFont(ofSize: 18)
        headLabel.textColor = .systemGray6
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(10)
        }
    }

}

extension CollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch state {
        case .recentTappedBooks:
            return 10
        case .searchResultBooks:
            return NetworkManager.bookList.count
        }
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
            cell.titleLabel.text = NetworkManager.bookList[indexPath.row].title
            cell.authorLabel.text = NetworkManager.bookList[indexPath.row].authors.first
            cell.priceLabel.text = "\(NetworkManager.bookList[indexPath.row].price)원"
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch state {
        case .recentTappedBooks:
            let height = max(collectionView.bounds.height - 8, 0)
            return CGSize(width: height, height: height)
        case .searchResultBooks:
            let width = max(collectionView.bounds.width - 8, 0)
            return CGSize(width: width, height: 50)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItemAt(self, indexPath: indexPath)
    }
}

