//
//  BannerCollectionViewCell.swift
//  HappyPointClone
//
//  Created by WonDongHyun on 2/5/24.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.cornerRadius = 20
    }

}
