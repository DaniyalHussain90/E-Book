//
//  readingVC.swift
//  E-book
//
//  Created by Daniyal Hussain on 15/11/2021.
//

import UIKit
import Kingfisher
import SDWebImage
import SwiftUI
class readingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var tableView2: UITableView!
   
    
    var lable1 = ""
    var lable2 = ""
    var url = ""
    var data = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView2.dataSource = self
        tableView2.dataSource = self
        bookManager.shared.getAllBooksImageForm(limit: 0) { Image, title, Publisher in
       
        }
        
         
        let nibcell=UINib(nibName: "readingTableView", bundle: nil)
        tableView2.register(nibcell, forCellReuseIdentifier: "readingTableView")
       

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "readingTableView",for: indexPath) as? readingTableView
        cell!.imgeReading.sd_setImage(with:URL(string: self.url))
        cell?.lable1.text = self.lable1
        cell?.lable2.text = self.lable2
        
        cell?.viewcontroller = self
            return cell!
    }
    
  
}