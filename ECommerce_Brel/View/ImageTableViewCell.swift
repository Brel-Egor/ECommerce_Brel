//
//  ImageViewCell.swift
//  ECommerce_Brel
//
//  Created by Ehor Brel on 19.01.18.
//  Copyright © 2018 Ehor Brel. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    let label = UILabel()
    let imageField = UIImageView()
    let progress = UIActivityIndicatorView()
    var name:String?
    var describing:String?
    var price:Double?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startDownloadIndicatior(){
        self.progress.startAnimating()
    }
    
    func stopDownloadIndicatior(){
        self.progress.stopAnimating()
    }
    
    
    func setupUI() {
        self.imageField.translatesAutoresizingMaskIntoConstraints = false
        imageField.backgroundColor = .gray
        self.addSubview(imageField)
        
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)

        self.progress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(progress)
        
        let progressBarConstraintX = NSLayoutConstraint(item: progress ,attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0)
        let progressBarConstraintY = NSLayoutConstraint(item: progress ,attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0)
        
        let labelBottomConstraint = NSLayoutConstraint(item: label ,attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 0)
        let labelHeightConstraint = NSLayoutConstraint(item: label ,attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 30)
        let labelWidthConstraint = NSLayoutConstraint(item: label ,attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0)
        
        let imageFieldHeightConstraint = NSLayoutConstraint(item: imageField ,attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.height, multiplier: 0.9, constant: 0)
        let imageFieldWidhtConstraint = NSLayoutConstraint(item: imageField ,attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.width, multiplier: 1.0, constant: 0)
        
        let cellHeightConstraint = NSLayoutConstraint(item: self ,attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 300)
        
        addConstraint(cellHeightConstraint)
        addConstraints([imageFieldHeightConstraint, imageFieldWidhtConstraint])
        addConstraints([progressBarConstraintX, progressBarConstraintY])
        addConstraints([labelBottomConstraint,labelHeightConstraint,labelWidthConstraint])
    }
    
    override func prepareForReuse() {
        self.imageField.image = nil
    }
}

