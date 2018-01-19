//
//  DescriptionViewController.swift
//  ECommerce_Brel
//
//  Created by Ehor Brel on 19.01.18.
//  Copyright © 2018 Ehor Brel. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    var cellDescription:String!
    let textView = UITextView()
    let requestButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        requestButton.addTarget(self, action: #selector(showInputController), for: UIControlEvents.touchUpInside)
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setDescription(descript:String){
        cellDescription = descript
    }
    
    @objc func showInputController(){
        let inputViewController = InputViewController()
        self.navigationController?.pushViewController(inputViewController, animated: true)
    }
    
    func setupUI(){
        
        self.view.backgroundColor = .gray
        self.textView.text = self.cellDescription
        self.textView.isEditable = false
        self.textView.translatesAutoresizingMaskIntoConstraints = false
        self.requestButton.backgroundColor = .green
        self.requestButton.setTitle("Request", for: .normal)
        self.requestButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(textView)
        self.view.addSubview(requestButton)
        
        let leadingTextViewConstraint = NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 30)
        
        let trailingTextViewConstraint = NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: -30)
        
        let topTextViewConstraint = NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 100)
        
        let bottomTextViewConstraint = NSLayoutConstraint(item: textView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -300)
    self.view.addConstraints([leadingTextViewConstraint,trailingTextViewConstraint,bottomTextViewConstraint,topTextViewConstraint])
        
        
        let leadingRequestButtonConstraint = NSLayoutConstraint(item: requestButton, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 30)
        
        let trailingRequestButtonConstraint = NSLayoutConstraint(item: requestButton, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: -30)
        
        let topRequestButtonConstraint = NSLayoutConstraint(item: requestButton, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.textView, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 10)
        
        let bottomRequestButtonConstraint = NSLayoutConstraint(item: requestButton, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: -150)
        
        self.view.addConstraints([leadingRequestButtonConstraint,trailingRequestButtonConstraint,bottomRequestButtonConstraint,topRequestButtonConstraint])
        
    }

}
