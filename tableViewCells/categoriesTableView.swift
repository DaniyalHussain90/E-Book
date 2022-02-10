//
//  categoriesTableView.swift
//  E-book
//
//  Created by Daniyal Hussain on 11/11/2021.
//

import UIKit

class categoriesTableView: UITableViewCell {
    @IBOutlet weak var profileImge: UIButton!
    
    var vc :cateVC?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func profileImge(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC") as? loginVC
        self.vc?.navigationController?.pushViewController(storyBoard!, animated: true)
}
    
}
