//
//  MainPageCollectionViewCell.swift
//  CollectionViewAddMultipleViewController
//
//  Created by 丁偉哲 on 2017/3/10.
//  Copyright © 2017年 丁偉哲. All rights reserved.
//

import UIKit

class MainPageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var view4Page: UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //MARK:- 處理傳入的頁面的frame。
        if let v = view4Page.viewWithTag(100) {
            v.frame = self.view4Page.frame
        }
    }

}
