import Foundation
import UserNotifications

struct NotificationBuilder {
    static func buildRecipeNotification(with recipe: Recipe, type: NotificationType, interval: TimeInterval) -> UNNotificationRequest {
        let content = UNMutableNotificationContent()
        switch type {
        case .tsukurepo:
            content.title = "つくれぽが届きました！"
            content.body = "あなたが作ったレシピ「\(recipe.title)」につくれぽが届きました！"
        case .tsukurepoComment:
            content.title = "つくれぽにコメントがつきました！"
            content.body = "あなたが「\(recipe.title)」のレシピに送ったつくれぽにコメントがつきました！"
        }
        content.threadIdentifier = "recipe_\(recipe.id)"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        return request
    }

    static func buildInformationNotification(interval: TimeInterval) -> UNNotificationRequest {
        let content = UNMutableNotificationContent()
        content.title = "お知らせ"
        content.body = "アプリから大事なお知らせがあります。"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        return request
    }

    static func buildCustomUINotification(interval: TimeInterval) -> UNNotificationRequest {
        let content = UNMutableNotificationContent()
        content.title = "お知らせ"
        content.body = "🍣が増殖中...ざわ...ざわ..."
        content.categoryIdentifier = "customUI"
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        return request
    }
}
