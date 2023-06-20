//
//  FirebaseManager.swift
//  HotelApp
//
//  Created by نوف بخيت الغامدي on 6/7/23.
//

import Foundation

import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI
import FirebaseAuth

class FirebaseManager: NSObject, ObservableObject {
    
    let auth: Auth
    let firestore: Firestore
    let storage: Storage
    @AppStorage("hotelName") var hotelName: String = ""
    @Published var user: User = .init()
    @Published var reservations: [Reservation] = []
    
    override init(){
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
        self.storage = Storage.storage()
        super.init()
        fetchReservs()
    }
    
    func logUserIn(email: String, password: String, completion: @escaping((Bool) -> Void)) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let _ = error {
                print("DEBUG: error while logging in")
                completion(false)
            }
            completion(true)
        }
    }
    
    func modifyReserv(reservation: Reservation) {
        try? firestore.collection("reservation").document(reservation.id).setData(from: reservation, merge: true)
        try? firestore.collection("users").document(reservation.userId).collection("reservation").document(reservation.id).setData(from: reservation, merge: true)
    }
    
    func fetchReservs() {
        firestore.collection("reservation").getDocuments { querySnapshot, error in
            if let _ = error {
                print("DEBUG: error while getting docs")
                return
            }
            guard let reservations = querySnapshot?.documents.compactMap({try? $0.data(as: Reservation.self)}) else {return}
            self.reservations = reservations.filter{$0.hotel.name == HotelsCategory.marriott_Hotel.title}
            self.reservations = reservations
        }
    }
    
}
