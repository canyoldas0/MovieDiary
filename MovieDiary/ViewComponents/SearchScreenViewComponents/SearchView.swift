//
//  SearchBarView.swift
//  MovieDiary
//
//  Created by Can Yoldas on 19.12.2021.
//

import UIKit
import BaseModules

class SearchView: GenericBaseView<SearchViewData> {
    
    weak var delegate: ItemProviderProtocol?
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.separatorStyle = .singleLine
        temp.estimatedRowHeight = UITableView.automaticDimension
        temp.rowHeight = UITableView.automaticDimension
        temp.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        addViewComponents()
    }
    
    private func addViewComponents() {
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func reloadTableView() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.tableView.reloadData()
        }
    }
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
