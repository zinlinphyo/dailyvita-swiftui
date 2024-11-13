//
//  AllergySensitivityView.swift
//  dailyvita-swiftui
//
//  Created by Zin Lin Phyo on 13/11/24.
//

import SwiftUI

struct AllergySensitivityView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    @State private var allergyInput = ""

    var body: some View {
        VStack {
            Text("Any allergies or sensitivities?")
                .font(.headline)

            TextField("Type and press enter", text: $allergyInput, onCommit: {
                addAllergy()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            List {
                ForEach(viewModel.allergies) { allergy in
                    Text(allergy.name)
                }
                .onDelete(perform: deleteAllergy)
            }

            Button("Get my personalized vitamin") {
                viewModel.logSelections()
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(8)
            .padding()
        }
        .navigationTitle("Allergies")
    }
    
    private func addAllergy() {
        guard !allergyInput.isEmpty else { return }
        let newAllergy = Allergy(id: Int.random(in: 1000...9999), name: allergyInput)
        viewModel.allergies.append(newAllergy)
        allergyInput = ""
    }

    private func deleteAllergy(at offsets: IndexSet) {
        viewModel.allergies.remove(atOffsets: offsets)
    }
}
