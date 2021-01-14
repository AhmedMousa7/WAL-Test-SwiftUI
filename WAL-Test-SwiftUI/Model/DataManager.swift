//
//  DataManager.swift
//  WAL-Test-SwiftUI
//
//  Created by Ahmed Mousa on 14/01/2021.
//

import Foundation

class DataManager: ObservableObject {
    
    @Published var users = [User]()
    
    func fetchGithubUsers() {
        if let url = URL(string: "https://api.github.com/users"){
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, resonse, error) in
                if (error == nil) {
                    if let data = data {
                        if let result = self.parseJson(data: data){
                            DispatchQueue.main.async {
                                self.users = result
                            }
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseJson(data: Data) -> [User]? {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([User].self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
    
}
