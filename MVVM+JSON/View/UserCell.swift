//
//  UserCell.swift
//  MVVM+JSON
//
//  Created by Mac on 24/03/21.
//  Copyright © 2021 Vaishnavi Sasane. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    
    var modelUser: UserModel? {
        didSet {
            userConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func userConfiguration()  {
        let status = modelUser?.getStatusAndColor()
        lblID.text = "\(modelUser?.id ?? 0)"
        lblTitle.text = modelUser?.title
        lblStatus.text = status?.0
        lblStatus.textColor = status?.1
    }
}
