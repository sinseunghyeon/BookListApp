//
//  NetworkManager.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/8/24.
//

import Alamofire
import Kingfisher
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    static var bookList: [BookData] = []
    static var searchDebounceTimer: Timer?
    
    private init() { }
    
    func fetchBookList(keyword: String, completion: @escaping (Result<[BookData], Error>) -> Void) {
        let headers: HTTPHeaders = ["Authorization": "KakaoAK 6c59bb9e65504aa63e43d987adc307b6"]
        let parameters: Parameters = ["query": keyword]
        let url = "https://dapi.kakao.com/v3/search/book"
        AF.request(url, method: .get, parameters: parameters, headers: headers).validate().responseDecodable(of: BookSearchResponse.self) { respose in
            switch respose.result {
            case .success(let bookList):
                completion(.success(bookList.documents))
            case .failure(let error):
                print("Error: 데이터 받아오기 실패, \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
    
    func executeNetwork(keyword: String, collectionView: UICollectionView) {
        NetworkManager.shared.fetchBookList(keyword: keyword, completion: { result in
            switch result {
            case .success(let bookData):
                NetworkManager.bookList = bookData
                DispatchQueue.main.async {
                    collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    func fetchThumnailImage(url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            DispatchQueue.main.async {
                completion(UIImage(named: "NoImage"))
            }
            return
        }
        KingfisherManager.shared.retrieveImage(with: url, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                // 이미지 다운로드 성공, UIImage 반환
                DispatchQueue.main.async {
                    completion(value.image)
                }
            case .failure(let error):
                // 이미지 다운로드 실패
                print("Error downloading image: \(error)")
                DispatchQueue.main.async {
                    completion(UIImage(named: "NoImage"))
                }
            }
        }
    }
    
    func excuteKingFisher(url: String, imageView: UIImageView) {
        NetworkManager.shared.fetchThumnailImage(url: url) { image in
            DispatchQueue.main.async {
                if let downloadedImage = image {
                    imageView.image = downloadedImage
                } else {
                    print("Image download failed")
                }
            }
        }
    }
    
}
