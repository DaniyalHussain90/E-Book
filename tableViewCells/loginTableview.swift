//
//  loginTableview.swift
//  E-book
//
//  Created by Daniyal Hussain on 22/11/2021.
//

import UIKit

class loginTableview: UITableViewCell {
    @IBOutlet weak var imgeVIew1: UIImageView!
    @IBOutlet weak var textView1: UITextField!
    @IBOutlet weak var textView2: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    var viewController = loginVC()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
