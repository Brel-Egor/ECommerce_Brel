//
//  JsonConstants.swift
//  ECommerce_Brel
//
//  Created by Ehor Brel on 19.01.18.
//  Copyright © 2018 Ehor Brel. All rights reserved.
//

import Foundation

struct Constants{
    struct Heroku {
        static let baseAPIURL = "https://ecommerceserv.herokuapp.com/"
        static let pictureFolder = "images/"
    }
    struct HerokuGet {
        static let get_items = "Items"
    }
    struct HerokuPost {
        static let add_request = "request"
    }
}

struct Items: Codable{
    let items : Array<Item>
}

struct Item: Codable {
    let id: Int
    let description: String
    let name: String
    let price: Double
    let pictUrl: String
}


