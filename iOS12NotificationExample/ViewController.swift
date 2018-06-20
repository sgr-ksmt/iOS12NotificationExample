import UIKit
import UserNotifications

class ViewController: UIViewController {

    private lazy var center = UNUserNotificationCenter.current()
    override func viewDidLoad() {
        super.viewDidLoad()
        center.requestAuthorization(options: [.alert, .badge, .sound, .provisional, .providesAppNotificationSettings]) { (granted, error) in
            print(granted, error as Any)
        }
    }

    @IBAction func demo1DidTap(_: UIButton) {
        Recipe.all
            .compactMap { recipe -> [UNNotificationRequest] in
                var requests = [UNNotificationRequest]()
                let type = NotificationType(rawValue: (0...1).randomElement()!)!
                (0..<(2..<5).randomElement()!).forEach { _ in
                    requests.append(NotificationBuilder.buildRecipeNotification(with: recipe, type: type, interval: TimeInterval.init((5...10).randomElement()!)))
                }
                return requests
            }
            .joined()
            .forEach { center.add($0) }

        center.add(NotificationBuilder.buildInformationNotification(interval: 5.0))
    }

    @IBAction func demo2DidTap(_: UIButton) {
        center.add(NotificationBuilder.buildCustomUINotification(interval: 5.0))
    }

    @IBAction func clearDidTap(_: UIButton) {
        center.removeAllDeliveredNotifications()
        center.removeAllPendingNotificationRequests()
    }
}
