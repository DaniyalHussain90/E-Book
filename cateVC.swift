//
//  cateVC.swift
//  E-book
//
//  Created by Daniyal Hussain on 11/11/2021.
//

import UIKit
import Kingfisher
import SDWebImage

class cateVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data = [String]()
    var data1 = [String]()
    var data2 = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
      
    //    bookManager.shared.getAllBooksNameForm(limit: 0) { title, publisher  in
            
     //   }
        
        
        let nibcell=UINib(nibName: "categoriesTableView", bundle: nil)
        tableView.register(nibcell, forCellReuseIdentifier: "categoriesTableView")
       
        let nibcell1=UINib(nibName: "cateItem2", bundle: nil)
        tableView.register(nibcell1, forCellReuseIdentifier: "cateItem2")
        let nibcell2=UINib(nibName: "cate3", bundle: nil)
        tableView.register(nibcell2, forCellReuseIdentifier: "cate3")
        let nibcell3=UINib(nibName: "cate4", bundle: nil)
        tableView.register(nibcell3, forCellReuseIdentifier: "cate4")
            
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "categoriesTableView",for: indexPath) as? categoriesTableView
            
            
            cell?.vc = self
         

          return cell!

        }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cateItem2",for: indexPath) as? cateItem2
            return cell!
        }
        else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cate3",for: indexPath) as? cate3
            cell?.viewcontroller = self
         //   cell!.imageCollection.addTarget(self, action: #selector(imageCollection), for: .touchUpInside)}

            return cell!
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cate4",for: indexPath) as? cate4
           
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100

        }
        else if indexPath.row == 1{
            return 125
        }
        else if indexPath.row == 2{
            return 270
        }
        else
           {
                return 280
            }
        }
    @objc func imageCollection  (sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "readingVC") as! readingVC
        self.navigationController?.pushViewController(myvc, animated: true)
    }
    
    @objc func loginTableview  (sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "loginVC") as! loginVC
        self.navigationController?.pushViewController(myvc, animated: true)
    }
    
    
  //  @objc func loginTableview  (sender: UIButton){
      
   // }

}
