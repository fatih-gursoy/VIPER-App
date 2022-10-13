//
//  ViewController.swift
//  VIPER-App
//
//  Created by Fatih Gursoy on 7.10.2022.
//

import UIKit

class HomeVC: UIViewController, HomeViewProtocol {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var headerLabel: UILabel!
    
    private var articles: [Article] = []
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        presenter?.viewDidLoad()
    }
    
    func showArticles(articles: [Article]) {
        self.articles = articles
        DispatchQueue.main.async { 
            self.tableView.reloadData()
        }
    }
    
    func showError(error: String) {
        //
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: TableViewCell.identifier, bundle: nil),
                           forCellReuseIdentifier: TableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as? TableViewCell else { fatalError("Error")}
        cell.configure(articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        presenter?.didSelect(from: self, with: article)
    }
    
}

