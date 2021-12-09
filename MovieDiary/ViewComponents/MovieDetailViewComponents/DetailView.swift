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
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.axis = .vertical
        temp.distribution = .equalSpacing
        temp.spacing = 20
        temp.alignment = .leading
        return temp
    }()
    
    private lazy var imageContainer: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 2
        temp.heightAnchor.constraint(equalToConstant: 250).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 140).isActive = true
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var overviewLabel: UILabel = {
        let temp = UILabel()
        temp.textAlignment = .center
        temp.text = "lorem ipsum "
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
        containerView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

            stackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
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
