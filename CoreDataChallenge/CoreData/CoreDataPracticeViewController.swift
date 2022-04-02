//
//  CoreDataPracticeViewController.swift
//  CoreDataChallenge
//
//  Created by Apple New on 2022-04-01.
//

import Foundation
import UIKit
import CoreData


class CoreDataPracticeViewController: UIViewController {
    static var noteData = [Note]()
    var refdata = [Note]()
    
    var firstLoad = true
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.blue
        table.layer.opacity = 0.8
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        loading()
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CoreDataTableViewCell.self, forCellReuseIdentifier: "cell")
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHandler))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    deinit{
        CoreDataPracticeViewController.noteData = [Note]()
        print("============================deinit")
    }
    
    func loading(){
        if firstLoad {
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            
            do{
                let results: NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let note = result as! Note

                    
                    CoreDataPracticeViewController.noteData.append(note)
                    refdata.append(note)
                }
            }catch{
                print("Fetch failed")
            }
        }
        
    
    }
  
    @objc func addHandler() {
        let vc = CoreDataDescriptionViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension CoreDataPracticeViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CoreDataDescriptionViewController()
        
        vc.indexPath = indexPath.row
        
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{

            let vc = CoreDataDeleteViewController()
            vc.indexPath = indexPath.row
            print("vc.indexPath: \(vc.indexPath)")
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension CoreDataPracticeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataPracticeViewController.noteData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoreDataTableViewCell
        let item = CoreDataPracticeViewController.noteData[indexPath.row]
        
        cell.titleLable.text = item.title
        cell.descLabel.text = item.desc
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
