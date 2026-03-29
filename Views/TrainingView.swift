import SwiftUI
import SwiftData

struct TrainingView: View {
    @Query(sort: \LoggedWorkout.date, order: .reverse) var loggedWorkouts: [LoggedWorkout]
    
    var body: some View {
        List {
            Section("Today's Routine") {
                NavigationLink(destination: Text("Workout Logging Screen")) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.green)
                        Text("New Empty Workout")
                    }
                }
            }
            
            Section("Recent History") {
                if loggedWorkouts.isEmpty {
                    ContentUnavailableView("No Workouts Yet", systemImage: "dumbbell", description: Text("Start training to see your history."))
                } else {
                    // ADDED "id: \.id" BELOW TO FIX YOUR ERROR
                    // Add id: \.self to tell SwiftUI these are simple data objects
                    ForEach(loggedWorkouts, id: \.self) { workout in
                        VStack(alignment: .leading, spacing: 5) {
                            // Now workout.name exists and is NOT optional
                            Text(workout.name)
                                .font(.headline)
                            
                            Text(workout.date.formatted(date: .abbreviated, time: .shortened))
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .navigationTitle("Training")
    }
}
