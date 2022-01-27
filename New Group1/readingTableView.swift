//
//  readingTableView.swift
//  E-book
//
//  Created by Daniyal Hussain on 15/11/2021.
//

import UIKit
import SDWebImage
import Cosmos
import SwiftUI
import ASPVideoPlayer

class readingTableView: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    var data = [String]()
    var data1 = [String]()
    var data2 = [String]()
    var country = [String]()
    @IBOutlet weak var lable1: UILabel!
    @IBOutlet weak var lable2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var imgeReading: UIImageView!
    @IBOutlet weak var detailButton: UIButton!
    var viewcontroller = readingVC()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var videoPlayer: ASPVideoPlayer!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
        
        collectionView.dataSource = self
        collectionView.delegate = self
        bookManager.shared.getAllBooksImageForm(limit: 0) { Image,title,publisher,country in
           // self.data.removeAll()
          
         //   bookManager.shared.getAllBooksNameForm(limit: 0) { title, publisher  in
             //   self.data1
             //   self.data2
                self.data = Image
             //   self.imgeReading
            //    self.collectionView.reloadData()
               self.data1 = title
                self.data2 = publisher
            self.country = country
                self.collectionView.reloadData()
        //    }
            
          
        }
       
      
   
        
        let nibcell=UINib(nibName: "itemCollection", bundle: nil)
         collectionView.register(nibcell, forCellWithReuseIdentifier:"itemCollection")

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }      // Configure the view for the selected state
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return data.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollection", for: indexPath) as? itemCollection
            let url = URL(string: self.data[indexPath.row])
            cell!.picView.sd_setImage(with:url)
            cell?.name1.text = data1[indexPath.row]
            cell?.name2.text = data2[indexPath.row]
         
                return cell!
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "readingVC") as! readingVC
        let url = URL(string: self.data[indexPath.row])
        myvc.url = self.data[indexPath.row]
        myvc.lable1 = data1[indexPath.row]
        myvc.lable2 = data2[indexPath.row]
        myvc.label3 = country[indexPath.row]
        self.viewcontroller.navigationController?.pushViewController(myvc, animated: true)
        
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
    }
     
    @IBAction func detailButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        myvc.image = imgeReading.image!
        myvc.blueLabel = lable1.text!
        myvc.blueLabel1 = lable2.text!
        myvc.blueLabel3 = label3.text!
        self.viewcontroller.navigationController?.pushViewController(myvc, animated: true)
        
}
    }
