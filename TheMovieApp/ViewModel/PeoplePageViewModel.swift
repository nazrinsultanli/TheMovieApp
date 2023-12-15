//
//  PeoplePageViewModel.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 08.12.23.
//

import Foundation

class PeoplePageViewModel {
    var peopleData: People?
    var items = [PeopleResult]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    let manager = PeopleManager()
    
    func getPeopleList() {
        manager.getPeopleList(pageNumber: (peopleData?.page ?? 0) + 1) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.peopleData = data
                self.items.append(contentsOf: data.results ?? [])
                self.success?()
            }
        }
    }
    
    func pagination(index: Int) {
        if index == items.count - 1 && (peopleData?.page ?? 0 <= peopleData?.totalPages ?? 0) {
            getPeopleList()
        }
    }
}
