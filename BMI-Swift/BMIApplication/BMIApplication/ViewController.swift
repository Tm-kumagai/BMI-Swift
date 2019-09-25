//
//  ViewController.swift
//  BMIApplication
//
//  Created by cries on 2019/09/17.
//  Copyright © 2019年 cries. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var he_title: UILabel!
    @IBOutlet var he_unit: UILabel!
    @IBOutlet var we_title: UILabel!
    @IBOutlet weak var we_unit: UILabel!
    @IBAction func bmiButton(_ sender: UIButton) {
    }
    @IBOutlet weak var headerTitle: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title変更
        headerTitle.items![0].title = "入力"
        
        // 身長ラベル変更
        he_title.text = "身長"
        he_unit.text = "cm"
        
        // 体重ラベル変更
        we_title.text = "体重"
        we_unit.text = "kg"
        
    }


}

