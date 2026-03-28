
import SwiftUI
import SwiftData

@main
struct meGYMApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [
            RecoveryLog.self,
            LoggedWorkout.self,
            Supplement.self,
            SupplementLog.self
        ])
    }
}
