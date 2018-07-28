//
//  PlaceTableViewCell.swift
//  PlacesApp
//
//  Created by Burhan on 28/07/2018.
//  Copyright © 2018 Burhan. All rights reserved.
//

import UIKit

class PlaceTableViewCell: BaseTableViewCell {

    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var venueLocationLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func refreshCellWithData(_ cellData: Any?) {
        if let venue : VenueModel = cellData as? VenueModel{
            
        }
    }
    
}
