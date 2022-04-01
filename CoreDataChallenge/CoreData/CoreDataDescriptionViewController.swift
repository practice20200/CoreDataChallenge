//
//  CoreDataDescriptionViewController.swift
//  CoreDataChallenge
//
//  Created by Apple New on 2022-04-01.
//

import UIKit
import CoreData
import Elements


class CoreDataDescriptionViewController: UIViewController {
    
    lazy var titleTF : BaseUITextField = {
        let tf = BaseUITextField()
        tf.backgroundColor = .white
        tf.placeholder = "TItle..."
        tf.widthAnchor.constraint(equalToConstant: 200).isActive = true
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return tf
    }()
    
    lazy var descTF : BaseUITextField = {
        let tf = BaseUITextField()
        tf.backgroundColor = .white
        tf.placeholder = "Description"
        tf.widthAnchor.constraint(equalToConstant: 200).isActive = true
        tf.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return tf
    }()
    
    lazy var contentStack : VStack = {
        let content = VStack()
        content.addArrangedSubview(titleTF)
        content.addArrangedSubview(descTF)
        content.spacing = 10
        return content
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(contentStack)
        NSLayoutConstraint.activate([
            contentStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveHandler))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    @objc func saveHandler(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        let newNote = Note(entity: entity!, insertInto: context)
        let vc = CoreDataPracticeViewController()
        newNote.id = CoreDataPracticeViewController.noteData.count as NSNumber
        newNote.title = titleTF.text
        newNote.desc = descTF.text
        
        do {
            try context.save()
            CoreDataPracticeViewController.noteData.append(newNote)
//            navigationController?.popViewController(animated: true)
            dismiss(animated: true)
            print("Scceeded: \(CoreDataPracticeViewController.noteData)")
        }catch {
            print("context save error")
        }
    }


}
