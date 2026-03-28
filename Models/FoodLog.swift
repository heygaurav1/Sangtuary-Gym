import SwiftData
import Foundation

@Model
final class FoodLog {
    var date: Date = Date()
    var mealType: String = "Post-Workout"
    var foodName: String = ""
    var calories: Double = 0
    var protein: Double = 0
    var carbs: Double = 0
    var fat: Double = 0
    
    init() {}
}
