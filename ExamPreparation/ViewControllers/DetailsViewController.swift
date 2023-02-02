//
//  DetailsViewController.swift
//  ExamPreparation
//
//  Created by Martin Kuvandzhiev on 2.02.23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var weatherSnapshot: WeatherSnapshot? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.weatherImageView.layer.cornerRadius = self.weatherImageView.bounds.height/2
        self.weatherImageView.layer.masksToBounds = true
        self.tableView.layer.cornerRadius = 8
        self.tableView.layer.masksToBounds = true
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let weatherSnapshot = self.weatherSnapshot else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Temperature"
            cell.detailTextLabel?.text = String(format: "%0.2f℃", weatherSnapshot.temperature)
        case 1:
            cell.textLabel?.text = "Humidity"
            cell.detailTextLabel?.text = String(format: "%0.2f%%", weatherSnapshot.humidity)
        case 2:
            cell.textLabel?.text = "Pressure"
            cell.detailTextLabel?.text = String(format: "%0.2fhPa", weatherSnapshot.pressure)
        case 3:
            cell.textLabel?.text = "Wind"
            cell.detailTextLabel?.text =  String(format: "%0.2fkm/h", weatherSnapshot.wind)
        case 4:
            cell.textLabel?.text = "Gusts"
            cell.detailTextLabel?.text = String(format: "%0.2fkm/h", weatherSnapshot.gusts)
        case 5:
            cell.textLabel?.text = "Wind Direction"
            cell.detailTextLabel?.text = weatherSnapshot.windDirection
        case 6:
            cell.textLabel?.text = "Rain"
            cell.detailTextLabel?.text = String(format: "%0.2fmm", weatherSnapshot.rain)
        case 7:
            cell.textLabel?.text = "Location"
            cell.detailTextLabel?.text = weatherSnapshot.location
        default:
            break
        }
        return cell
    }
    
    
}
