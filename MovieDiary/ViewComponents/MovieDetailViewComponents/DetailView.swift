//
//  DetailView.swift
//  MovieDiary
//
//  Created by Can Yoldas on 6.12.2021.
//

import UIKit
import BaseModules

class DetailView: GenericBaseView<DetailViewData> {
    
    // MARK: - View Components
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 6
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let temp = UILabel()
        temp.textAlignment = .left
        temp.text = "Red Notice (2021)"
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = MainFont.medium(16).value
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        return temp
    }()

    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 2
        temp.heightAnchor.constraint(equalToConstant: 196).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 108).isActive = true
        temp.clipsToBounds = true
        return temp
    }()
    
    private var categoryLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "Drama, Comedy"
        return temp
    }()
    
    lazy var rateLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "9.2/10"
        return temp
    }()
    
    private lazy var textStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [categoryLabel, rateLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.alignment = .leading
        temp.spacing = 10
        temp.distribution = .fillEqually
        return temp
    }()
    
    private lazy var middleStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainer, textStackView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .horizontal
        temp.alignment = .leading
        temp.spacing = 20
        return temp
    }()
    
    lazy var overviewPlaceholderLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "Overview"
        return temp
    }()
    
    private lazy var overviewLabel: UILabel = {
        let temp = UILabel()
        temp.textAlignment = .center
        temp.text = "lorem ipsumaldhjakjdhaskdjhasdjkahsdkjashkdjahskjh "
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = MainFont.medium(14).value
        temp.numberOfLines = 0
        temp.lineBreakMode = .byWordWrapping
        return temp
    }()
    
    lazy var stackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [middleStackView, overviewPack])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.spacing = 20
        temp.distribution = .equalSpacing
        return temp
    }()
    
    private lazy var overviewPack: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [overviewPlaceholderLabel, overviewLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.spacing = 10
        temp.distribution = .fillEqually
        temp.alignment = .leading
        return temp
    }()

    // MARK: - StackViews

    override func addMajorFields() {
        super.addMajorFields()
        addViewComponents()
    }
    
    private func addViewComponents() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(middleStackView)
        containerView.addSubview(overviewPack)
        
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            middleStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            middleStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            middleStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            middleStackView.heightAnchor.constraint(equalToConstant: 200),
            
            overviewPack.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 10),
            overviewPack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            overviewPack.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            overviewPack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
        ])
    }
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        self.imageContainer.setData(data: data.imageData)
        self.titleLabel.text = data.movieName
        self.rateLabel.text = data.score
        self.categoryLabel.text = data.categories
        self.overviewLabel.text = data.overview
        
    }

}
