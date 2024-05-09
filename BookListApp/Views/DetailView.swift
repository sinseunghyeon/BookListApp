//
//  DetailView.swift
//  BookListApp
//
//  Created by t2023-m0056 on 5/9/24.
//

import UIKit

class DetailView: UIViewController {
    
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let imageView = UIImageView()
    let priceLabel = UILabel()
    let descriptionLabel = UILabel()
    let backButton = UIButton()
    let addButton = UIButton()
    let scrollView = UIScrollView()
    let verticalStackView = UIStackView()
    let horizontalStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.configureDetailView()
    }
    
    private func configureDetailView() {
        view.addSubview(scrollView)
        scrollView.addSubview(verticalStackView)
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .equalSpacing
        verticalStackView.spacing = 10
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(authorLabel)
        verticalStackView.addArrangedSubview(imageView)
        verticalStackView.addArrangedSubview(priceLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textAlignment = .center
        imageView.contentMode = .scaleAspectFit
        authorLabel.font = .systemFont(ofSize: 15)
        authorLabel.textAlignment = .center
        priceLabel.font = .systemFont(ofSize: 18)
        priceLabel.textAlignment = .center
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        
        view.addSubview(horizontalStackView)
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .fillEqually
        horizontalStackView.spacing = 8
        horizontalStackView.addArrangedSubview(backButton)
        horizontalStackView.addArrangedSubview(addButton)
        backButton.backgroundColor = .lightGray
        backButton.setTitle("닫기", for: .normal)
        backButton.layer.borderColor = UIColor.black.cgColor
        backButton.layer.borderWidth = 5.0
        backButton.layer.cornerRadius = 15
        backButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        addButton.backgroundColor = .darkGray
        addButton.setTitle("위시리스트 추가", for: .normal)
        addButton.layer.borderColor = UIColor.black.cgColor
        addButton.layer.borderWidth = 5.0
        addButton.layer.cornerRadius = 15
        addButton.addTarget(self, action: #selector(tapAddButton), for: .touchUpInside)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.bottom.equalTo(horizontalStackView.snp.top).offset(-30)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
        imageView.snp.makeConstraints { make in
            make.height.equalTo(400)
        }
        verticalStackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.width.equalTo(scrollView)
        }
        horizontalStackView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
    }
    
    @objc func tapBackButton() {
        ButtonManager.tapBackButton(viewController: self)
    }
    
    @objc func tapAddButton() {
        ButtonManager.tapAddButton(bookData: NetworkManager.bookList[MainViewModel.indexPathRow])
    }
    
}
