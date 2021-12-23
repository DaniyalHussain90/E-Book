//
//  detailTableview.swift
//  E-book
//
//  Created by Daniyal Hussain on 18/11/2021.
//

import UIKit
class detailTableview: UITableViewCell {
 
    
    var data = [String]()
    var data1 = [String]()
    var data2 = [String]()
    
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var blueLabel1: UILabel!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
