//
//  SettingsViewController.swift
//  面向协议架构实践ProtocolOrientedArchitecturePractices.
//
//  Created by DullDong on 2018/2/28.
//  Copyright © 2018年 DullDong. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {

    let testModel = [["白面葫芦娃*",true],
                     ["HuluWa*",false],
                     ["FiveMan*",true],
                     ["JustGang*",true],
                     ["InCludeBe*",false],
                     ["BaiDaXian*",true],
                     ["DaWangLou*",true],
                     ["QiShan*",true]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tableView.register(UINib.init(nibName: "SwitchWithTextTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testModel.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwitchWithTextTableViewCell
        let data = testModel[indexPath.row]
        var model = MinionModeViewModel()
        model.title = data.first as! String
        model.switchOn = data.last as! Bool
        model.switchisOn = { [weak self] isOn in
            guard let _ = self else { return }
            print("switch is \(isOn)",indexPath)
        }
        cell.config(withDelegate: model)
        return cell
    }

}
