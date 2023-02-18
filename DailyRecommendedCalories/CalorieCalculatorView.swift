import SwiftUI

struct CalorieCalculatorView: View {
    @State private var birthdate = Date()
    @State private var sex = Sex.male
    @State private var weight = ""
    @State private var height = ""
    @State private var goal = Goal.maintain
    @State private var activityLevel = ActivityLevel.sedentary
    @State private var recommendedCalories: Int? = nil
    
    var body: some View {
        NavigationView {
            Form {
                PersonalInformationView(birthdate: $birthdate, sex: $sex)
                BodyInformationView(weight: $weight, height: $height)
                
                Section(header: Text("Calorie Calculation")) {
                    Picker("Goal", selection: $goal) {
                        ForEach(Goal.allCases, id: \.self) { goal in
                            Text(goal.rawValue)
                        }
                    }
                    Picker("Activity Level", selection: $activityLevel) {
                        ForEach(ActivityLevel.allCases, id: \.self) { activityLevel in
                            Text(activityLevel.rawValue)
                        }
                    }
                }
                
                Section {
                    Button(action: calculateCalories) {
                        Text("Calculate")
                    }
                    
                    if let calories = recommendedCalories {
                        Text("Recommended daily calorie intake: \(calories) calories")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .multilineTextAlignment(.center)
                            .padding(.vertical, 20)
                            .accessibilityIdentifier("recommendedCaloriesLabel")
                    }
                }
            }
            .navigationBarTitle("Calorie Calculator")
        }
    }
    
    func calculateCalories() {
        let weight = Double(self.weight) ?? 0
        let height = Double(self.height) ?? 0
        let sex = Sex(rawValue: self.sex.rawValue)!
        let activityLevel = ActivityLevel(rawValue: self.activityLevel.rawValue)!
        let goal = Goal(rawValue: self.goal.rawValue)!
        
        let personAge = CalorieCalculator.age(birthdate: birthdate)
        let personBMR = CalorieCalculator.bmr(age: personAge, sex: sex, weight: weight, height: height)
        let recommendedCalories = CalorieCalculator.calculateCalories(bmr: personBMR, goal: goal, activityLevel: activityLevel)
        self.recommendedCalories = recommendedCalories
    }
}

struct PersonalInformationView: View {
    @Binding var birthdate: Date
    @Binding var sex: Sex
    
    var body: some View {
        Section(header: Text("Personal Information")) {
            DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                .accessibilityIdentifier("Birthdate")
            Picker("Sex", selection: $sex) {
                ForEach(Sex.allCases, id: \.self) { sex in
                    Text(sex.rawValue).accessibilityIdentifier("Sex")
                }
            }
        }
    }
}

struct BodyInformationView: View {
    @Binding var weight: String
    @Binding var height: String
    
    let weightFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    var body: some View {
        Section(header: Text("Body Information")) {
            HStack {
                TextField("Weight (kg)", text: $weight)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("kg")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack {
                TextField("Height (cm)", text: $height)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("cm")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct CalorieCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieCalculatorView()
    }
}
