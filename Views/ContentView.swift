import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem { Label("Dashboard", systemImage: "house.fill") }
            
            Text("Training")
                .tabItem { Label("Train", systemImage: "dumbbell.fill") }
            
            Text("Nutrition")
                .tabItem { Label("Nutrition", systemImage: "fork.knife") }
            
            Text("Progress")
                .tabItem { Label("Progress", systemImage: "chart.bar.fill") }
        }
    }
}

struct DashboardView: View {
    var body: some View { 
        Text("Dashboard Working")
            .font(.title)
    }
}
