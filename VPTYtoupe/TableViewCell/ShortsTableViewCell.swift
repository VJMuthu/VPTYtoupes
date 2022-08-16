//
//  ShortsTableViewCell.swift
//  VPTYtoupe
//
//  Created by iOS on 16/08/22.
//

import UIKit

class ShortsTableViewCell: UITableViewCell {
    @IBOutlet var shorts_Collection:UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        shorts_Collection.dataSource = self
        shorts_Collection.delegate = self
        shorts_Collection.register(UINib(nibName: "ShortsCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ShortsCollectionCell")
        shorts_Collection.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
extension ShortsTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = shorts_Collection.dequeueReusableCell(withReuseIdentifier: "ShortsCollectionCell", for: indexPath) as! ShortsCollectionCell
        if indexPath.row % 2 == 0 {
            cell.sort_image.image = UIImage(named: "Banner3")
        }
        else{
            cell.sort_image.image = UIImage(named: "Banner4")
        }
        cell.sort_title.text = ViewController.dataList[indexPath.row].title.capitalized
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: shorts_Collection.frame.width/2.25, height: shorts_Collection.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
