//
//  RecordViewController.swift
//  BMIApplication
//
//  Created by t-kumagai on 2020/01/06.
//  Copyright © 2020 cries. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let TODO = ["おおお！", "できてる！！", "じゃん！！！"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // セルの個数をカウント
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TODO.count
    }
    
    // セルに値を設定するデータソースメソッド
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let bmiRecordDateCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "bmiRecordDateCell", for: indexPath)
        // セルに表示する値を設定する
        bmiRecordDateCell.textLabel!.text = TODO[indexPath.row]
        return bmiRecordDateCell
    }

}
