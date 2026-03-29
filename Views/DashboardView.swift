import SwiftUI

// FIXED: Removed the "1" from the name so it matches ContentView
struct DashboardView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Welcome Header
                HStack {
                    VStack(alignment: .leading) {
                        Text("Welcome Back,")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("Sanctuary Member")
                            .font(.largeTitle.bold())
                    }
                    Spacer()
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding(.horizontal)

                // Today's Status Card
                VStack(spacing: 15) {
                    HStack {
                        StatusCard(title: "Calories", value: "2,400", icon: "flame.fill", color: .orange)
                        StatusCard(title: "Protein", value: "160g", icon: "leaf.fill", color: .green)
                    }
                    HStack {
                        StatusCard(title: "Recovery", value: "85%", icon: "bolt.fill", color: .blue)
                        StatusCard(title: "Workout", value: "Chest Day", icon: "figure.cross.training", color: .purple)
                    }
                }
                .padding(.horizontal)
                
                // Big Start Button
                Button(action: { /* Start Workout Action */ }) {
                    HStack {
                        Text("START WORKOUT")
                            .font(.headline)
                        Image(systemName: "play.fill")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(12)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Dashboard")
    }
}

// Keep your StatusCard here
struct StatusCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Label(title, systemImage: icon)
                .font(.caption)
                .foregroundColor(color)
            Text(value)
                .font(.title3.bold())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}

// I REMOVED the TrainingView, NutritionView, and ProgressView from here.
// They already exist in your other files on the left sidebar!
