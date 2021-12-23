//
//  ViewController.swift
//  E-book
//
//  Created by Daniyal Hussain on 09/11/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func startButton(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "cateVC") as! cateVC
        self.navigationController?.pushViewController(myvc, animated: true)

    }
}

