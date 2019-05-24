//
//  PersonTableViewCell.swift
//  StarWarsSearch(iOSPT1)
//
//  Created by Dongwoo Pae on 5/23/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    var person: Person? {
        didSet {
            self.updateViews()
        }
    }
    
    @IBOutlet weak var personLabel: UILabel!
    
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var birthYearLabel: UILabel!

    
    private func updateViews() {
        guard let person =  self.person else {return}
            self.personLabel.text = person.name
        self.genderLabel.text = "Gender: \(person.gender)"
        self.birthYearLabel.text = "Birth Year: \(person.birthYear)"
    }
    
}
