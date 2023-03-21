//
//  AddActivityView.swift
//  Habitual
//
//  Created by Justin Hold on 3/21/23.
//

import SwiftUI

struct AddActivityView: View {
	@ObservedObject var data: Activities
	@State private var title = ""
	@State private var description = ""
	@Environment(\.dismiss) var dismiss
    var body: some View {
		NavigationView {
			Form {
				TextField("Title", text: $title)
				TextField("Description", text: $description)
			}
			.navigationTitle("Add Activity")
			.toolbar {
				Button("Save") {
					let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
					guard trimmedTitle.isEmpty == false else { return }
					let activity = Activity(title: trimmedTitle, description: description)
					data.activities.append(activity)
					dismiss()
				}
			}
		}
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
		AddActivityView(data: Activities())
    }
}
