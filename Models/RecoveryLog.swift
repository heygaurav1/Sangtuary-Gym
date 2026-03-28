import SwiftData
import Foundation

@Model
final class RecoveryLog {
    var date: Date
    
    var sleepDuration: Double?
    var deepSleepMinutes: Double = 0
    var remSleepMinutes: Double = 0
    var sleepEfficiency: Double?
    var hrvSDNN: Double?
    var restingHeartRate: Double?
    
    var overallSoreness: Int = 3
    var fatigueLevel: Int = 3
    var readinessRating: Int = 5
    var notes: String?
    
    @Relationship var previousWorkout: LoggedWorkout?
    
    var recoveryScore: Int {
        let sleep = Int((sleepDuration ?? 7) * 12)
        let soreness = (6 - overallSoreness) * 8
        let readiness = readinessRating * 6
        return min(100, max(0, sleep + soreness + readiness))
    }
    
    var overallSleepInsight: String {
        recoveryScore >= 80 ? "Good Recovery — Train normally" : "Fair Recovery — Consider lighter session"
    }
    
    init(date: Date = Date(), sleepDuration: Double? = 7.5, hrvSDNN: Double? = 65, overallSoreness: Int = 2, readinessRating: Int = 8) {
        self.date = date
        self.sleepDuration = sleepDuration
        self.hrvSDNN = hrvSDNN
        self.overallSoreness = overallSoreness
        self.readinessRating = readinessRating
    }
}
