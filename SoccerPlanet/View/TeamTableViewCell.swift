//
//  TeamTableViewCell.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 24/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import UIKit
import WebKit

class TeamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var gamePlayedLabel: UILabel!
    @IBOutlet weak var goalDifferenceLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamLogoWebView: WKWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(position:String,teamName:String,gamePlayed:String,goalDifference:String,points:String,teamLogoURL:String?){
        positionLabel.text = position
        teamNameLabel.text = teamName
        gamePlayedLabel.text = gamePlayed
        goalDifferenceLabel.text = goalDifference
        pointsLabel.text = points

        guard let teamLogoURL = teamLogoURL else {
            teamLogoImageView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            return
        }
                
        let fullHTML = "<!DOCTYPE html>" +
            "<html lang=\"ja\">" +
            "<head>" +
            "<meta charset=\"UTF-8\">" +
            "<style type=\"text/css\">" +
            "html{margin:0;padding:0;}" +
            "body {" +
            "margin: 0;" +
            "padding: 0;" +
            "color: #363636;" +
            "font-size: 90%;" +
            "line-height: 1.6;" +
            "background: #3E3D3E;" +
            "}" +
            "p{" +
            "text-align: left;" +
            "}" +
            "img{" +
            "margin-left: 1%;" +
            "width: 9%;" +
            "height: auto;" +
            "}" +
            "</style>" +
            "</head>" +
            "<body id=\"page\">" +
        "<p> <img src='\(teamLogoURL)'/></p></body></html>"
        
        teamLogoWebView.loadHTMLString(fullHTML, baseURL: nil)
        teamLogoWebView.scrollView.isScrollEnabled = false
    }

}
