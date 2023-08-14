//
//  NotificationName+Extensions.swift
//  Debt-App-9
//
//  Created by Nguyen Van Son on 08/07/2023.
//

import Foundation

extension Notification.Name {
    static let didUpdateDB = Notification.Name("didUpdateDB")
    static let fetchedValues = Notification.Name("fetchedValues")
    static let loginSuccess = Notification.Name("loginSuccess")
}
