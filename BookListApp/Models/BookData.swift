//
//  BookData.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/7/24.
//

import Foundation

struct BookSearchResponse: Decodable {
    let documents: [BookData]
}

// MARK: - Document
struct BookData: Codable {
    let authors: [String]
    let contents, datetime, isbn: String
    let price: Int
    let publisher: String
    let salePrice: Int
    let status: String
    let thumbnail: String
    let title: String
    let translators: [String]
    let url: String

    enum CodingKeys: String, CodingKey {
        case authors, contents, datetime, isbn, price, publisher
        case salePrice = "sale_price"
        case status, thumbnail, title, translators, url
    }
}
