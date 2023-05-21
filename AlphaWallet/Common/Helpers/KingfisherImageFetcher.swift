//
//  KingfisherImageFetcher.swift
//  AlphaWallet
//
//  Created by Vladyslav Shepitko on 09.09.2022.
//

import Foundation
import Kingfisher
import AlphaWalletFoundation
import SVGKit



public struct SVGImgProcessor:ImageProcessor {
    public var identifier: String = "com.appidentifier.webpprocessor"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            print("already an image")
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}


class KingfisherImageFetcher: ImageFetcher {
    

    func retrieveImage(with url: URL) async throws -> UIImage {
        let resource = ImageResource(downloadURL: url, cacheKey: url.absoluteString)

        return try await withUnsafeThrowingContinuation { continuation in
            KingfisherManager.shared.retrieveImage(with: resource, options: [.processor(SVGImgProcessor())]) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: response.image)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
