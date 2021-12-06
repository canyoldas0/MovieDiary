//
//  MovieDetailTableViewCell.swift
//  MovieDiary
//
//  Created by Can Yoldas on 6.12.2021.
//

import BaseModules
import UIKit

class MovieDetailTableViewCell: BaseTableViewCell {
    
    lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var movieDetailView: DetailView = {
        let temp = DetailView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addViewComponents()
    }
    
    private func addViewComponents() {
        contentView.addSubview(containerView)
        containerView.addSubview(movieDetailView)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            movieDetailView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            movieDetailView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            movieDetailView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            movieDetailView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),

        ])
    }
 
    func setData(by value: GenericDataProtocol) {
        guard let data = value as? DetailViewData else { return }
        movieDetailView.setData(data: data)
    }
}
