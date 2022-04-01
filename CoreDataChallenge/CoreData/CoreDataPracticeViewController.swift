//
//  CoreDataPracticeViewController.swift
//  CoreDataChallenge
//
//  Created by Apple New on 2022-04-01.
//

import Foundation
import UIKit


class CoreDataPracticeViewController: UIViewController {
    var noteData = [Note]()
    
        
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.systemYellow
        table.layer.shadowColor = UIColor.lightGray.cgColor
        table.layer.opacity = 0.8
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CoreDataTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
  

}

extension CoreDataPracticeViewController : UITableViewDelegate {
    
}

extension CoreDataPracticeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoreDataTableViewCell
        let item = noteData[indexPath.row]
        
        cell.titleLable.text = item.title
        cell.descLabel.text = item.desc
//        cell.setupView()
        return cell
    }
}
