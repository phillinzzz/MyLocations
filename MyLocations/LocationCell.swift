//
//  LocationCell.swift
//  MyLocations
//
//  Created by 戴林 on 2018/9/10.
//  Copyright © 2018年 potatosoft.co.ltd. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    func configure(for location: Location) {
        
        // Configure description label
        if location.locationDescription.isEmpty {
            descriptionLabel.text = "(No Description)"
            
        } else {
            descriptionLabel.text = location.locationDescription
        }
        // Configure address(i.e.:placemark)
        if let placemark = location.placemark {
            var text = ""
            text.add(text: placemark.subThoroughfare)
            text.add(text: placemark.thoroughfare, separatedBy: " ")
            text.add(text: placemark.locality, separatedBy: ", ")
            
            addressLabel.text = text
            
        } else {
            addressLabel.text = String(format: "Lat: %.8f, Long: %.8f", location.latitude, location.longitude)
        }
        
        photoImageView.image = thumbnail(for: location)
        
    }
    
    func thumbnail(for location: Location) -> UIImage {
        if location.hasPhoto, let image = location.photoImage {
            return image.resized(withBounds: CGSize(width: 52, height: 52))
        }
        return UIImage(named: "No Photo")!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let selection = UIView(frame: CGRect.zero)
        selection.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
        //selection.backgroundColor = UIColor(red: 255/255.0, green: 0, blue: 0, alpha: 0.9)
        selectedBackgroundView = selection
        
        // Rounded corners for images
        photoImageView.layer.cornerRadius = photoImageView.bounds.width / 2
        photoImageView.clipsToBounds = true
        separatorInset = UIEdgeInsets(top: 0, left: 82, bottom: 0, right: 0)
        
        //descriptionLabel.backgroundColor = UIColor.purple
        //addressLabel.backgroundColor = UIColor.purple
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
