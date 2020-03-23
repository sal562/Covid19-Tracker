//
//  CovidEntryTableViewCell.swift
//  CovidTracker
//
//  Created by Sal B Amer on 3/23/20.
//  Copyright © 2020 Sal B Amer. All rights reserved.
//

import UIKit

class CovidEntryTableViewCell: UITableViewCell {
    
    var results: Entry? {
        didSet {
            updateViews()
            roundedOutViews()
        }
    }
    
    //MARK: IBOutlets
    
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var casesLbl: UILabel!
    @IBOutlet weak var deathsLbl: UILabel!
    @IBOutlet weak var recoveredLbl: UILabel!
    @IBOutlet weak var bgView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

// update views
    
    func updateViews() {
        guard let results = results else { return }
        countryLbl.text = results.country
        casesLbl.text = "Cases: \(results.cases)"
        deathsLbl.text = "Deaths: \(results.deaths)"
        recoveredLbl.text = "Recovered: \(results.recovered)"
    }
    
    // rounded view corner
    func roundedOutViews() {
          bgView.layer.cornerRadius = 30
      }

}
