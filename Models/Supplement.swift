import SwiftData

@Model
final class Supplement {
    var name: String
    var category: String
    
    init(name: String, category: String) {
        self.name = name
        self.category = category
    }
}
