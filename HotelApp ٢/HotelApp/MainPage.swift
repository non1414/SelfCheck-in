//
//  MainPage.swift
//  HotelApp
//
//  Created by Khulood Alhamed on 27/05/2023.
//

import SwiftUI

struct MainPage: View {
    @State var selected = 1
    @State var reservFilterStatus: Status = .waiting
    @EnvironmentObject private var firebaseManager: FirebaseManager
    
    var body: some View {
        NavigationView{
            List{
                HStack{
                    Spacer()
                    Picker(selection: $selected.animation(), label: Text("Picker"), content:{
                        Text("Pending").tag(1)
                        Text("Reviewed").tag(2)
                    }).pickerStyle(SegmentedPickerStyle()).foregroundColor(Color("SegColor"))
                        .frame(width: 340)
                        .onChange(of: selected) { newValue in
                            firebaseManager.fetchReservs()
                        }
                    Spacer()
                }
                .listRowSeparator(.hidden, edges: .all)
                
                
                //Pending Card
                if selected == 1 {
                    ForEach(firebaseManager.reservations.filter{$0.status == .waiting
                        && $0.hotel.name == firebaseManager.hotelName}, id:\.self) { reservation in
                        PlainNavigationLink {
                            reviewed(reservation: reservation)
                        } label: {
                            
                            HStack{
                                Text(reservation.userName)
                                    .padding(.leading, 20)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .padding(.horizontal)
                            }.frame(width: 358, height: 56)
                                .foregroundColor(.black)
                                .background(Color("NameBtn"))
                                .cornerRadius(10)
                                .padding(.top, 8)
                                .padding(.leading, 12)
                            
                        }.buttonStyle(.borderless)
                    }.listRowSeparator(.hidden, edges: .all)
                } else {
                    
                    //Reviewd Card
                    
                    
                    ForEach(firebaseManager.reservations.filter{$0.status != .waiting && $0.hotel.name == firebaseManager.hotelName}, id:\.self) { reservation in
                        ZStack(alignment: .leading){

                            RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                .frame(width: 360, height: 175)
                            
                            HStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.2), lineWidth: 1)
                                        .frame(width: 105, height: 103)
                                    Image(reservation.hotel.imageName)
                                        .resizable()
                                        .frame(width: 95, height: 95)
                                    
                                }.padding(.leading, 10)
                                
                                VStack(alignment: .leading){
                                    
                                    // Name
                                    Text(reservation.userName)
                                    // Phone number
                                    HStack{
                                        ZStack{
                                            Rectangle()
                                                .frame(width: 20, height: 20)
                                                .cornerRadius(4)
                                                .foregroundColor(Color("iconColor"))
                                            Image(systemName: "phone")
                                                .font(.system(size: 13))
                                                .foregroundColor(.white)
                                        }
                                        Text(reservation.phoneNumber)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15))
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.75)
                                        
                                    }
                                    // Reservation Code
                                    HStack{
                                        ZStack{
                                            Rectangle()
                                                .frame(width: 20, height: 20)
                                                .cornerRadius(4)
                                                .foregroundColor(Color("iconColor"))
                                            Image(systemName: "barcode.viewfinder")
                                                .font(.system(size: 13))
                                                .foregroundColor(.white)
                                        }
                                        Text("xr006")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 15))
                                        
                                        
                                    }
                                    // Check-in date
                                    HStack{
                                        ZStack{
                                            Rectangle()
                                                .frame(width: 20, height: 20)
                                                .cornerRadius(4)
                                                .foregroundColor(Color("iconColor"))
                                            Image(systemName: "calendar")
                                                .font(.system(size: 13))
                                                .foregroundColor(.white)
                                        }
                                        Text(reservation.selectedDate.convertDate(formattedString: .formattedType1))
                                            .font(.system(size: 15))
                                            .foregroundColor(.gray)
                                    }
                                    
                                    
                                }.padding(.leading, 1)
                                ZStack{
                                    Rectangle()
                                        .frame(width: 70, height: 23)
                                        .cornerRadius(15)
                                        .foregroundColor(reservation.status == .rejected ? Color("RejectColor") : Color("acceptButton"))
                                    Text(reservation.status.title)
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .semibold))
                                }.padding(.leading, 10)
                                    .padding(.bottom, 120)
                                    .offset(x: -30)
                            }
                        }.offset(x: 16)
                        
                        .swipeActions{
                            Button {
                                
                            } label: {
                                Image(systemName: "trash")
                                    .tint(.red)
                            }.tint(.red)
                            
                        }
                        .padding(.top, 20)
                    }.listRowSeparator(.hidden, edges: .all)
                    
                }
            }.navigationTitle("Explore")
            .listStyle(.plain)
        }.onDisappear{
            firebaseManager.fetchReservs()
        }
        .onAppear{
            firebaseManager.fetchReservs()
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
            .environmentObject(FirebaseManager())
    }
}


struct PlainNavigationLink<Label, Destination>: View where Label: View, Destination: View {
    @ViewBuilder var destination: () -> Destination
    @ViewBuilder var label: () -> Label
    
    var body: some View {
        label()
            .background(
                NavigationLink(destination: destination, label: {})
                    .opacity(0)
            )
    }
}
