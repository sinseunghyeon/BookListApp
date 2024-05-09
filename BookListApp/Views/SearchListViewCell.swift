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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureSearchListViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSearchListViewCell() {
        contentView.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(priceLabel)
        
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        titleLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 750), for: .horizontal)
        
        authorLabel.font = .systemFont(ofSize: 12)
        authorLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        authorLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 751), for: .horizontal)
        
        priceLabel.font = .systemFont(ofSize: 14)
        priceLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 252), for: .horizontal)
        priceLabel.setContentCompressionResistancePriority(UILayoutPriority(rawValue: 752), for: .horizontal)
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview().inset(10)
        }
    }

}
