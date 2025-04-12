//
//  ImageHandling.swift
//  practice4
//
//  Created by BoMin Lee on 4/12/25.
//

import UIKit

protocol ImageHandling: AnyObject {
    func addImage(_ image: UIImage)
    func getImages() -> [UIImage]
    var recognizedText: String { get set }
}
