import SwiftUI
struct OnboardingFlowView: View {
    @AppStorage("hasCompletedOnboarding") var hasCompletedOnboarding: Bool = false
    @AppStorage("userName") var userName: String = ""
    @AppStorage("userGoal") var userGoal: String = ""
    
    @State private var currentStep = 1
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Step Indicator
                HStack {
                    ForEach(1...3, id: \.self) { index in
                        Capsule()
                            .fill(currentStep >= index ? Color.green : Color.gray)
                            .frame(width: 40, height: 6)
                    }
                }
                .padding(.top)

                Spacer()

                if currentStep == 1 {
                    questionView(title: "What's your name?", hint: "Enter name", text: $userName)
                } else if currentStep == 2 {
                    questionView(title: "What is your main goal?", hint: "e.g. Build Muscle, Weight Loss", text: $userGoal)
                } else {
                    summaryView
                }

                Spacer()

                // "Next" Button
                Button(action: nextStep) {
                    Text(currentStep == 3 ? "GET STARTED" : "NEXT")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 50)
            }
        }
    }

    func nextStep() {
        if currentStep < 3 {
            withAnimation { currentStep += 1 }
        } else {
            hasCompletedOnboarding = true
        }
    }

    func questionView(title: String, hint: String, text: Binding<String>) -> some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
            
            TextField(hint, text: text)
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(10)
                .padding(.horizontal, 40)
        }
    }

    var summaryView: some View {
        VStack(spacing: 15) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
            Text("Ready to enter the Sanctuary?")
                .font(.title.bold())
            Text("Your journey to consistency starts now, \(userName).")
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}
