
//  Reviewed.swift
//  HotelApp
//
//  Created by Afnan on 05/06/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct reviewed: View {
    
    @State private var isPresented = true
    
    @State private var fullName = "Afnan Mohammed Alhabi"
    @State private var phoneNumber = "0582656994"
    @State private var reservationCode = "11xcrk4"
    @State private var idNumber = "11058456935"
    @State private var expDate = Date()
    @State private var date = "20-04-2023"
    @State private var showingCredits = false
    @Environment(\.dismiss) private var dismiss
    var reservation: Reservation
    @EnvironmentObject private var firebaseManager: FirebaseManager
    var body: some View {
        Button("") {
            isPresented = true
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            dismiss.callAsFunction()
        }) {
            VStack {
                VStack{
                    VStack{
                        ZStack(alignment: .top) {
                            VStack{
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        isPresented = false
                                    }) {
                                        Image(systemName: "xmark.circle")
                                            .font(.title)
                                            .foregroundColor(.gray)
                                        // .padding(.top, 100)
                                    }
                                }
                                .padding()
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(maxWidth: 358, maxHeight: 545)
                                    .border(Color("gryStroke"))
                                    .cornerRadius(12)
                                //.stroke(Color.gray, lineWidth: 1)
                                
                            }.padding(.top, 130)
                                .border(Color("gryStroke"))
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
                                }.padding(.top,170)
                            }
                            
                            VStack{
                                Text("Guess Information")
                                    .font(.system(size: 17, weight: .medium))
                            }.padding(.top,280)
                            
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
                                        
                                        
                                        Text(reservation.userName)
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
                                        
                                        
                                        Text(reservation.phoneNumber)
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
                                        
                                        
                                        Text(reservation.code)
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
                                        
                                        
                                        Text(reservation.userId)
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
                                        
                                        
                                        Text(reservation.selectedDate.convertDate(formattedString: .formattedType1))
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
                                        
                                        WebImage(url: URL(string: reservation.imageUrlString))
                                        // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
                                            .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
                                        
                                            .placeholder(Image(systemName: "photo")) // Placeholder Image
                                        // Supports ViewBuilder as well
                                            .placeholder {
                                                Rectangle().foregroundColor(.gray)
                                            }
                                            .indicator(.activity) // Activity Indicator
                                            .transition(.fade(duration: 0.5)) // Fade Transition with duration
                                            .scaledToFill()
                                            .frame(width: 267, height: 120.11)
                                            .background(Color("imageContainerBackground"))
                                            .cornerRadius(8.64)
                                    }
                                }.frame(height: 600, alignment: .bottom)
                                    .overlay(alignment: .bottom) {
                                        HStack(spacing: 20){
                                            Button {
                                                var reservation = reservation
                                                reservation.status = .approved
                                                firebaseManager.modifyReserv(reservation: reservation)
                                                isPresented = false
                                            } label: {
                                                Label("Approved", systemImage: "checkmark")
                                                    .foregroundColor(.white)
                                                    .frame(width: 160, height: 50)
                                                    .background(Color(#colorLiteral(red: 0.3962286711, green: 0.8161615133, blue: 0.465750277, alpha: 1)))
                                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                            }
                                            
                                            Button {
                                                var reservation = reservation
                                                reservation.status = .rejected
                                                firebaseManager.modifyReserv(reservation: reservation)
                                                isPresented = false
                                            } label: {
                                                Label("Decline", systemImage: "xmark")
                                                    .foregroundColor(.red)
                                                    .frame(width: 160, height: 50)
                                                    .background(Color(#colorLiteral(red: 0.9450979829, green: 0.9450982213, blue: 0.9450981021, alpha: 1)))
                                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                            }
                                            
                                        }.padding()
                                        
                                    }
                                    .padding(.top, 190)
                                    .scrollContentBackground(.hidden)
                                
                            }.padding(.top,120)
                            // .frame(width: 358, height: 600)
                                .padding(.bottom, 120)
                            
                        }
                        
                    }
                    
                }
            }
            
        }
    }
}

struct reviewed_Previews: PreviewProvider {
    static var previews: some View {
        reviewed(reservation: .init())
            .environmentObject(FirebaseManager())
    }
}
