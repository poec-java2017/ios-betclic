//
//  EventController.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation
import UIKit

class EventController: UIViewController {
    @IBOutlet weak var imageEvent: UIImageView!
    @IBOutlet weak var titleEvent: UILabel!
    @IBOutlet weak var nameEquips: UILabel!
    @IBOutlet weak var quotation: UILabel!
    
    var event = Event()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imageEvent.image =
        self.titleEvent.text = "\(event.nameMatch) : \(event.nameCompetition)"
        self.nameEquips.text = "\(event.nameEquip1) vs \(event.nameEquip2)"
        self.quotation.text = "host : \(event.coteEquip1) guest : \(event.coteEquip2) tie : \(event.coteTie)"
        
        DispatchQueue.main.async {
            if let bannerUrl = URL(string: self.event.image), let imageData = NSData(contentsOf: bannerUrl) {
                self.imageEvent.image = UIImage(data: imageData as Data)
            } else {
                self.imageEvent.image = UIImage(named: "goalEvent")
            }
        }
        
    }
    
}
