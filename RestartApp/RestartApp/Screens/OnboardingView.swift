//
//  OnboardingView.swift
//  RestartApp
//
//  Created by Mark Amoah on 4/26/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = false
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                //Header
                Spacer()
                VStack (spacing: 0){
                    Text("Share").font(.system(size: 60)).fontWeight(.heavy).foregroundColor(.white)
                    Text("It's not how much we give but about how much love we put into giving").font(.title3).fontWeight(.light).foregroundColor(.white).multilineTextAlignment(.center).padding(.horizontal)
                }
                Spacer()
                //Center
                ZStack{
                    ZStack{
                        Circle().stroke(.white.opacity(0.2), lineWidth: 40 ).frame(width: 260, height: 260, alignment: .center)
                        Circle().stroke(.white.opacity(0.2), lineWidth: 80).frame(width: 260, height: 260, alignment: .center)
                    }
                    Image("character-1")
                    .resizable()
                    .scaledToFit()
                }
                Spacer()
                ZStack{
                    //1. Background
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Get Started").font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x:20)
                    
                    
                    HStack{
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80)
                        Spacer()

                    }
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                            
                        }.foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .onTapGesture {
                            isOnboardingActive = false
                        }
                        Spacer()
                    }
                }.frame(height: 80, alignment: .center)
                    .padding()
                //Footer
                Spacer()

            }
        }//End of ZStack
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}