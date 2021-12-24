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
        temp.register(LoadingTableViewCell.self, forCellReuseIdentifier: LoadingTableViewCell.identifier)
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
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return delegate?.isLoadingCell(for: indexPath.row) ?? false
    }
    
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = delegate?.askData(at: indexPath.row) else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell  else {
            fatalError("Please provide  registered cell items")
            
        }
        cell.selectionStyle = .none
        cell.setData(by: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            delegate?.getMoreData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.startTappedAnimation(with: { [weak self] finish in
            if finish {
                self?.delegate?.selectedItem(at: indexPath.row)
                cell?.isUserInteractionEnabled = true
            }
        })

    }
}
