//
//  UserDefaults+.swift
//  Landmarks
//
//  Created by Ильяс Жанаев on 15.07.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import Foundation

extension UserDefaults {
    private static let profileKey = "profile"
    
    func saveProfile(_ profile: Profile) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(profile)
            set(data, forKey: Self.profileKey)
        } catch {
            print("Error saving profile: \(error.localizedDescription)")
        }
    }
    
    func loadProfile() -> Profile? {
        guard let data = data(forKey: Self.profileKey) else { return nil }
        do {
            let decoder = JSONDecoder()
            let profile = try decoder.decode(Profile.self, from: data)
            return profile
        } catch {
            print("Error loading profile: \(error.localizedDescription)")
            return nil
        }
    }
}

