import SwiftData

@Model
final class SupplementLog {
    var name: String
    var brand: String?
    var defaultDosage: Double
    var dosageUnit: String
    var category: String        // "Pre-Workout", "Recovery", "Vitamin", etc.
    
    init(name: String, brand: String? = nil, defaultDosage: Double, dosageUnit: String, category: String) {
        self.name = name
        self.brand = brand
        self.defaultDosage = defaultDosage
        self.dosageUnit = dosageUnit
        self.category = category
    }
}
