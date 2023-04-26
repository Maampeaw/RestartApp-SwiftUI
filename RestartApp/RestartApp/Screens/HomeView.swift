//
//  HomeView.swift
//  RestartApp
//
//  Created by Mark Amoah on 4/26/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = false
    var body: some View {
        VStack(spacing: 20) {
            Text("Home").font(.largeTitle)
            Button {
                isOnboardingActive = true
            } label: {
                Text("Tap me")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
