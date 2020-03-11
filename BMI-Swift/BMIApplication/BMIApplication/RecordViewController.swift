//
//  RecordViewController.swift
//  BMIApplication
//
//  Created by t-kumagai on 2020/01/06.
//  Copyright © 2020 cries. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TabBarDelegate {
    
    @IBOutlet weak var headerTitle: UINavigationBar!
    
    var oneBmiRecord = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title変更
        headerTitle.items![0].title = "履歴"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // BMI履歴をセルに入れる
    func recordIntoCell() {
        let bmiRecordValue = UserDefaults.standard
        let viewController = ViewController()
        let formattedToday = viewController.dateFormat()
        let dateList = viewController.dateList(formattedToday: formattedToday)
        print(dateList)
        
        for _ in dateList {
            var i = 0
            if let isBmiRecord = bmiRecordValue.array(forKey: dateList[i]) {
                print("\(dateList[i])")
                print("isBmiRecord = \(isBmiRecord)")
            
                oneBmiRecord = ["\(isBmiRecord)"]
                oneBmiRecord.append("\(isBmiRecord)")
                i = i + 1
                print(i)
            }
        }
    }
    
    // セルの個数をカウント
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recordIntoCell()
        return oneBmiRecord.count
    }
    
    // セルに値を設定するデータソースメソッド
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        recordIntoCell()
        // セルを取得する
        let bmiRecordDateCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "bmiRecordDateCell", for: indexPath)
        // セルに表示する値を設定する
        bmiRecordDateCell.textLabel!.text = oneBmiRecord[indexPath.row]
        return bmiRecordDateCell
    }
    
    func didSelectTab(tabBarController: TabBarController) {
        // ここで呼ばれた時の処理かく
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            recordIntoCell()
            // セルを取得する
            let bmiRecordDateCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "bmiRecordDateCell", for: indexPath)
            // セルに表示する値を設定する
            bmiRecordDateCell.textLabel!.text = oneBmiRecord[indexPath.row]
            return bmiRecordDateCell
        }
    }

}
