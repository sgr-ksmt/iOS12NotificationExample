//
//  NotificationViewController.swift
//  CustomNotificationUI
//
//  Created by suguru-kishimoto on 2018/06/20.
//  Copyright © 2018年 suguru-kishimoto. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class NotificationViewController: UIViewController, UNNotificationContentExtension {

    @IBOutlet private weak var label: UILabel!
    private var count: Int = 1 {
        didSet {
            updateLabel()
            updateActions()
        }
    }

    private struct CustomAction {
        static let add1 = UNNotificationAction(identifier: "add_1", title: "Add 🍣", options: [])
        static let add10 = UNNotificationAction(identifier: "add_10", title: "Add 🍣x10", options: [])
        static let clearAll = UNNotificationAction(identifier: "clear_all", title: "Clear All", options: [.destructive])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any required interface initialization here.
    }
    
    func didReceive(_ notification: UNNotification) {
        updateLabel()
        updateActions()
    }

    private func updateLabel() {
        self.label.text = Array(repeating: "🍣", count: count).joined()
    }

    private func updateActions() {
        if count == 0 {
            extensionContext?.notificationActions = [
                CustomAction.add1,
                CustomAction.add10,
            ]
        } else {
            extensionContext?.notificationActions = [
                CustomAction.add1,
                CustomAction.add10,
                CustomAction.clearAll,
            ]
        }
    }

    @IBAction func addButtonDidTap(_: UIButton) {
        count += 1
    }

    @IBAction func openApp(_: UIButton) {
        extensionContext?.performNotificationDefaultAction()
    }

    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        switch response.actionIdentifier {
        case CustomAction.add1.identifier:
            count += 1
        case CustomAction.add10.identifier:
            count += 10
        case CustomAction.clearAll.identifier:
            count = 0
        default:
            break
        }
        completion(.doNotDismiss)
    }
}
