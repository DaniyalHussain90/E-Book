//
//  cate3.swift
//  E-book
//
//  Created by Daniyal Hussain on 11/11/2021.
//

import UIKit
import SDWebImage
import Kingfisher
import SwiftUI
class cate3: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    let spinner = UIActivityIndicatorView()
    var data = [String]()
    var data1 = [String]()
    var data2 = [String]()
    var country = [String]()
 //   var it = [data?.items]

    @IBOutlet weak var imageCollection: UICollectionView!
    var viewcontroller = cateVC()
    //let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//    let myvc = storyBoard.instantiateViewController(withIdentifier: "readingVC") as! readingVC
//    self.navigationController?.pushViewController(myvc, animated: true)

    override func awakeFromNib() {
        super.awakeFromNib()
        imageCollection.dataSource = self
        imageCollection.delegate = self
        let nibcell=UINib(nibName: "itemCollection", bundle: nil)
         imageCollection.register(nibcell, forCellWithReuseIdentifier:"itemCollection")
        bookManager.shared.getAllBooksImageForm(limit: 0) { Image,Title,publisher, country in
           
            self.data = Image
            self.data1 = Title
            self.data2 = publisher
            self.country = country
       
            self.imageCollection.reloadData()
            
        }
        
  //    bookManager.shared.getAllBooksNameForm(limit: 0) { title, publisher  in
   //         self.data1
   //         self.data2
           // self.data1 = title
           // self.data2 = publisher
     //       self.imageCollection.reloadData()
    //   }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return (data.count)
       
   }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollection", for: indexPath) as? itemCollection
        
      
        let url = URL(string: self.data[indexPath.row])
 //      let processor = DownsamplingImageProcessor(size: (cell?.picView.bounds.size)!)
//        cell.picView.kf.setImage(with: url, placeholder: UIImage(named: "sample"),
//                                                  options: [
//                                                    .processor(processor),
//                                                    .scaleFactor(UIScreen.main.scale),
//                                                    .transition(.fade(1)),
//                                                    .cacheOriginalImage
//                                                  ])
        
        cell!.picView.sd_setImage(with:url)
        cell?.name1.text = data1 [indexPath.row]
        cell?.name2.text = data2 [indexPath.row]
//            .setImage(with: url, placeholder: UIImage(named: "sample"), options: [
//            .processor(processor),
//            .scaleFactor(UIScreen.main.scale),
//            .transition(.fade(1)),
//            .cacheOriginalImage
//          ], completionHandler: nil)
            return cell!
    

}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "readingVC") as! readingVC
        let url = URL(string: self.data[indexPath.row])
        myvc.url = self.data[indexPath.row]
        myvc.lable1 = data1[indexPath.row]
        myvc.lable2 = data2[indexPath.row]
        myvc.country = country[indexPath.row]
        self.viewcontroller.navigationController?.pushViewController(myvc, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
    }
    
}


