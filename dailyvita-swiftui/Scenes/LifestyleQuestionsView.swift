//
//  LifestyleQuestionsView.swift
//  dailyvita-swiftui
//
//  Created by Zin Lin Phyo on 13/11/24.
//

import SwiftUI

struct LifestyleQuestionsView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel

    var body: some View {
        VStack {
            Toggle("Is your daily sun exposure limited?", isOn: Binding(
                get: { viewModel.sunExposure ?? false },
                set: { viewModel.sunExposure = $0 }
            ))

            Toggle("Do you currently smoke?", isOn: Binding(
                get: { viewModel.smoke ?? false },
                set: { viewModel.smoke = $0 }
            ))

            Picker("Alcohol Consumption per Week", selection: $viewModel.alcoholConsumption) {
                Text("0 - 1").tag("0-1")
                Text("2 - 5").tag("2-5")
                Text("5+").tag("5+")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            NavigationLink(destination: AllergySensitivityView()) {
                Text("Next")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Lifestyle")
    }
}
