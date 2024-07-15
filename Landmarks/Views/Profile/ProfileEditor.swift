//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Ильяс Жанаев on 12.07.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Edit")
                .bold()
                .font(.system(size: 20))
                .padding(.top, 10)
            
            List {
                HStack {
                    Text("Username")
                    Spacer()
                    TextField("Username", text: $profile.username)
                        .foregroundStyle(.gray)
                        .multilineTextAlignment(.trailing)
                }
                Toggle(isOn: $profile.prefersNotifications) {
                    Text("Allow Notifications")
                }
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                DatePicker("Goal Date", selection: $profile.goalDate, displayedComponents: .date)
            }
            Button {
                saveProfile()
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .font(.system(size: 16))
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(30)
            }
            .padding(20)
        }
        .background(Color.bgColor)
    }
    
    private func saveProfile() {
        UserDefaults.standard.saveProfile(profile)
    }
}

#Preview {
    ProfileEditor(profile: .constant(Profile(username: "test")))
}
