//
//  Model.swift
//  HotelApp
//
//  Created by نوف بخيت الغامدي on 6/7/23.
//

import Foundation

import Foundation

struct User: Codable, Hashable, Identifiable {
    var id: String = ""
    var phoneNumber: String = ""
    var identity: String = ""
    var email: String = ""
}


struct Guest: Codable, Hashable, Identifiable {
    var id: String = ""
    var name: String = ""
    var identity: String = ""
    var expDate: Date = .init()
    var code: String = ""
}


struct Reservation: Codable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    var userName: String = ""
    var phoneNumber: String = ""
    var userId: String = ""
    var identity: String = ""
    var expDate: String = ""
    var code: String = ""
    var hotel: Hotel = .init()
    var selectedDate: Date = .init()
    var timestamp = Date()
    var guests: Int = 0
    var status: Status = .waiting
    var imageUrlString: String = ""
}

import SwiftUI

enum Status: String, CaseIterable, Codable, Hashable {
    case waiting
    case approved
    case rejected
    
    var color: Color {
        switch self {
        case .waiting:  return .gray
        case .approved: return .green
        case .rejected: return .red
        }
    }
    
    var title: String {
        switch self {
        case .waiting: return  "Waiting"
        case .approved: return "Approved"
        case .rejected: return "Rejected"
        }
    }
}

enum HotelsCategory: String, CaseIterable {
    case marriott_Hotel
    case Rafal_Hotel
    case Ayan_Hotel
    case Movenpick_Hotel
    case Hilton
    case Atlantic_Hotel
    var title: String {
        switch self {
        case .marriott_Hotel:  return "marriott Hotel"
        case .Rafal_Hotel:     return "Hilton"
        case .Ayan_Hotel:      return "Rafal Hotel"
        case .Movenpick_Hotel: return "Ayan Hotel"
        case .Hilton:          return "Movenpick Hotel"
        case .Atlantic_Hotel:          return "Atlantic Hotel"
        }
    }
    
}



struct Hotel: Codable, Identifiable, Hashable {
    var id: String = ""
    var imageName: String = ""
    var name: String = ""
    var location: String = ""
    var phoneNumber: String = ""
    var link: String = ""
    var termsAndConditions: String = ""
    
}

struct MockData {
    static let hotels: [Hotel] = [
        .init(id: "marriott Hotel", imageName: "marriott_Hotel", name: "marriott Hotel",
              location: "Abha", phoneNumber: "", link: "", termsAndConditions: ""),
        
        .init(id: "Hilton", imageName: "image 19", name: "Hilton",
              location: "jeddah", phoneNumber: "", link: "", termsAndConditions: ""),
        
            .init(id: "Rafal Hotel", imageName: "Rafal_Hotel", name: "Rafal Hotel",
                  location: "Riyadh", phoneNumber: "", link: "", termsAndConditions: ""),
        
        
            .init(id: "Ayan Hotel", imageName: "Ayan_Hotel", name: "Ayan Hotel",
                  location: "Riyadh", phoneNumber: "", link: "", termsAndConditions: ""),
        
            .init(id: "Movenpick Hotel", imageName: "Movenpick_Hotel", name: "Movenpick Hotel",
                  location: "Riyadh", phoneNumber: "", link: "", termsAndConditions: ""),
        .init(id: "Atlantic Hotel", imageName: "Atlantic_Hotel", name: "Atlantic Hotel",
              location: "Jeddah", phoneNumber: "", link: "", termsAndConditions: ""),
    ]
}




extension Date {
    /// To convert a date to specific type
    func convertDate(formattedString: DateFormattedType) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = formattedString.rawValue
        return formatter.string(from: self)
    }
    /// To print 1s ago , 4d ago, 1month ago
    func convertToTimeAgo(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth, .month, .year]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = style
        let now = Date()
        return formatter.string(from: self, to: now) ?? ""
    }
    
    func convertToTimeWill(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth, .month, .year]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = style
        let now = Date()
        return formatter.string(from: now, to: self) ?? ""
    }
    
    func interval(ofComponent comp: Calendar.Component, from date: Date) -> Float {
        let currentCalendar = Calendar.current
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0.0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0.0 }
        return Float(start - end)
    }
    
}

enum DateFormattedType: String, CaseIterable {
    /// Date sample  Sunday, Sep 6, 2020
    case formattedType1 = "EEEE, MMM d, yyyy"
    /// Date sample  09/24/2020
    case formattedType2 = "MM/dd/yyyy"
    /// Date sample  09-06-2020 02:45 AM
    case formattedType3 = "MM-dd-yyyy h:mm a"
    /// Date sample  Sep 6, 2:45 AM
    case formattedType4 = "MMM d, h:mm a"
    /// Date sample  02:45:07.397
    case formattedType5 = "HH:mm:ss.SSS"
    /// Date sample  02:45:07.397
    case formattedType6 = "dd.MM.yy"
    /// Date sample  Sep 6, 2020
    case formattedType7 = "MMM d, yyyy"
    /// Time sample  24/05/2020 ● 9:24:22 PM
    case formattedType8 = "dd/MM/yyyy ● h:mm:ss a"
    /// Time sample  Fri23/Oct/2020
    case formattedType9 = "E d/MMM/yyy"
    /// Thu, 22 Oct 2020 5:56:22 pm
    case formattedType10 = "E, d MMM yyyy h:mm:ss a"
    /// Date sample for Month only JUNE
    case formattedType11 = "MMMM"
    /// Date sample for Day in Number only 04
    case formattedType12 = "dd"
    /// to get seconds only
    case formattedType13 = "ss"
    /// time only 9:24:22 PM
    case timeOnly = "h:mm a"
}
