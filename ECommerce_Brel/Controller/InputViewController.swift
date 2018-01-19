//
//  InputViewController.swift
//  ECommerce_Brel
//
//  Created by Ehor Brel on 19.01.18.
//  Copyright © 2018 Ehor Brel. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    let contactDataTextField = UITextField()
    
    let descriptionTextField = UITextField()
    
    let sendButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        sendButton.addTarget(self, action: #selector(sendPostRequest), for: UIControlEvents.touchUpInside)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupUI(){
        self.view.backgroundColor = .gray
        self.sendButton.setTitle("Send", for: .normal)
        self.contactDataTextField.layer.backgroundColor = UIColor.white.cgColor
        self.descriptionTextField.layer.backgroundColor = UIColor.white.cgColor
        self.contactDataTextField.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        self.sendButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.contactDataTextField)
        self.view.addSubview(self.descriptionTextField)
        self.view.addSubview(self.sendButton)
        
        let leadingContactTextConstraint = NSLayoutConstraint(item: self.contactDataTextField, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 30)
        
        let trailingContactTextConstraint = NSLayoutConstraint(item: self.contactDataTextField, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: -30)
        
        let topContactTextConstraint = NSLayoutConstraint(item: self.contactDataTextField, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 100)
        
        let heightContactTextConstraint = NSLayoutConstraint(item: self.contactDataTextField, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 30)
        self.view.addConstraints([leadingContactTextConstraint,trailingContactTextConstraint,topContactTextConstraint,heightContactTextConstraint])
        
        let leadingDescriptionTextConstraint = NSLayoutConstraint(item: self.descriptionTextField, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 30)
        
        let trailingDescriptionTextConstraint = NSLayoutConstraint(item: self.descriptionTextField, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: -30)
        
        let topDescriptionTextConstraint = NSLayoutConstraint(item: self.descriptionTextField, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.contactDataTextField, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 50)
        
        let heightDescriptionTextConstraint = NSLayoutConstraint(item: self.descriptionTextField, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 30)
        self.view.addConstraints([leadingDescriptionTextConstraint,trailingDescriptionTextConstraint,topDescriptionTextConstraint,heightDescriptionTextConstraint])
        
        let leadingSendButtonConstraint = NSLayoutConstraint(item: self.sendButton, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leading, multiplier: 1.0, constant: 30)
        
        let trailingSendButtonConstraint = NSLayoutConstraint(item: self.sendButton, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: -30)
        
        let topSendButtonConstraint = NSLayoutConstraint(item: self.sendButton, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.descriptionTextField, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 50)
        
        let heightSendButtonConstraint = NSLayoutConstraint(item: self.sendButton, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 30)
        self.view.addConstraints([leadingSendButtonConstraint,trailingSendButtonConstraint,topSendButtonConstraint,heightSendButtonConstraint])
    }

    
    @objc func sendPostRequest(){
        
        if self.contactDataTextField.text != "" && self.descriptionTextField.text != "" {
        let url = URL(string: "https://ecommerceserv.herokuapp.com/request")!
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let postString = "contactData=\(self.contactDataTextField.text!)&description=\(self.descriptionTextField.text!)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
            }
        }
        task.resume()
        self.navigationController?.popViewController(animated: true)
        }
    
    }
}

