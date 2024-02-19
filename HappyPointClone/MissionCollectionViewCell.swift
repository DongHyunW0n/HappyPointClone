//
//  MissionCollectionViewCell.swift
//  HappyPointClone
//
//  Created by WonDongHyun on 2/19/24.
//

import UIKit

class MissionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var missionImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        missionImage.layer.cornerRadius = 15
    }
    
   

}
