//
//  ViewController.swift
//  VPTYtoupe
//
//  Created by iOS on 13/08/22.
//

import UIKit

class ViewController: MainViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var home_tbl:UITableView!
    @IBOutlet weak var top_Collection:UICollectionView!
    let baseUrl = "https://jsonplaceholder.typicode.com/posts"
    let content = ["All","Sports","News","Comedy","Movie"]
    static var dataList = [DataModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        home_tbl.delegate = self
        home_tbl.dataSource = self
        top_Collection.delegate = self
        top_Collection.dataSource = self
        home_tbl.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        home_tbl.register(UINib(nibName: "ShortsTableViewCell", bundle: nil), forCellReuseIdentifier: "ShortsTableViewCell")
        home_tbl.register(UINib(nibName: "BannerTableCell", bundle: nil), forCellReuseIdentifier: "BannerTableCell")

        callApi()
    }
    func callApi(){
        if let url = URL(string: baseUrl){
            if let data = try? Data(contentsOf: url){
                ViewController.dataList = try! JSONDecoder().decode([DataModel].self, from: data)
                DispatchQueue.main.async {
                    self.home_tbl.reloadData()
                }
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return content.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = top_Collection.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! TopCollectionViewCell
        cell.title_lbl.text = content[indexPath.row]
        cell.shadow_View.layer.borderWidth = 1
        cell.shadow_View.layer.borderColor = UIColor.lightGray.cgColor
        cell.shadow_View.backgroundColor = indexPath.row == 0 ? UIColor.lightGray:UIColor.clear
        cell.title_lbl.textColor = indexPath.row == 0 ? UIColor.white:UIColor.black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableCell", for: indexPath) as! BannerTableCell
            return cell
    }
        else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShortsTableViewCell", for: indexPath) as! ShortsTableViewCell
            return cell
    }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
            cell.vc = self
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 225
        }
        else if indexPath.row == 1{
            return 285
        }
        return CGFloat(ViewController.dataList.count * 285)
    }
    
}
class TopCollectionViewCell:UICollectionViewCell{
    @IBOutlet var title_lbl:UILabel!
    @IBOutlet var shadow_View:UIView!
}
class MainViewController:UIViewController{
    var lbl_navititle = UILabel()
    var cart_count = UILabel()
    var cart_view = UIView()
    let logo_btn = UIButton.init(type: .custom)
    let search_btn = UIButton.init(type: .custom)
    let profile_img = UIImageView()
    var cartCount = 0
    var isloded = false
    override func viewDidLoad() {
        super.viewDidLoad()
        //726C6C
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.barTintColor = UIColor(named: "Navigation")
        navigationController?.navigationBar.backgroundColor = UIColor.init(named: "Navigation")
        navigationController?.navigationBar.tintColor = UIColor.white
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: self.navigationController!.navigationBar.frame.size.height))
        
        logo_btn.setBackgroundImage(UIImage(named: "Youtube"), for: .normal)
        logo_btn.frame = CGRect(x: 0.0, y: 8, width: 30.0, height: 25.0)
        customView.addSubview(logo_btn)
        
        let marginX = CGFloat(logo_btn.frame.origin.x + logo_btn.frame.size.width)
        lbl_navititle = UILabel(frame: CGRect(x: marginX + 5, y: logo_btn.center.y-20, width: 120, height: 30.0))
        lbl_navititle.text = "VPTYtoupe"
        lbl_navititle.font = UIFont.boldSystemFont(ofSize: 20)
        lbl_navititle.textColor = UIColor.darkGray
        lbl_navititle.textAlignment = NSTextAlignment.left

        customView.addSubview(lbl_navititle)
        
        //right bar button possition setting
        
        let customViewright = UIView(frame: CGRect(x: self.navigationController!.navigationBar.frame.size.width, y: 0, width: 150, height: self.navigationController!.navigationBar.frame.size.height))
       // customViewright.backgroundColor = UIColor.red
        
        let button2 = UIButton.init(type: .custom)
        button2.setBackgroundImage(UIImage(named: "Notification"), for: .normal)
        button2.frame = CGRect(x: customView.frame.width-90, y: 10, width: 20, height: 20)
        search_btn.setBackgroundImage(UIImage(named: "Search"), for: .normal)
        search_btn.frame = CGRect(x: customView.frame.width-55, y: 8, width: 25, height: 25)

        profile_img.frame = CGRect(x: customView.frame.width-30, y: 0, width: customView.frame.height - 5, height: customView.frame.height - 5)
        profile_img.image = UIImage(named: "Avatar")
        profile_img.layer.cornerRadius = profile_img.frame.size.width/2
        cart_view.frame = CGRect(x: button2.frame.maxX-10, y: button2.frame.minY-5, width: 20, height: 20)
        cart_count.frame = CGRect(x: cart_view.frame.minX+4, y: cart_view.frame.minY+4, width: 12, height: 12)
        cart_view.backgroundColor = UIColor.red
        cart_count.textColor = UIColor.white
        cart_count.textAlignment = .center
        cart_count.font = UIFont.boldSystemFont(ofSize: 11.0)
        cart_count.text = "1"
        cart_count.adjustsFontSizeToFitWidth = true
        cart_view.layer.cornerRadius = 10
        cart_view.layer.masksToBounds = true
        customViewright.addSubview(button2)
        customViewright.addSubview(search_btn)
        customViewright.addSubview(cart_view)
        customViewright.addSubview(cart_count)
        customViewright.addSubview(profile_img)
        let leftButton = UIBarButtonItem(customView: customView)
        self.navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(customView: customViewright)
        self.navigationItem.rightBarButtonItem = rightButton
        
        
        
        
    }
   



}
