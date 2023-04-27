//
//  OnboardingView.swift
//  RestartApp
//
//  Created by Mark Amoah on 4/26/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingActive: Bool = false
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var dynamicButtonWidth: CGFloat = 80
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                //Header
                Spacer()
                VStack (spacing: 0){
                    Text("Share").font(.system(size: 60)).fontWeight(.heavy).foregroundColor(.white)
                    Text("It's not how much we give but about how much love we put into giving").font(.title3).fontWeight(.light).foregroundColor(.white).multilineTextAlignment(.center).padding(.horizontal)
                }.opacity(isAnimating ? 1 : 0)
                 .offset(x: isAnimating ? 0 : -40)
                 .animation(.easeOut(duration: 1.0), value: isAnimating)
                Spacer()
                //Center
                ZStack{
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                    Image("character-1")
                    .resizable()
                    .scaledToFit()
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.easeOut(duration: 0.5), value: isAnimating)
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
                            .frame(width: dynamicButtonWidth)
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
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                        dynamicButtonWidth = 80 + gesture.translation.width
                                        
                                    }
                                }).onEnded({ _ in
                                    withAnimation(Animation.easeOut(duration: 0.5)){
                                        if buttonOffset > buttonWidth / 2{
                                            isOnboardingActive = false
                                        }else{
                                            buttonOffset = 0
                                            dynamicButtonWidth = 80
                                        }
                                    }
                                })
                        )
                        Spacer()
                    }
                }.frame(width: buttonWidth, height: 80, alignment: .center)
                    .padding()
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 40)
                    .animation(.easeOut(duration: 0.5), value: isAnimating)
                    
                //Footer
                Spacer()

            }
        }.onAppear {
            isAnimating = true
        }//End of ZStack
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
