//
//  Activities.swift
//  Habitual
//
//  Created by Justin Hold on 3/21/23.
//

import Foundation

class Activities: ObservableObject {
	@Published var activities: [Activity] {
		didSet {
			if let encoded = try? JSONEncoder().encode(activities) {
				UserDefaults.standard.set(encoded, forKey: "Activities")
			}
		}
	}
	init() {
		if let saved = UserDefaults.standard.data(forKey: "Activities") {
			if let decoded = try? JSONDecoder().decode([Activity].self, from: saved) {
				activities = decoded
				return
			}
		}
		activities = []
	}
}
