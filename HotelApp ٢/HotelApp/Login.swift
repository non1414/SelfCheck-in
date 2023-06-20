//
//  Login.swift
//  HotelApp
//
//  Created by Sumaya Alzahrani on 16/11/1444 AH.
//

import SwiftUI

struct Login: View {
    @EnvironmentObject private var firebaseManager: FirebaseManager
    @State var email: String = ""
    @State var password: String = ""
    @State var isShowingHomeView: Bool = false
    @State var hotelName: HotelsCategory = .marriott_Hotel
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    HStack{
                        Text("Login")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color 1"))
                            .padding(.top,30)
                            .padding(.bottom, 10)
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                    }
                    Spacer()
                    
                    ZStack{
                        
                        Image("image 28")
                            .resizable()
                            .frame(width: 184, height:184)
                        Image("HotelLogin")
                            .resizable()
                            .opacity(0.7 )
                            .frame(width:390 ,height: 290)
                    }
                    
                    
                    
                    HStack{
                        Text("Email")
                            .padding(.leading, 20)
                        Spacer()
                        
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Color 2"), lineWidth: 1)
                        
                            .frame(width: 358, height: 52)
                        
                        TextField("Enter Your Email", text: $email)
                            .padding(.leading, 40)
                    }.padding(.bottom, 16)
                    
                    Spacer()
                    HStack{
                        Text("Password")
                            .padding(.leading, 20)
                        Spacer()
                        
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Color 2"), lineWidth: 1)
                        
                            .frame(width: 358, height: 52)
                        
                        TextField("Enter Your Passowrd", text: $password)
                        
                        
                            .padding(.leading, 40)
                    }.padding(.bottom, 16)
                    
                    Group{
                        HStack{
                            Text("Hotel")
                                .padding(.leading, 20)
                            Spacer()
                            
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("Color 2"), lineWidth: 0)
                                .frame(width: 358, height: 52)
                            Menu {
                                ForEach(HotelsCategory.allCases, id:\.self) { hotel in
                                    Button {
                                        hotelName = hotel
                                        firebaseManager.hotelName = hotel.title
                                    } label: {
                                        Text(hotel.title)
                                    }
                                }
                            } label: {
                                Text(hotelName.title)
                            }.menuStyle(.borderlessButton)

                        }.padding(.bottom, 16)
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("Color"))
                            .frame(width: 191, height: 47)
                            .shadow(color: Color(red: 0.5647, green: 0.5647, blue: 0.5647).opacity(0.5), radius: 4, x: 0, y: 2)
                        Button {
//                            MainPage()
                            firebaseManager.logUserIn(email: email, password: password) { isSuccess in
                                isShowingHomeView.toggle()
                            }
                        } label: {
                            Text("Login")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                    }.padding(.top, 40)
                    
                }//bigvstack
            }
            
        }.fullScreenCover(isPresented: $isShowingHomeView) {
            MainPage()
        }
    }
}
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
            .environmentObject(FirebaseManager())
    }
}
