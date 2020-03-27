//
//  DetailsViewController.swift
//  CovidTracker
//
//  Created by Sal B Amer on 3/23/20.
//  Copyright © 2020 Sal B Amer. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var entries: Entry?
    
    //IB Outlets
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var countryNameLbl: UILabel!
    @IBOutlet weak var lastUpdatedDateLbl: UILabel!
    @IBOutlet weak var totalCasesLbl: UILabel!
    @IBOutlet weak var totalCasesTodayLbl: UILabel!
    @IBOutlet weak var totalDeathLbl: UILabel!
    @IBOutlet weak var totalDeathsTodayLbl: UILabel!
    @IBOutlet weak var totalActiveLbl: UILabel!
    @IBOutlet weak var totalCriticalLbl: UILabel!
    @IBOutlet weak var casesPer1MLbl: UILabel!
    @IBOutlet weak var deathsPer1MLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    func updateViews() {
        guard let entries = entries else { return }
        countryNameLbl.text = entries.country
        lastUpdatedDateLbl.text = "Last Updated: \(Date())"
        totalCasesLbl.text = "\(entries.cases)"
        totalCasesTodayLbl.text = "\(entries.todayCases)"
        totalDeathLbl.text = "\(entries.deaths)"
        totalDeathsTodayLbl.text = "\(entries.todayDeaths)"
        totalActiveLbl.text = "\(entries.active)"
        totalCriticalLbl.text = "\(entries.critical)"
//        casesPer1MLbl.text = "\(entries)"
        
        // Get Flag image from URL
        let countryFlagImg = entries.countryInfo.flag
        let request = URLRequest(url: countryFlagImg)
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error fetching large image: \(error)")
                return
            }
            guard let data = data else {
                print("Error with flag image data: \(error)")
                return
            }
            DispatchQueue.main.async {
                self.countryFlag.image = UIImage(data: data)
            }
        }.resume()
        
    }
 
}
