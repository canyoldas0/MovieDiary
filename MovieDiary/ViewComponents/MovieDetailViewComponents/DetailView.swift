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
    
    private lazy var stackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageContainer, overviewLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.distribution = .fill
        temp.spacing = 20
        temp.alignment = .leading
        return temp
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

    // MARK: - StackViews

    override func addMajorFields() {
        super.addMajorFields()
        addViewComponents()
    }
    
    private func addViewComponents() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),

            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        self.imageContainer.setData(data: data.imageData)
    }

}
