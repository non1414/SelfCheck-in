//
//  Splash.swift
//  HotelApp
//
//  Created by Sumaya Alzahrani on 15/11/1444 AH.
//

import SwiftUI

struct Splash: View {
    
    @State var isActive: Bool = false
    @EnvironmentObject private var firebaseManager: FirebaseManager
    var body: some View {
        ZStack{
            
            if self.isActive {
                
                Login()
                
            } else {
                
                Color("Color")
                    .ignoresSafeArea()
                
                VStack{
                    ZStack{
                        Image("Logo")
                            .resizable()
                            .frame(width: 140, height: 140)
                            .padding(.top, 1)
                        
                        VStack{
                            Text("QuickN")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom, 8)
                            
                            
                            Text("Skip The Line")
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .tracking(5)
                                .padding(.bottom, 20)
                        }.padding(.top, 250)
                    }.padding(.top ,120)
                    Image("Splash")
                        .padding(.top, 40)
                    
                }
                
            }
            
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        
        
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
            .environmentObject(FirebaseManager())
    }
}
