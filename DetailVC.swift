//
//  DetailVC.swift
//  E-book
//
//  Created by Daniyal Hussain on 18/11/2021.
//

import UIKit
class DetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var image = UIImage()
    var blueLabel = ""
    var blueLabel1 = ""
    
    @IBOutlet weak var tableView3: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView3.dataSource = self
        tableView3.dataSource = self
        
        
       let nibcell=UINib(nibName: "detailTableview", bundle: nil)
       tableView3.register(nibcell, forCellReuseIdentifier: "detailTableview")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailTableview",for: indexPath) as? detailTableview
        cell?.imgView2.image = image
        cell?.blueLabel.text = blueLabel
        cell?.blueLabel1.text = blueLabel1
        return cell!
    }
    
  
}
