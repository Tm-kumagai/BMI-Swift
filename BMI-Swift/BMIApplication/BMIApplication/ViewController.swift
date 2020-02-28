//
//  ViewController.swift
//  BMIApplication
//
//  Created by t-kumagai on 2019/09/17.
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
    @IBOutlet weak var iiwake_input: UITextView!
    
    
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
        he_input.keyboardType = UIKeyboardType.decimalPad
        we_input.keyboardType = UIKeyboardType.decimalPad
        
        // bmi計算ボタンテキスト変更
        bmiButtonText.setTitle("BMIを計算する", for: .normal)
        
        // bmi結果テキスト変更
        let space = "   "
        bmiResult.text = "あなたのBMIは　\(space)　でした"
    }
    
    var dateRecordList: [String] = []
    
    // 今日の日付フォーマット処理
    func dateFormat() -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .short
        dateFormat.timeStyle = .none
        let formattedToday = dateFormat.string(from: Date())
        return formattedToday
    }
    
    // bmiボタンタップ処理
    @IBAction func bmiButtonTap(_ sender: UIButton) {
        // 入力値がどちらか一方でも空の場合
        if he_input.text!.isEmpty || we_input.text!.isEmpty {
            
            // 空入力時にダイアログ表示
            let emptyInputDialog = UIAlertController(title: "身長・体重が未入力", message: "2つとも入力してから計算してください", preferredStyle: .alert)
            emptyInputDialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(emptyInputDialog, animated: true, completion: nil)
            
            return
        }
        
        // 入力値の変換
        let he_double = Double(he_input.text!) ?? 0.0
        let we_double = Double(we_input.text!) ?? 0.0
        
        // 入力値が変換できない時
        if he_double  == 0.0 || we_double == 0.0 {
            
            // 入力値が間違い時にダイアログ表示
            let wrongInputDialog = UIAlertController(title: "入力値が間違っています", message: "正しい値を入力してください", preferredStyle: .alert)
            wrongInputDialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(wrongInputDialog, animated: true, completion: nil)
            
            return
        }
        
        // bmi計算
        let doubleBmi = we_double / (he_double / 100 * he_double / 100)
        let bmiCalcResult = round(doubleBmi * 10) / 10
        // bmi結果テキスト変更
        bmiResult.text = "あなたのBMIは　\(bmiCalcResult)　でした"
        // bmi保存用変数
        let bmiRecordValue = UserDefaults.standard
        
        // 今日の日付フォーマット処理呼び出し
        let formattedToday = dateFormat()
        
        // 日付保存用変数
        if dateRecordList == [] {
            dateRecordList = [formattedToday]
        }
        if let firstIndex = dateRecordList.index(of: "\(formattedToday)") {
            print("あるよ")
        } else {
            print("ないよ")
            dateRecordList.append(formattedToday)
        }
        
        // bmi保存処理
        bmiRecordValue.set(bmiCalcResult, forKey: formattedToday)
        // bmi取り出し処理
        if let isBmiRecord = bmiRecordValue.string(forKey: formattedToday) {
            print("key=\(formattedToday), 身長=\(he_double), 体重=\(we_double), BMI=\(isBmiRecord)")
            print("\(dateRecordList)")
        }
        
        let recordViewController = RecordViewController()
    }
    
    // キーボードクローズ処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 身長
        if (self.he_input.isFirstResponder) {
            self.he_input.resignFirstResponder()
        }
        // 体重
        if (self.we_input.isFirstResponder) {
            self.we_input.resignFirstResponder()
        }
        // 言い訳
        if (self.iiwake_input.isFirstResponder) {
            self.iiwake_input.resignFirstResponder()
        }
    }
    
}
