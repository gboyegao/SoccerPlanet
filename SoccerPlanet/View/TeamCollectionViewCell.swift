//
//  TeamCollectionViewCell.swift
//  SoccerPlanet
//
//  Created by Adegboyega Olusunmade on 28/03/2019.
//  Copyright © 2019 Adegboyega Olusunmade. All rights reserved.
//

import UIKit
import WebKit

class TeamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamImageWebview: WKWebView!
    
    func setUpCell(teamName:String,teamLogoURL:String){
        teamNameLabel.text = teamName
        guard let teamlogo = URL(string: teamLogoURL) else {return }
        
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
            "background: black;" +
            "}" +
            "p{" +
            "text-align: left;" +
            "}" +
            "img{" +
            "margin-left: 5%;" +
            "width: 20%;" +
            "height: auto;" +
            "}" +
            "</style>" +
            "</head>" +
            "<body id=\"page\">" +
            "<p> <img src='\(teamLogoURL)'/></p></body></html>"

        teamImageWebview.loadHTMLString(fullHTML, baseURL: nil)
        teamImageWebview.scrollView.isScrollEnabled = false
        

    }
}
