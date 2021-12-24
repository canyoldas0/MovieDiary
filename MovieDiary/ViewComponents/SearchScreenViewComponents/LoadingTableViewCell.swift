//
//  LoadingTableViewCell.swift
//  MovieDiary
//
//  Created by Can Yoldas on 24.12.2021.
//

import UIKit
import BaseModules

class LoadingTableViewCell: BaseTableViewCell {

    var activityIndicator: UIActivityIndicatorView!
    
    override func setupView() {
        super.setupView()
        prepareViewCell()
    }
    
    private func prepareViewCell() {
        
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.style = .medium

        contentView.addSubview(indicator)
        
        NSLayoutConstraint.activate([
            indicator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            indicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            indicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        indicator.startAnimating()
    }
}
