//
//  ImageLoader.swift
//  WAL-Test-SwiftUI
//
//  Created by Ahmed Mousa on 14/01/2021.

// Source: https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    
    deinit {
        cancel()
    }
    
    func load(url: URL?) {
        if let safeUrl = url {
            cancellable = URLSession.shared.dataTaskPublisher(for: safeUrl)
                .map { UIImage(data: $0.data) }
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] in self?.image = $0 }
        }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
