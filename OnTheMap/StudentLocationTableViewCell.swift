//
//  StudentLocationTableViewCell.swift
//  OnTheMap
//
//  Created by Mark Lindamood on 7/6/16.
//  Copyright © 2016 udacity. All rights reserved.
//

import UIKit

class StudentLocationTableViewCell: UITableViewCell {
    @IBOutlet weak var pinImage: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    func configureWithStudentLocation(studentLocation:StudentLocation) {
        pinImage.image = UIImage(named:"Pin")
        fullNameLabel.text = studentLocation.student.fullName
        urlLabel.text = studentLocation.student.mediaUrl
    }
}
