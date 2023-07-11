//
//  Base64-Encoding-Decoding.swift
//  FaceName
//
//  Created by Berardino Chiarello on 10/07/23.
//

import Foundation
import SwiftUI

extension UIImage {
    var base64: String? {
        self.jpegData(compressionQuality: 1)?.base64EncodedString()
    }
}

extension String {
    var imageFromBase64: UIImage? {
        guard let imageData = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
            return nil
        }
        return UIImage(data: imageData)
    }
}
