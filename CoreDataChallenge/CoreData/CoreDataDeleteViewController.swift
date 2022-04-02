//
//  CoreDataDetailViewController.swift
//  CoreDataChallenge
//
//  Created by Apple New on 2022-04-01.
//

import UIKit
import Elements
import CoreData

class CoreDataDeleteViewController: UIViewController {

    var indexPath: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    lazy var button : BaseUIButton = {
        let button = BaseUIButton()
        button.setTitle("Delete", for: .normal)
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.backgroundColor = .red
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(moveHandler), for: .touchUpInside)
        return button
    }()
    
    @objc func moveHandler(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        if indexPath != nil {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
            do{
                
                let results: NSArray = try context.fetch(request) as NSArray
                
                for result in results {
                    let note = result as! Note
                    if note.title == CoreDataPracticeViewController.noteData[indexPath ?? -1].title{
                        context.delete(note)
                        try context.save()
                        note.title = "Deleted"
                        note.desc = "Deleted"
                        context.delete(note)
                        print("result \(result)")
                        
                    }
                }
            }catch{
                print("Fetch failed")
            }
        }
    }
}
