//
//  NetworkManager.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/8/24.
//

import Alamofire
import Foundation

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
    
    func executeNetwork(keyword: String) {
        NetworkManager.shared.fetchBookList(keyword: keyword, completion: { result in
            switch result {
            case .success(let bookData):
                NetworkManager.bookList = bookData
            case .failure(let error):
                print(error)
            }
            
        })
    }
    
}
