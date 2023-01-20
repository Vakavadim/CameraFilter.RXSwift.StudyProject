//
//  FilterService.swift
//  CameraFilter.RXSwift.StudyProject
//
//  Created by Вадим Гамзаев on 20.01.2023.
//

import UIKit
import CoreImage

class FilterService {
    
    private var contex: CIContext
    
    init() {
        self.contex = CIContext()
    }
    
    func applyFilter(to inputImage: UIImage, comletion: @escaping ((UIImage) -> ()) ) {
        
        let filter = CIFilter(name: "CICMYKHalftone")!
        filter.setValue(5.0, forKey: kCIInputWidthKey)
        
        if let sourceImage = CIImage(image: inputImage) {
            
            filter.setValue(sourceImage, forKey: kCIInputImageKey)
            if let cgimg = self.contex.createCGImage(filter.outputImage!, from: filter.outputImage!.extent) {
                let processedImage = UIImage(cgImage: cgimg, scale: inputImage.scale, orientation: inputImage.imageOrientation)
                comletion(processedImage)
            }
        }
    }
}
