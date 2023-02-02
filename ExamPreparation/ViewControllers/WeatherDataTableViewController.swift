//
//  WeatherDataTableViewController.swift
//  ExamPreparation
//
//  Created by Martin Kuvandzhiev on 2.02.23.
//

import UIKit

class WeatherDataTableViewController: UITableViewController {

    var weatherSnapshotData = LocalDataManager.getWeatherData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: .dataUpdatedNotification, object: nil, queue: OperationQueue.main) { [weak self] _ in
            self?.updateData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueId = segue.identifier, segueId == "weatherDataSegue" else {
            return
        }
        
        guard let destination = segue.destination as? DetailsViewController, let weatherData = sender as? WeatherSnapshot else {
            return
        }
        
        destination.weatherSnapshot = weatherData
    }
    

    func updateData() {
        DispatchQueue.main.async {
            self.weatherSnapshotData = LocalDataManager.getWeatherData()
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.weatherSnapshotData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherDataCellIdentifier", for: indexPath) as? WeatherDataTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setupCell(with: self.weatherSnapshotData[indexPath.row])

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "weatherDataSegue", sender: self.weatherSnapshotData[indexPath.row])
    }

}
