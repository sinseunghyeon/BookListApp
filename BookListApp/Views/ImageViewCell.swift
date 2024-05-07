//
//  ImageViewCell.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/7/24.
//

import SnapKit
import UIKit

class ImageViewCell: UICollectionViewCell {
    
    static let identifier = "ImageViewCell"
    
    let imageView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureImageViewCell()
    }
    
    private func configureImageViewCell() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }

}
