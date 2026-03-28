import SwiftData
import Foundation

@Model
final class DailyNutritionSummary {
    var date: Date = Date()
    var totalCalories: Double = 0
    var totalProtein: Double = 0
    
    init() {}
}
