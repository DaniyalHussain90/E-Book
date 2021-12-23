//
//  cateItem2.swift
//  E-book
//
//  Created by Daniyal Hussain on 11/11/2021.
//

import UIKit

class cateItem2: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
  
    @IBOutlet weak var cateCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cateCollection.dataSource = self
        cateCollection.delegate = self
        let nibcell=UINib(nibName: "cateCollection", bundle: nil)
        cateCollection.register(nibcell, forCellWithReuseIdentifier: "cateCollection")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cateCollection", for: indexPath) as? cateCollection
        if indexPath.row == 0{
            cell?.cateButton.setTitle("Research", for: .normal)
        }
        else if indexPath.row == 1 {
            cell?.cateButton.setTitle("WordPress", for: .normal)
        }
        else if indexPath.row == 2 {
            cell?.cateButton.setTitle("GoogleKey", for: .normal)
        }
        else if indexPath.row == 3 {
            cell?.cateButton.setTitle("EarthNews", for: .normal)
        }
        else if indexPath.row == 4 {
            cell?.cateButton.setTitle("Basic", for: .normal)
        }
        else if indexPath.row == 5 {
            cell?.cateButton.setTitle("Keyword", for: .normal)
        }
        return cell!
    }
    
}
