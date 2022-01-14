//
//  cartTableView.swift
//  E-book
//
//  Created by Daniyal Hussain on 13/01/2022.
//

import UIKit

class cartTableView: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
