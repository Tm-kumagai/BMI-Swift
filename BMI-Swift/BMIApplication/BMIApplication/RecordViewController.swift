//
//  RecordViewController.swift
//  BMIApplication
//
//  Created by t-kumagai on 2020/01/06.
//  Copyright © 2020 cries. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, TabBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerTitle: UINavigationBar!
    
    var oneBmiRecord = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // title変更
        headerTitle.items![0].title = "履歴"

        tableView.delegate = self //デリゲート指定
        tableView.dataSource = self //データソース指定
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        recordIntoCell() //viewWillAppearに書くことで追加後、前の画面に戻ってもすぐに更新がみれます。
        tableView.reloadData()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // BMI履歴をセルに入れる
    func recordIntoCell() {
        let viewController = ViewController()
        let formattedToday = viewController.dateFormat()
        let dateUserDefaults = UserDefaults.standard
        let dateList: [String] = dateUserDefaults.array(forKey: "dateArray") as! [String]
        let bmiUserDefaults = UserDefaults.standard
        let bmiRecord = bmiUserDefaults.array(forKey: formattedToday)
        
        print("ここからrecordIntoCell()")
        print("dateList = \(dateList)")
        print("bmiRecord = \(bmiRecord)")
        
        
        for i in dateList {
            print("dateList[i] = \(dateList)")
        }
        print("ここまでrecordIntoCell()")
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
    }

}
