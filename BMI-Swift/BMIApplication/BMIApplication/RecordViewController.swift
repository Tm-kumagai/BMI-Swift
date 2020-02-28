//
//  RecordViewController.swift
//  BMIApplication
//
//  Created by t-kumagai on 2020/01/06.
//  Copyright © 2020 cries. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var headerTitle: UINavigationBar!
    
    var TODO = [""]
    
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
        
        let record = bmiRecordValue.string(forKey: formattedToday) as! String
        TODO = [record]
    }
    
    // セルの個数をカウント
    func cellCount(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recordIntoCell()
        return TODO.count
    }
    
    // セルに値を設定するデータソースメソッド
    internal func dataSetOfCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        recordIntoCell()
        // セルを取得する
        let bmiRecordDateCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "bmiRecordDateCell", for: indexPath)
        // セルに表示する値を設定する
        bmiRecordDateCell.textLabel!.text = TODO[indexPath.row]
        return bmiRecordDateCell
    }

}
