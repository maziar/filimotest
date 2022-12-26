//
//  BaseViewModel.swift
//  FilimoTest
//
//  Created by Maziar Saadatfar on 12/24/22.
//

import Foundation
import UIKit

protocol PullToRefreshDelegate: AnyObject {
    func finish()
}

extension PullToRefreshDelegate {
    func finish() {}
}

public class BaseViewModel {
    weak var pullToRefreshDelegate: PullToRefreshDelegate?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let defaults = UserDefaults.standard
    
    func checkRepeatRequest(lastdate: Date?) -> Bool {
        guard let ldate = lastdate else {
            return false
        }
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let lhour = calendar.component(.hour, from: ldate)
        let lminutes = calendar.component(.minute, from: ldate)
        let lsecond = calendar.component(.second, from: ldate)
        
        if (hour == lhour && lminutes == minutes) {
            if (second - lsecond <= 1) {
                return true
            }
        }
        return false
    }
}
