import SwiftUI
import Charts // This is essential for the graphs

struct FitnessProgressView: View {
    // Mock data for the chart (In the future, this comes from SwiftData)
    let weightData = [
        (day: "Mon", weight: 80.5),
        (day: "Tue", weight: 80.2),
        (day: "Wed", weight: 79.8),
        (day: "Thu", weight: 79.9),
        (day: "Fri", weight: 79.5),
        (day: "Sat", weight: 79.2),
        (day: "Sun", weight: 78.9)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                
                // 1. Weight Trend Chart
                VStack(alignment: .leading) {
                    Text("Weight Trend")
                        .font(.headline)
                    Text("Last 7 Days")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Chart {
                        ForEach(weightData, id: \.day) { item in
                            LineMark(
                                x: .value("Day", item.day),
                                y: .value("Weight", item.weight)
                            )
                            .foregroundStyle(.green)
                            .interpolationMethod(.catmullRom) // Makes the line curvy/smooth
                            
                            AreaMark(
                                x: .value("Day", item.day),
                                y: .value("Weight", item.weight)
                            )
                            .foregroundStyle(LinearGradient(colors: [.green.opacity(0.3), .clear], startPoint: .top, endPoint: .bottom))
                        }
                    }
                    .frame(height: 200)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(15)

                // 2. Personal Records (PRs)
                VStack(alignment: .leading) {
                    Text("Personal Records")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    PRRow(exercise: "Bench Press", weight: "100 kg", date: "2 days ago")
                    PRRow(exercise: "Deadlift", weight: "180 kg", date: "1 week ago")
                    PRRow(exercise: "Squat", weight: "140 kg", date: "3 days ago")
                }
                .padding()
                
                // 3. Consistency Calendar
                VStack(alignment: .leading) {
                    Text("Consistency")
                        .font(.headline)
                    Text("Monthly Workout Frequency")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    // A simple grid to represent the days you went to the gym
                    let columns = Array(repeating: GridItem(.fixed(20)), count: 7)
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(0..<31) { index in
                            RoundedRectangle(cornerRadius: 4)
                                .fill(index % 3 == 0 ? Color.green : Color.gray.opacity(0.2))
                                .frame(width: 20, height: 20)
                        }
                    }
                }
                .padding()
            }
            .padding()
        }
        .navigationTitle("Progress")
    }
}

// Custom Row for Personal Records
struct PRRow: View {
    let exercise: String
    let weight: String
    let date: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(exercise)
                    .font(.body.bold())
                Text(date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(weight)
                .font(.title3.bold())
                .foregroundColor(.green)
        }
        .padding(.vertical, 8)
        Divider()
    }
}
