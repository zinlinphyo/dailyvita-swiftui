//
//  HealthConcernView.swift
//  dailyvita-swiftui
//
//  Created by Zin Lin Phyo on 13/11/24.
//

import SwiftUI

struct HealthConcernView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel

    var body: some View {
        VStack {
            Text("Select the top health concerns (up to 5)")
                .font(.headline)
                .padding(.top)

            WrapView(items: viewModel.healthConcerns, selectedItems: $viewModel.selectedHealthConcerns, maxSelection: 5)
            
            Text("Prioritize")
                .font(.subheadline)
                .padding(.top)
            
            List {
                ForEach(viewModel.selectedHealthConcerns) { concern in
                    Text(concern.name)
                }
                .onMove(perform: movePriority)
            }
            
            NavigationLink(destination: DietSelectionView()) {
                Text("Next")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle("Health Concerns")
    }

    private func movePriority(from source: IndexSet, to destination: Int) {
        viewModel.selectedHealthConcerns.move(fromOffsets: source, toOffset: destination)
    }
}
