//import SwiftUI
//import SwiftData
//
//@main
//struct meGYMApp: App {
//    // Logic to control the flow
//    @State private var showSplash = true
//    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
//    
//    var body: some Scene {
//        WindowGroup {
//            ZStack {
//                if showSplash {
//                    SplashVideoView(isFinished: $showSplash)
//                        .transition(AnyTransition.opacity) // Added AnyTransition here
//                } else if !hasCompletedOnboarding {
//                    OnboardingFlowView()
//                        .transition(AnyTransition.move(edge: .trailing)) // Added AnyTransition here
//                } else {
//                    ContentView()
//                        .transition(AnyTransition.opacity) // Added AnyTransition here
//                }
//            }
//            .animation(.easeInOut(duration: 0.8), value: showSplash)
//            .animation(.easeInOut(duration: 0.8), value: hasCompletedOnboarding)
//            .preferredColorScheme(.dark) // Best for iPhone 17 Pro OLED
//        }
//        // This connects your database to the whole app
//        .modelContainer(for: [
//            RecoveryLog.self,
//            LoggedWorkout.self,
//            Supplement.self,
//            SupplementLog.self
//        ])
//    }
//}

import SwiftUI
import SwiftData

@main
struct meGYMApp: App {
    @State private var showSplash = true
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    
    var body: some Scene {
        WindowGroup {
            Group {
                if showSplash {
                    // This is likely where the lag is. We add an auto-fail timer.
                    SplashVideoView(isFinished: $showSplash)
                        .onAppear {
                            // If the video doesn't play in 3 seconds, force enter the app
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    showSplash = false
                                }
                            }
                        }
                } else if !hasCompletedOnboarding {
                    OnboardingFlowView()
                } else {
                    ContentView()
                }
            }
            .preferredColorScheme(.dark)
        }
        .modelContainer(for: [
            LoggedWorkout.self,
            RecoveryLog.self,
            Supplement.self,
            SupplementLog.self
        ])
    }
}
