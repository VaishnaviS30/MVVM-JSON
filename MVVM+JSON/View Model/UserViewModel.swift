//
//  UserViewModel.swift
//  MVVM+JSON
//
//  Created by Mac on 24/03/21.
//  Copyright © 2021 Vaishnavi Sasane. All rights reserved.
//

import UIKit
import Alamofire

class UserViewModel {
    
    var arrUsers = [UserModel]()
    
    weak var vc: ViewController?
    
    func getAllUsersDataByAF()  {
        AF.request(URLs.userDetails).response {
            response in
            if let data = response.data {
                do {
                    let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                    
                    //Adding usermodel one by one
                    
                    /*for userModel in userResponse {
                     self.arrUsers.append(userModel)
                     }
                     debugPrint(self.arrUsers)
                     */
                    
                    //Addind userModel array at one time
                    
                    self.arrUsers.append(contentsOf: userResponse)
                    
                    DispatchQueue.main.async {
                        self.vc?.tblView.reloadData()
                    }
                } catch let err {
                    debugPrint(err.localizedDescription)
                }
            }
        }
    }
    
    
    
    func getAllUsersData()  {
        URLSession.shared.dataTask(with: URL(string: URLs.userDetails)!) { (data, response, error) in
            if error == nil {
                if let data = data {
                    do {
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)

                        //Adding usermodel one by one
                        
                        /*for userModel in userResponse {
                         self.arrUsers.append(userModel)
                         }
                         debugPrint(self.arrUsers)
                         */
                        
                        //Addind userModel array at one time
                        
                        self.arrUsers.append(contentsOf: userResponse)
                        
                        DispatchQueue.main.async {
                            self.vc?.tblView.reloadData()
                        }
                        
                    } catch let err {
                        debugPrint(err.localizedDescription )
                    }
                }
            }
        }.resume()
    }
}



