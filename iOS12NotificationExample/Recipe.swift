import Foundation

struct Recipe {
    let id: Int64
    let title: String


    static let all: [Recipe] = [
        .init(id: 44139873, title: "簡単！ふわとろオムライス"),
        .init(id: 94872134, title: "キャベツの胡麻和え"),
        .init(id: 57108937, title: "ズッキーニの磯辺揚げ"),
        .init(id: 10237864, title: "豚ひき肉と茄子の大葉味噌炒め"),
    ]
}
