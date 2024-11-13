//
//  DietSelectionView.swift
//  dailyvita-swiftui
//
//  Created by Zin Lin Phyo on 13/11/24.
//

import SwiftUI

struct DietSelectionView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel

    var body: some View {
        VStack {
            Text("Select the diets you follow.")
                .font(.headline)
                .padding(.top)

            List {
                ForEach(viewModel.dietOptions) { option in
                    HStack {
                        Toggle(option.name, isOn: Binding(
                            get: { viewModel.selectedDietOptions.contains(option.id) },
                            set: { isSelected in
                                if isSelected {
                                    viewModel.selectedDietOptions.insert(option.id)
                                } else {
                                    viewModel.selectedDietOptions.remove(option.id)
                                }
                            }
                        ))
                        Spacer()
                        Button(action: {
                            // Display tooltip (as an alert, for example)
                        }) {
                            Image(systemName: "info.circle")
                        }
                        .alert(isPresented: .constant(true)) {
                            Alert(title: Text(option.name), message: Text(option.toolTip ?? ""), dismissButton: .default(Text("OK")))
                        }
                    }
                }
            }
            
            NavigationLink(destination: LifestyleQuestionsView()) {
                Text("Next")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Diet Selection")
    }
}

