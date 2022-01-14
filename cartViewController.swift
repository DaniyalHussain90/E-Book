//
//  cartViewController.swift
//  E-book
//
//  Created by Daniyal Hussain on 13/01/2022.
//

import UIKit

class cartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    var arr = [1]
    var imgView = UIImage()
    var label1 = ""
    var Label2 = ""
    var Label3 = ""
    var data = ""
    
    @IBOutlet weak var tableView6: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView6.dataSource = self
        tableView6.delegate = self
    
        
        let nibcell=UINib(nibName: "cartTableView", bundle: nil)
         tableView6.register(nibcell, forCellReuseIdentifier: "cartTableView")
        let nibcell1=UINib(nibName: "amountTableView", bundle: nil)
        tableView6.register(nibcell1, forCellReuseIdentifier: "amountTableView")
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView6.dequeueReusableCell(withIdentifier: "cartTableView", for: indexPath) as? cartTableView
        if indexPath.row == arr.count-1 {
        }else{
            let cell = tableView6.dequeueReusableCell(withIdentifier: "cartTableView", for: indexPath) as? cartTableView
            return cell!
            
        }
            
        cell?.imgView.image = imgView
        cell?.label1.text = label1
        cell?.label2.text = Label2
        cell?.label3.text = Label3
        return cell!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
   
}
