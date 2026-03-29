import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // 1. DASHBOARD
            NavigationStack {
                DashboardView()
            }
            .tabItem {
                Label("Dashboard", systemImage: "house.fill")
            }
            
            // 2. TRAINING
            NavigationStack {
                TrainingView()
            }
            .tabItem {
                Label("Train", systemImage: "dumbbell.fill")
            }
            
            // 3. NUTRITION
            NavigationStack {
                NutritionView() // Removed the '1'
            }
            .tabItem {
                Label("Nutrition", systemImage: "fork.knife")
            }
            
            // 4. PROGRESS
            NavigationStack {
                FitnessProgressView() // Removed the '1'
            }
            .tabItem {
                Label("Progress", systemImage: "chart.bar.fill")
            }
        }
        .accentColor(.green)
    }
}
