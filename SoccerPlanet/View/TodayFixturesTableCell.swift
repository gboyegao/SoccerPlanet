//
//  TodayFixturesTableCell.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 27/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import UIKit

class TodayFixturesTableCell: UITableViewCell {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var matchTimeLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var awayScoreLabel: UILabel!
    
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(status:String,matchTime:String,homeTeam:String,awayTeam:String,homeScore:String,awayScore:String){
        
        statusLabel.text = status
        matchTimeLabel.text = matchTime
        homeTeamLabel.text = homeTeam
        awayTeamLabel.text = awayTeam
        homeScoreLabel.text = homeScore
        awayScoreLabel.text = awayScore
        
        
        switch status {
        case "IN_PLAY","PAUSED":
            setUpCellColor(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        case "SCHEDULED","FINISHED":
            setUpCellColor(color: #colorLiteral(red: 0.9742844701, green: 0.7410509586, blue: 0.3146140575, alpha: 1))
        default:
            setUpCellColor(color: #colorLiteral(red: 0.8599768877, green: 0.1257156432, blue: 0.1353015304, alpha: 1))
        }
        
    }
    
    func setUpCellColor(color:UIColor){
        statusView.backgroundColor = color
        cellView.layer.borderColor = color.cgColor
    }

}
