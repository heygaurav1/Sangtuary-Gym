import SwiftData
import Foundation

@Model
final class LoggedWorkout {
    var date: Date = Date()
    var programName: String?
    var totalVolume: Int = 0
    var notes: String?
    
    @Relationship var recoveryLog: RecoveryLog?
    @Relationship var foodLogs: [FoodLog] = []
    
    init(totalVolume: Int = 0) {
        self.totalVolume = totalVolume
    }
}
