//
//  CoreDataTableViewCell.swift
//  CoreDataChallenge
//
//  Created by Apple New on 2022-04-01.
//

import UIKit
import Elements

class CoreDataTableViewCell: UITableViewCell {

    lazy var titleLable : BaseUILabel = {
        let label = BaseUILabel()
        
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    lazy var descLabel : BaseUILabel = {
        let label = BaseUILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()

    lazy var contentStack: VStack = {
        let stack = VStack()
        stack.addArrangedSubview(titleLable)
        stack.addArrangedSubview(descLabel)
        stack.spacing = 16
//        stack.isLayoutMarginsRelativeArrangement = true
//        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        contentView.addSubview(contentStack)
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
//            contentStack.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            contentStack.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
//            contentStack.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
//            contentStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            contentStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
//
        ])
    }
    
    func updateView(
        title: String,
        desc: String
        
    ) {
        titleLable.text = title
        descLabel.text = desc
    }
    
}
