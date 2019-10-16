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
        
        // キーボード設定
        he_input.keyboardType = UIKeyboardType.numberPad
        we_input.keyboardType = UIKeyboardType.numberPad
        
        // bmi計算ボタンテキスト変更
        bmiButtonText.setTitle("BMIを計算する", for: .normal)
        
        // bmi結果テキスト変更
        let space = "   "
        bmiResult.text = "あなたのBMIは　\(space)　でした"
    }
    
    // bmiボタンタップ処理
    @IBAction func bmiButtonTap(_ sender: UIButton) {
        //入力値がどちらか一方でも空の場合
        if he_input.text!.isEmpty || we_input.text!.isEmpty {
            return
        }
        // bmi計算
        let he_str = Double(he_input.text!)!
        let we_str = Double(we_input.text!)!
        let doubleBmi = we_str / (he_str / 100 * he_str / 100)
        let bmiScore = round(doubleBmi * 10) / 10
        // bmi結果テキスト変更
        bmiResult.text = "あなたのBMIは　\(bmiScore)　でした"
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
