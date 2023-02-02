//
//  WeatherDataTableViewCell.swift
//  ExamPreparation
//
//  Created by Martin Kuvandzhiev on 2.02.23.
//

import UIKit

class WeatherDataTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(with data: WeatherSnapshot) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.dateLabel.text = dateFormatter.string(from: data.eTime)
        
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        self.timeLabel.text = dateFormatter.string(from: data.eTime)
        
        self.temperatureLabel.text = String(format: "%0.2f℃", data.temperature)
        self.humidityLabel.text = String(format: "%0.1f%%", data.humidity)
        self.pressureLabel.text = String(format: "%0.1fhPa", data.pressure)
    }
}
