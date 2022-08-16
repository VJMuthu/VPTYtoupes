//
//  ListTableViewCell.swift
//  VPTYtoupe
//
//  Created by iOS on 13/08/22.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet var list_Collection:UICollectionView!
    var vc = ViewController()
    let timeArray = ["5 Hours ago","1 day ago"]
    let viewArray = ["2.5k views","5k views"]
    let channelArray = ["VKRadio","VPTRadio"]

    override func awakeFromNib() {
        super.awakeFromNib()
        list_Collection.register(UINib(nibName: "ListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ListCollectionViewCell")
        list_Collection.dataSource = self
        list_Collection.delegate = self
        list_Collection.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func optionsAction(_ sender:UIButton){
        let stortboard = UIStoryboard(name: "Main", bundle: nil)
        let bsVC = stortboard.instantiateViewController(withIdentifier: "BottomSheetViewController") as! BottomSheetViewController
        bsVC.modalTransitionStyle = .crossDissolve
        bsVC.modalPresentationStyle = .overCurrentContext
        vc.present(bsVC, animated: false, completion: nil)
    }
    
}
extension ListTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ViewController.dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = list_Collection.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        cell.category_img.image = indexPath.row % 2 == 0 ? UIImage(named: "Banner1"):UIImage(named: "Banner2")
        cell.views_lbl.text = indexPath.row % 2 == 0 ? viewArray[0]:viewArray[1]
        cell.time_lbl.text = indexPath.row % 2 == 0 ? timeArray[0]:timeArray[1]
        cell.channel_name_lbl.text = indexPath.row % 2 == 0 ? channelArray[0]:channelArray[1]

        cell.title_lbl.text = ViewController.dataList[indexPath.row].title.capitalized
        cell.option_btn.addTarget(self, action: #selector(optionsAction(_ :)),for:.touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: list_Collection.frame.size.width, height: 275)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
