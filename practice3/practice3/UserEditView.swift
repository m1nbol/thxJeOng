//
//  UserEditView.swift
//  practice3
//
//  Created by BoMin Lee on 4/5/25.
//

import SwiftUI

struct UserEditView: View {
    @Binding var user: User
    
    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            Stepper("Age: \(user.age)", value: $user.age, in: 18...100)
        }
    }
}
