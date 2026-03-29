import SwiftData
import Foundation

@Model
final class LoggedWorkout {
    var date: Date = Date()
    var name: String = "New Workout"  // Changed from programName? to name
    var totalVolume: Int = 0
    var notes: String?
    
    @Relationship var recoveryLog: RecoveryLog?
    @Relationship var foodLogs: [FoodLog] = []
    
    init(name: String = "New Workout", totalVolume: Int = 0) {
        self.date = Date()
        self.name = name
        self.totalVolume = totalVolume
    }
}
