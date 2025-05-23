//
//  ViewController.swift
//  GuessMyNumber
//
//  Created by HPro2 on 12/19/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = false
    }

    @IBAction func unwind(segue: UIStoryboardSegue) {
        self.navigationController?.navigationBar.isHidden = false
    }

}

