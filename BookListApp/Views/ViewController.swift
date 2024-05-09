//
//  ViewController.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/7/24.
//

import UIKit

enum searchState {
    case `default`
    case searching
}

class ViewController: UICollectionViewController {
    
    static let identifier = "ViewController"
    
    let searchBar = UISearchBar()
    var state: searchState = .default

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.configureSearchBar()
        self.configureNavigationBar()
        self.executeNetwork(keyword: "베스트셀러")
    }
    
    func executeNetwork(keyword: String) {
        NetworkManager.shared.fetchBookList(keyword: keyword, completion: { result in
            switch result {
            case .success(let bookData):
                NetworkManager.bookList = bookData
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
            
        })
    }
    
    private func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        navigationController?.navigationBar.tintColor = .systemGray6
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        title = "Main"
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
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
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
        
        cell.delegate = self
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
            let height = collectionView.frame.height / 1.71

            return CGSize(width: width, height: height)
        default:
            return CGSize(width: 100, height: 100)
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NetworkManager.searchDebounceTimer?.invalidate()
        NetworkManager.searchDebounceTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
            if searchText.isEmpty {
                self?.state = .default
            } else {
                self?.executeNetwork(keyword: searchText)
            }
        })
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.state = .searching
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.state = .default
    }
}

extension ViewController: CollectionViewCellDelegate {
    func didSelectItemAt(_ cell: CollectionViewCell, indexPath: IndexPath) {
        let detailVC = DetailView()
        detailVC.titleLabel.text = NetworkManager.bookList[indexPath.row].title
        detailVC.authorLabel.text = NetworkManager.bookList[indexPath.row].authors.first
        detailVC.priceLabel.text = "\(NetworkManager.bookList[indexPath.row].price)원"
        detailVC.descriptionLabel.text = NetworkManager.bookList[indexPath.row].contents
        detailVC.descriptionLabel.sizeToFit()
        detailVC.modalPresentationStyle = .automatic
        detailVC.modalTransitionStyle = .coverVertical
        self.present(detailVC, animated: true, completion: nil)
    }
}
