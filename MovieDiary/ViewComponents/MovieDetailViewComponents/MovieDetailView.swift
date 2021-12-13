//
//  MovieDetailView.swift
//  MovieDiary
//
//  Created by Can Yoldas on 6.12.2021.
//

import UIKit
import BaseModules

class MovieDetailView: GenericBaseView<MovieDetailViewData> {
    
    weak var delegate: ItemProviderProtocol?
    
    lazy var backgroundView: UIView = {
        let temp = UIView(frame: self.bounds)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .black
        temp.alpha = 0.5
        return temp
    }()
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.allowsSelection = false
        temp.bounces = false
        temp.separatorStyle = .none
        temp.estimatedRowHeight = 600
        temp.rowHeight = UITableView.automaticDimension
        temp.layer.cornerRadius = 24
        temp.showsVerticalScrollIndicator = false
        // UITableView.automaticDimension //
        temp.register(MovieDetailTableViewCell.self, forCellReuseIdentifier: MovieDetailTableViewCell.identifier)
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addTableView()
    }
    
    private func addTableView() {
        addSubview(backgroundView)
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 400),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource & Delegate
extension MovieDetailView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        delegate?.askNumberOfItem(in: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = delegate?.askData(at: indexPath.row) else { fatalError("Couldnt get any data") }
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MovieDetailTableViewCell.identifier,
            for: indexPath) as? MovieDetailTableViewCell else { fatalError("Couldnt get any data") }
        
        cell.setData(by: data)
        return cell
    }
}
