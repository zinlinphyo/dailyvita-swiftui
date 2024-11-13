//
//  WelcomeView.swift
//  dailyvita-swiftui
//
//  Created by Zin Lin Phyo on 13/11/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to DailyVita")
                .font(.title)
                .padding(.bottom, 10)
            Text("We will ask a couple of questions to better understand your vitamin need.")
                .multilineTextAlignment(.center)
                .padding()
            NavigationLink(destination: HealthConcernView()) {
                Text("Get started")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Welcome")
    }
}
