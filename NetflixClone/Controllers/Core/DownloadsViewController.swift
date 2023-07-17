//
//  DownloadsViewController.swift
//  NetflixClone
//
//  Created by Alejandro Robles on 30/06/23.
//

import UIKit

class DownloadsViewController: UIViewController {
    
    private var titles: [TitleItem] = [TitleItem]()
    
    private let downloadedTable: UITableView = {
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Downloads"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        downloadedTable.delegate = self
        downloadedTable.dataSource = self
    }
}

extension DownloadsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else { return UITableViewCell() }
        let titleVM = TitleViewModel(titleName: self.titles[indexPath.row].original_name ?? self.titles[indexPath.row].original_title ?? "",
                                     posterUrl: self.titles[indexPath.row].poster_path ?? "")
        cell.configure(with: titleVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
