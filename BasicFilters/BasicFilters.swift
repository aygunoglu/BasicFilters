//
//  BasicFilters.swift
//  BasicFilters
//
//  Created by Hasan Aygünoglu on 5.08.2021.
//

import UIKit
import CoreImage

public class BasicFilters {
    
    public init () {}
    
    private var context = CIContext(options: nil)
    
    public func blurFilter(_ img: UIImage, intensity: Double) -> UIImage? {
        if let startImage = CIImage(image: img) {
            
            if let filter = CIFilter(name: "CIGaussianBlur") {
                filter.setValue(startImage, forKey: kCIInputImageKey)
                filter.setValue(intensity, forKey: kCIInputRadiusKey)
                
                if let cropFilter = CIFilter(name: "CICrop") {
                    cropFilter.setValue(filter.outputImage, forKey: kCIInputImageKey)
                    cropFilter.setValue(CIVector(cgRect: startImage.extent), forKey: "inputRectangle")
                    let output = cropFilter.outputImage
                    let cgimg = context.createCGImage(output!, from: output!.extent)
                    let newImage = UIImage(cgImage: cgimg!)
                    return newImage
                }
            }
            
        }
        return UIImage()
    }
    
    public func invertFilter(_ img: UIImage) -> UIImage? {
        if let startImage = CIImage(image: img) {

            if let filter = CIFilter(name: "CIColorInvert") {
                filter.setValue(startImage, forKey: kCIInputImageKey)
                let cgImage = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
                let newImage = UIImage(cgImage: cgImage!)
                return newImage
            }
        }
        return UIImage()
    }
    
    public func sepiaFilter(_ img: UIImage, intensity: Double) -> UIImage {
        if let startImage = CIImage(image: img) {

            if let filter = CIFilter(name: "CISepiaTone") {
                filter.setValue(startImage, forKey: kCIInputImageKey)
                filter.setValue(intensity, forKey: kCIInputIntensityKey)
                let cgImage = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
                let newImage = UIImage(cgImage: cgImage!)
                return newImage
            }
        }
        return UIImage()
    }
    
    public func bloomFilter(_ img: UIImage, intensity: Double, radius: Double) -> UIImage {
        if let startImage = CIImage(image: img) {

            if let filter = CIFilter(name: "CIBloom") {
                filter.setValue(startImage, forKey: kCIInputImageKey)
                filter.setValue(intensity, forKey: kCIInputIntensityKey)
                filter.setValue(radius, forKey: kCIInputRadiusKey)
                
                if let cropFilter = CIFilter(name: "CICrop") {
                    cropFilter.setValue(filter.outputImage, forKey: kCIInputImageKey)
                    cropFilter.setValue(CIVector(cgRect: startImage.extent), forKey: "inputRectangle")
                    let output = cropFilter.outputImage
                    let cgimg = context.createCGImage(output!, from: output!.extent)
                    let newImage = UIImage(cgImage: cgimg!)
                    return newImage
                }

            }
        }
        return UIImage()
    }
    
    public func grayscaleFilter(_ img: UIImage) -> UIImage {
        if let startImage = CIImage(image: img) {

            if let filter = CIFilter(name: "CIPhotoEffectNoir") {
                filter.setValue(startImage, forKey: kCIInputImageKey)
                let cgImage = context.createCGImage(filter.outputImage!, from: filter.outputImage!.extent)
                let newImage = UIImage(cgImage: cgImage!)
                return newImage
            }
        }
        return UIImage()
    }
    
}
