//
//  ImageTableController.swift
//  ECommerce_Brel
//
//  Created by Ehor Brel on 19.01.18.
//  Copyright © 2018 Ehor Brel. All rights reserved.
//


import UIKit

class ImageTableController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    let imageTable = UITableView()
    var tableModel :ItemDataManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.createConstraints()
        self.tableModel = ItemDataManager(tableView:imageTable)
        tableModel.loadItems()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func setupUI(){
        self.imageTable.rowHeight = 300
        self.view.backgroundColor = .white
        imageTable.translatesAutoresizingMaskIntoConstraints = false
        imageTable.delegate = self
        imageTable.dataSource = self
        imageTable.register(ImageTableViewCell.self, forCellReuseIdentifier: "Imagecell")
        self.view.addSubview(imageTable)
        
    }
    
    private func createConstraints(){
        let leadingImageTableConstraint = NSLayoutConstraint(item: imageTable, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 0)
        
        let trailingImageTableConstraint = NSLayoutConstraint(item: imageTable, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: 0)
        
        let topImageTableConstraint = NSLayoutConstraint(item: imageTable, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 0)
        
        let bottomImageTableConstraint = NSLayoutConstraint(item: imageTable, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0)
        self.view.addConstraints([leadingImageTableConstraint,trailingImageTableConstraint,bottomImageTableConstraint,topImageTableConstraint])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let array = tableModel.itemContainer{
            return array.items.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Imagecell", for: indexPath) as! ImageTableViewCell
        let itemName = tableModel.itemContainer?.items[indexPath.row].name
        cell.startDownloadIndicatior()
        cell.label.text = itemName
        let id = tableModel.itemContainer?.items[indexPath.row].id
        if let image = tableModel.dictionary[id!] {
            cell.stopDownloadIndicatior()
            cell.imageField.image = image
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellDescription = tableModel.itemContainer?.items[indexPath.row].description
        let descriptionViewController = DescriptionViewController()
        descriptionViewController.setDescription(descript: cellDescription!)
        self.navigationController?.pushViewController(descriptionViewController, animated: true)
    }
    
}
