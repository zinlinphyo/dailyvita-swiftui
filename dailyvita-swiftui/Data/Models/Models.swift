//
//  Models.swift
//  dailyvita-swiftui
//
//  Created by Zin Lin Phyo on 13/11/24.
//

import Foundation

protocol Taggable: Identifiable, Hashable {
    var name: String { get }
}

struct HealthConcern: Taggable, Codable {
    let id: Int
    let name: String
}

struct DietOption: Taggable, Codable {
    let id: Int
    let name: String
    let toolTip: String?
}

struct Allergy: Taggable, Codable {
    let id: Int
    let name: String
}

struct OnboardingData: Codable {
    let healthConcerns: [HealthConcern]
    let dietOptions: [DietOption]
    let allergies: [Allergy]
}
