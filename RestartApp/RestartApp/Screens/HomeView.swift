//
//  HomeView.swift
//  RestartApp
//
//  Created by Mark Amoah on 4/26/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = false
    @State var isAnimating: Bool = false
    var body: some View {
        VStack(spacing: 30) {
           Spacer()
            ZStack{
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(Animation.easeInOut(duration: 5)
                    .repeatForever(), value: isAnimating)
            }
            
            Text("The time that leads to mastery is dependent on the itensity of our focus")
                .font(.system(.title3, design: .rounded))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            
            Button {
                self.isOnboardingActive = true
            } label: {
                HStack{
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill").imageScale(.large)
                    Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                }
            }.buttonStyle(.borderedProminent)
             .buttonBorderShape(.capsule)
             .controlSize(.large)
            

                
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                isAnimating = true
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
