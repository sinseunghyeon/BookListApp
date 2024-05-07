//
//  SearchListViewCell.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/8/24.
//

import SnapKit
import UIKit

class SearchListViewCell: UICollectionViewCell {
    
    static let identifier = "SearchListViewCell"
    
    let stackView = UIStackView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let priceLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureSearchListViewCell()
    }
    
    private func configureSearchListViewCell() {
        contentView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(priceLabel)
        
        titleLabel.text = "어린왕자"
        authorLabel.text = "생떽쥐뻬리"
        priceLabel.text = "8000원"
        
        stackView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview().inset(10)
        }
    }

}
