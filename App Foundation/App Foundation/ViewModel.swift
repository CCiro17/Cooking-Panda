//
//  ViewModel.swift
//  App Foundation
//
//  Created by Fabio Fontana on 09/04/25.
//

import SwiftUI

class RecordsViewModel: ObservableObject {
    @Published var records: [Record] = []
    
    private let airtableService = AirtableService()
    
    func getData() {
        airtableService.fetchRecords { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedRecords):
                    self.records = fetchedRecords
                case .failure(let error):
                    print("Error fetching data: \(error.localizedDescription)")
                }
            }
        }
    }

    func randomRecord() -> Record? {
        return records.randomElement()
    }

}
