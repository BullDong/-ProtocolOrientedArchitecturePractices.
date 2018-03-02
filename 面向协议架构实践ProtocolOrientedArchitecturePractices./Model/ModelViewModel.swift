//
//  ModelViewModel.swift
//  面向协议架构实践ProtocolOrientedArchitecturePractices.
//
//  Created by DullDong on 2018/2/28.
//  Copyright © 2018年 DullDong. All rights reserved.
//

import UIKit

struct MinionModeViewModel: SwitchWithTextProtocol {
    
    public var switchisOn: ( (Bool) -> Void )?
    
    var title = "Test Model !!!"
    var switchOn = true
    func switchToggle(isOn: Bool) {
        if isOn {
            print("switch is Selected")
        }else {
            print("unselected Switch")
        }
        switchisOn?(isOn)
    }
    func switchColor() -> UIColor {
        return .green
    }
}
