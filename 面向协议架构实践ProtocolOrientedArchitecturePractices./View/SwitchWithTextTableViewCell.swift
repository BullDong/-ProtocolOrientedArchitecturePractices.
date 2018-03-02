//
//  SwitchWithTextTableViewCell.swift
//  面向协议架构实践ProtocolOrientedArchitecturePractices.
//
//  Created by DullDong on 2018/2/28.
//  Copyright © 2018年 DullDong. All rights reserved.
//

import UIKit

protocol SwitchWithTextProtocol {
    var title: String { get }
    var switchOn: Bool { get }
    
    func switchToggle(isOn: Bool)
}

extension SwitchWithTextProtocol {
    func switchColor() -> UIColor {
        return .yellow
    }
}

class SwitchWithTextTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var switchToggle: UISwitch!
    
    private var delegate: SwitchWithTextProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(withDelegate delegate: SwitchWithTextProtocol) {
        self.delegate = delegate
        self.label.text = delegate.title
        self.switchToggle.isOn = delegate.switchOn
        self.switchToggle.tintColor = delegate.switchColor()
    }
    
    @IBAction func clickSwitch(_ sender: Any) {
        self.delegate?.switchToggle(isOn: self.switchToggle.isOn)
    }
}
