//
//  ViewController.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/7/24.
//

import UIKit

class ViewController: UICollectionViewController {
    
    static let identifier = "ViewController"
    
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.navigationItem.title = "BookListApp"
        self.configureSearchBar()
    }
    
    private func configureSearchBar() {
        navigationItem.titleView = searchBar
        searchBar.placeholder = "검색어를 입력하세요"
        searchBar.delegate = self
    }

    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UINib(nibName: CollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CollectionViewCell.identifier)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.headLabel.text = "최근 본 책"
            cell.state = .recentTappedBooks
        case 1:
            cell.headLabel.text = "검색 결과"
            cell.state = .searchResultBooks
        default:
            return UICollectionViewCell()
        }
        cell.backgroundColor = .gray
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 5.0
        return cell
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            let width = collectionView.frame.width - 16
            let height = collectionView.frame.height / 5.7
            
            return CGSize(width: width, height: height)
        case 1:
            let width = collectionView.frame.width - 16
            let height = collectionView.frame.height / 2
            print(collectionView.frame.height)
            return CGSize(width: width, height: height)
        default:
            return CGSize(width: 100, height: 100)
        }
        
        
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        self.resultData.removeAll()
//        
//        for i in 0..<repositories.count {
//            if repositories[i].getName().lowercased().contains(searchText.lowercased()) {
//                self.resultData.append(repositories[i])
//            }
//        }
//        if searchText.isEmpty {
//            self.state = .default
//        }
//        collectionView.reloadData()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//        self.state = .search
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        self.state = .default
    }
}

