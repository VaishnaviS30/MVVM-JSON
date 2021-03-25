//
//  ViewController.swift
//  MVVM+JSON
//
//  Created by Mac on 24/03/21.
//  Copyright © 2021 Vaishnavi Sasane. All rights reserved.
//

import Foundation
import UIKit

struct UserModel : Codable {
    var userId : Int?
    let id : Int?
    let title : String?
    let completed : Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case userId = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try values.decodeIfPresent(Int.self, forKey: .userId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        completed = try values.decodeIfPresent(Bool.self, forKey: .completed)
    }
    
    
    func getStatusAndColor() -> (String,UIColor) {
        return completed ?? true ? (Status.completed, UIColor.systemGreen) : (Status.not_Completed, UIColor.systemRed)
    }
    
    
    
}
