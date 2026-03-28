import Foundation
import HealthKit

actor RecoveryService {
    private let healthStore = HKHealthStore()
    
    func requestAuthorization() async throws {
        let typesToRead: Set<HKObjectType> = [
            HKQuantityType.quantityType(forIdentifier: .heartRateVariabilitySDNN)!,
            HKQuantityType.quantityType(forIdentifier: .restingHeartRate)!,
            HKCategoryType.categoryType(forIdentifier: .sleepAnalysis)!
        ]
        try await healthStore.requestAuthorization(toShare: [], read: typesToRead)
    }
    
    // Fetch last night's data and create RecoveryLog
    func fetchLastNightRecovery() async throws -> RecoveryLog {
        // In real implementation: use HKSampleQuery / HKStatisticsQuery for sleep, HRV, RHR
        // For now returning a template - replace with actual queries
        let log = RecoveryLog()
        // Populate from HealthKit queries here
        return log
    }
    
    func saveRecoveryLog(_ log: RecoveryLog) async {
        // Save to SwiftData context (call from ViewModel)
    }
}
