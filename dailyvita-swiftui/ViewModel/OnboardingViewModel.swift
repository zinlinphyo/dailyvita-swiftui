//
//  OnboardingViewModel.swift
//  dailyvita-swiftui
//
//  Created by Zin Lin Phyo on 13/11/24.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var selectedHealthConcerns: [HealthConcern] = []
    @Published var prioritizedHealthConcerns: [HealthConcern] = []
    @Published var selectedDietOptions: Set<Int> = []
    @Published var sunExposure: Bool?
    @Published var smoke: Bool?
    @Published var alcoholConsumption: String = "0-1"
    @Published var allergies: [Allergy] = []

    private(set) var healthConcerns: [HealthConcern] = []
    private(set) var dietOptions: [DietOption] = []
    private(set) var allergyOptions: [Allergy] = []

    init() {
        loadData()
    }

    private func loadData() {
        loadHealthConcerns()
        loadDietOptions()
        loadAllergies()
    }

    private func loadHealthConcerns() {
        if let url = Bundle.main.url(forResource: "Healthconcern", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode([String: [HealthConcern]].self, from: data),
               let concerns = jsonData["data"] {
                self.healthConcerns = concerns
            }
        }
    }

    private func loadDietOptions() {
        if let url = Bundle.main.url(forResource: "Diets", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode([String: [DietOption]].self, from: data),
               let diets = jsonData["data"] {
                self.dietOptions = diets
            }
        }
    }

    private func loadAllergies() {
        if let url = Bundle.main.url(forResource: "allergies", withExtension: "json"),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            if let jsonData = try? decoder.decode([String: [Allergy]].self, from: data),
               let allergies = jsonData["data"] {
                self.allergyOptions = allergies
            }
        }
    }

    func validate() -> Bool {
        return !selectedHealthConcerns.isEmpty
    }

    func logSelections() {
        let healthConcerns = selectedHealthConcerns.enumerated().map { index, concern in
            ["id": concern.id, "name": concern.name, "priority": index + 1]
        }
        let selectedDiets = dietOptions.filter { selectedDietOptions.contains($0.id) }
        let allergies = self.allergies.map { ["id": $0.id, "name": $0.name] }

        let output = [
            "health_concerns": healthConcerns,
            "diets": selectedDiets.isEmpty ? [] : selectedDiets.map { ["id": $0.id, "name": $0.name] },
            "is_daily_exposure": sunExposure ?? false,
            "is_smoke": smoke ?? false,
            "alcohol": alcoholConsumption,
            "allergies": allergies
        ] as [String : Any]

        print(output)
    }
}
