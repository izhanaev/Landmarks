//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Mac on 6/29/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    @State var editMode: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(editMode: $editMode, profile: $draftProfile)
                .onAppear {
                    if let loadedProfile = UserDefaults.standard.loadProfile() {
                        draftProfile = loadedProfile
                    } else {
                        draftProfile = Profile.default
                    }
                }
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button(action: {
                    editMode = true
                }) {
                    Image(systemName: "pencil")
                }
            }
        }
    }
}

//#Preview {
//    ProfileHost()
//}
