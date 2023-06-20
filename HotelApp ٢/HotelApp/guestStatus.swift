//
//  guestStatus.swift
//  Chuck
//
//  Created by Afnan on 01/06/2023.
//

import SwiftUI

struct guestStatus: View {
    @State private var fullName = "Afnan Mohammed Alhabi"
    @State private var phoneNumber = "0582656994"
    @State private var reservationCode = "11xcrk4"
    @State private var idNumber = "11058456935"
    @State private var expDate = Date()
    @State private var date = "20-04-2023"
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    VStack{
                        ZStack(alignment: .top) {
                            VStack{
                                Rectangle()
                                    .fill(Color.white)
                                //.stroke(Color.gray, lineWidth: 1)
                                //.stroke(Color.black, lineWidth: 10, fill: Color.white)
                                    .frame(maxWidth: 358, maxHeight: 545)
                                    .border(Color("gryStroke"))
                                    .cornerRadius(12)
                                
                            }
                            // for the icon in the top of the rectangle
                            VStack{
                                HStack{
                                    ZStack{
                                        Rectangle()
                                            .frame(width: 60, height: 60)
                                            .cornerRadius(6)
                                            .foregroundColor(Color("brownBackground"))
                                        Image(systemName: "doc.text")
                                            .foregroundColor(.white)
                                            .font(.system(size: 30))
                                    }
                                }.padding(.top,-20)
                            }
                            
                            VStack{
                                Text("Guess Information")
                                    .font(.system(size: 17, weight: .medium))
                            }.padding(.top,80)
                            
                            VStack{
                                List {
                                    HStack{
                                        ZStack{
                                            Rectangle().frame(width: 34, height: 34)
                                                .cornerRadius(6)
                                                .foregroundColor(Color("greyBackground"))
                                            Image(systemName: "person")
                                                .font(.system(size: 18))
                                                .foregroundColor(.white)
                                        }
                                        
                                        
                                        Text(fullName)
                                            .font(.system(size: 17, weight: .regular))
                                    }
                                    HStack{
                                        ZStack{
                                            Rectangle().frame(width: 34, height: 34)
                                                .cornerRadius(6)
                                                .foregroundColor(Color("greyBackground"))
                                            Image(systemName: "phone")
                                                .font(.system(size: 18))
                                                .foregroundColor(.white)
                                        }
                                        
                                        
                                        Text(phoneNumber)
                                            .font(.system(size: 17, weight: .regular))
                                    }
                                    HStack{
                                        ZStack{
                                            Rectangle().frame(width: 34, height: 34)
                                                .cornerRadius(6)
                                                .foregroundColor(Color("greyBackground"))
                                            Image(systemName: "barcode.viewfinder")
                                                .font(.system(size: 18))
                                                .foregroundColor(.white)
                                        }
                                        
                                        
                                        Text(reservationCode)
                                            .font(.system(size: 17, weight: .regular))
                                    }
                                    HStack{
                                        ZStack{
                                            Rectangle().frame(width: 34, height: 34)
                                                .cornerRadius(6)
                                                .foregroundColor(Color("greyBackground"))
                                            Image(systemName: "folder.badge.person.crop")
                                                .font(.system(size: 18))
                                                .foregroundColor(.white)
                                        }
                                        
                                        
                                        Text(idNumber)
                                            .font(.system(size: 17, weight: .regular))
                                    }
                                    HStack{
                                        ZStack{
                                            Rectangle().frame(width: 34, height: 34)
                                                .cornerRadius(6)
                                                .foregroundColor(Color("greyBackground"))
                                            Image(systemName: "calendar")
                                                .font(.system(size: 18))
                                                .foregroundColor(.white)
                                        }
                                        
                                        
                                        Text(date)
                                            .font(.system(size: 17, weight: .regular))
                                    }
                                    HStack{
                                        ZStack{
                                            Rectangle().frame(width: 34, height: 34)
                                                .cornerRadius(6)
                                                .foregroundColor(Color("greyBackground"))
                                            Image(systemName: "camera")
                                                .font(.system(size: 18))
                                                .foregroundColor(.white)
                                        }.padding(.bottom, 120)
                                        
                                        VStack{
                                            
                                        }.frame(width: 267, height: 120.11)
                                            .background(Color("imageContainerBackground"))
                                            .cornerRadius(8.64)
                                        
                                    }
                                }  .frame(height: 400)
                                    .scrollContentBackground(.hidden)
                                
                            }.padding(.top,120)
                                .padding(.bottom, 23)
                        }
                    }
                    // for two buttons
                    VStack{
                        
                        HStack{
                            HStack{
                                ZStack{
                                    Circle().frame(width: 24, height: 24)
                                        .foregroundColor(Color("gryBackgroundCircle"))
                                    Image(systemName: "exclamationmark")
                                        .font(.system(size: 15))
                                        .frame(width: 5, height: 18)
                                        .foregroundColor(.black)
                                }
                            }
                            Text("Check the information of guests then determine the status")
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color("gryFontHotel2"))
                                .font(.system(size: 15, weight: .regular))
                        }.padding(.bottom, 15)
                        
                        
                        HStack(spacing: 30) {
                            Button(action: {
                                // action for Accept button
                            }) {
                                HStack {
                                    Image(systemName: "checkmark")
                                        .font(.system(size: 16))
                                        .padding(.leading, 10)
                                    Text("Accept")
                                        .font(.system(size: 14, weight: .regular))
                                        .padding(.trailing, 10)
                                    
                                }.frame(width: 136.17, height: 20)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color("acceptButton"))
                                    .cornerRadius(20)
                            }
                            
                            Button(action: {
                                // action for Decline button
                            }) {
                                HStack {
                                    Image(systemName: "xmark")
                                        .font(.system(size: 16))
                                        .padding(.leading, 10)
                                    Text("Decline")
                                        .font(.system(size: 14, weight: .regular))
                                        .padding(.trailing, 10)
                                }
                                .frame(width: 136.17, height: 20)
                                .foregroundColor(Color("fontDeclineButton"))
                                .padding()
                                .background(Color("declineButton"))
                                .cornerRadius(20)
                            }
                        }
                    }
                }
            }
        }.navigationTitle("Status")
    }
}

struct guestStatus_Previews: PreviewProvider {
    static var previews: some View {
        guestStatus()
    }
}
