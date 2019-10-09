//
//  ViewController.swift
//  BMIApplication
//
//  Created by cries on 2019/09/17.
//  Copyright © 2019年 cries. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // 身長Outlet接続
    @IBOutlet weak var he_title: UILabel!
    @IBOutlet weak var he_input: UITextField!
    @IBOutlet weak var he_unit: UILabel!
    // 体重Outlet接続
    @IBOutlet weak var we_title: UILabel!
    @IBOutlet weak var we_input: UITextField!
    @IBOutlet weak var we_unit: UILabel!
    // BMIボタンまわりのOutlet接続
    @IBOutlet weak var bmiButtonText: UIButton!
    @IBOutlet weak var bmiResult: UILabel!
     var he_str = "   "
    // その他Outlet接続
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
        
        // bmi計算ボタンテキスト変更
        bmiButtonText.setTitle("BMIを計算する", for: .normal)
        
        // bmi計算結果変更
        bmiResult.text = "あなたのBMIは\(he_str)でした"
    }
    
    // bmiボタンタップ処理
    @IBAction func bmiButtonTap(_ sender: UIButton) {
        he_str = he_input.text!
        // bmi計算結果変更
        bmiResult.text = "あなたのBMIは\(he_str)でした"
    }
    
    // キーボードクローズ処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.he_input.isFirstResponder) {
            self.he_input.resignFirstResponder()
        }
        if (self.we_input.isFirstResponder) {
            self.we_input.resignFirstResponder()
        }
    }
    
}
