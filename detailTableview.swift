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
    @IBOutlet weak var addCart: UIButton!
    @IBOutlet weak var label: UILabel!
    var count = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    @IBAction func plusButton(_ sender: Any) {
        
        count = count + 1
        label.text = "\(count)"
    }
    @IBAction func minusButton(_ sender: Any) {
        count = count - 1
        label.text = "\(count)"
        
        
    }
    @IBAction func addCartbutton(_ sender: Any) {
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
