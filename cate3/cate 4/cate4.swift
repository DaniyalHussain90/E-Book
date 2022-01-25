//
//  cate4.swift
//  E-book
//
//  Created by Daniyal Hussain on 11/11/2021.
//

import UIKit

class cate4: UITableViewCell {
    
    var data = [String]()
    var data1 = [String]()
    var data2 = [String]()
    @IBOutlet weak var picView2: UIImageView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var redLabel1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        bookManager.shared.getAllBooksImageForm(limit: 0) { image,title,publisher,Country in
            self.data = image
            self.data1 = title
            self.data2 = publisher
            let randomInt = title.count-1
            let url = URL(string: self.data[randomInt])
            self.redLabel.text = self.data1[randomInt]
            self.redLabel1.text = self.data2[randomInt]
            self.picView2.sd_setImage(with:url)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
