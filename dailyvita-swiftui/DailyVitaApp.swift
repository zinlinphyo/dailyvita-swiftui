//
//  dailyvita_swiftuiApp.swift
//  dailyvita-swiftui
//
//  Created by Zin Lin Phyo on 13/11/24.
//

import SwiftUI

@main
struct DailyVitaApp: App {
    @StateObject private var viewModel = OnboardingViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                WelcomeView()
            }
            .environmentObject(viewModel)
        }
    }
}
