import SwiftUI

struct NutritionView: View {
    // These states simulate your daily intake
    @State private var caloriesConsumed: Double = 1850
    @State private var calorieGoal: Double = 2500
    @State private var waterIntake: Int = 4 // Glasses of water
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                
                // 1. MAIN CALORIE PROGRESS RING
                HStack {
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.2), lineWidth: 15)
                        Circle()
                            .trim(from: 0, to: caloriesConsumed / calorieGoal)
                            .stroke(Color.green, style: StrokeStyle(lineWidth: 15, lineCap: .round))
                            .rotationEffect(.degrees(-90))
                        
                        VStack {
                            Text("\(Int(calorieGoal - caloriesConsumed))")
                                .font(.system(size: 30, weight: .bold, design: .rounded))
                            Text("kcal left")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                    .frame(width: 150, height: 150)
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        NutrientMiniRow(label: "Eaten", value: "\(Int(caloriesConsumed))", color: .green)
                        NutrientMiniRow(label: "Burned", value: "420", color: .orange)
                        NutrientMiniRow(label: "Goal", value: "\(Int(calorieGoal))", color: .secondary)
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(20)
                .padding(.horizontal)
                
                // 2. MACROS SECTION
                Text("Daily Macros")
                    .font(.headline)
                    .padding(.horizontal)
                
                HStack(spacing: 15) {
                    MacroBox(title: "Protein", current: 120, goal: 180, color: .blue)
                    MacroBox(title: "Carbs", current: 210, goal: 250, color: .orange)
                    MacroBox(title: "Fats", current: 55, goal: 80, color: .purple)
                }
                .padding(.horizontal)
                
                // 3. WATER TRACKER
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Text("Water Intake")
                            .font(.headline)
                        Spacer()
                        Text("\(waterIntake) / 10 glasses")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        ForEach(1...10, id: \.self) { index in
                            Image(systemName: index <= waterIntake ? "drop.fill" : "drop")
                                .foregroundColor(index <= waterIntake ? .cyan : .gray)
                                .font(.system(size: 22))
                                .onTapGesture {
                                    withAnimation(.spring()) {
                                        waterIntake = index
                                    }
                                }
                        }
                    }
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(20)
                .padding(.horizontal)
                
                // 4. MEAL LOG BUTTON
                Button(action: { /* Action to add meal */ }) {
                    Label("Log a Meal", systemImage: "plus.circle.fill")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal)
            }
            .padding(.top)
        }
        .navigationTitle("Nutrition")
    }
}

// Subview for the Calorie list
struct NutrientMiniRow: View {
    let label: String; let value: String; let color: Color
    var body: some View {
        HStack {
            Circle().fill(color).frame(width: 8, height: 8)
            Text(label).font(.caption).foregroundColor(.secondary)
            Spacer()
            Text(value).font(.caption.bold())
        }
    }
}

// Subview for Macro Cards
struct MacroBox: View {
    let title: String; let current: Int; let goal: Int; let color: Color
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title).font(.caption.bold()).foregroundColor(color)
            Text("\(current)g").font(.body.bold())
            
            ProgressView(value: Double(current), total: Double(goal))
                .tint(color)
                .scaleEffect(x: 1, y: 1.5, anchor: .center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(15)
    }
}

#Preview {
    NavigationStack {
        NutritionView()
    }
}
