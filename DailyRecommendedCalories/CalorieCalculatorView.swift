import SwiftUI

enum Sex: String, CaseIterable {
    case male
    case female
    
    var displayText: String {
        switch self {
        case .male:
            return "male"
        case .female:
            return "female"
        }
    }
}

enum Goal: String, CaseIterable {
    case lose
    case maintain
    case gain
    
    var displayText: String {
        switch self {
        case .lose:
            return "lose"
        case .maintain:
            return "maintain"
        case .gain:
            return "gain"
        }
    }
}

enum ActivityLevel: String, CaseIterable {
    case sedentary
    case lightlyActive
    case moderatelyActive
    case veryActive
    case extraActive
    
    var displayText: String {
        switch self {
        case .sedentary:
            return "sedentary"
        case .lightlyActive:
            return "lightly_active"
        case .moderatelyActive:
            return "moderately_active"
        case .veryActive:
            return "very_active"
        case .extraActive:
            return "extra_active"
        }
    }
}

struct CalorieCalculatorView: View {
    @State internal var birthdate = Date()
    @State internal var sex = Sex.male
    @State internal var weight = ""
    @State internal var height = ""
    @State internal var goal = Goal.maintain
    @State internal var activityLevel = ActivityLevel.sedentary
    @State internal var recommendedCalories: Int? = nil
    
    let weightFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    DatePicker("Birthdate", selection: $birthdate, displayedComponents: .date)
                    Picker("Sex", selection: $sex) {
                        ForEach(Sex.allCases, id: \.self) { sex in
                            Text(sex.displayText)
                        }
                    }
                }
                
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
                
                Section(header: Text("Calorie Calculation")) {
                    Picker("Goal", selection: $goal) {
                        ForEach(Goal.allCases, id: \.self) { goal in
                            Text(goal.displayText)
                        }
                    }
                    Picker("Activity Level", selection: $activityLevel) {
                        ForEach(ActivityLevel.allCases, id: \.self) { activityLevel in
                            Text(activityLevel.displayText)
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
                    }
                }
            }
            .navigationBarTitle("Calorie Calculator")
        }
    }
    
    func calculateCalories() {
        let sex = self.sex.rawValue
        // let weight = Double(self.weight) ?? 0
        // let height = Double(self.height) ?? 0
        let weight = 70.0
        let height = 180.0
        let goal = self.goal.rawValue
        let activityLevel = self.activityLevel.rawValue
        
        // let personAge = CalorieCalculator.age(birthdate: birthdate)
        let personAge = 33
        print("👵 personAge: \(personAge)")
        print("Sex: \(sex) - Weight: \(weight) - Height: \(height)")
        let personBMR = CalorieCalculator.bmr(age: personAge, sex: sex, weight: weight, height: height)
        print("👵 personBMR: \(personBMR)")
        let recommendedCalories = CalorieCalculator.calculateCalories(bmr: personBMR, goal: goal, activityLevel: activityLevel)
        self.recommendedCalories = recommendedCalories
        print("🍰 Recommended Calories: \(recommendedCalories)")
        print("🥮 Recommended Calories: \(String(describing: self.recommendedCalories))")
    }
}

struct CalorieCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieCalculatorView()
    }
}
