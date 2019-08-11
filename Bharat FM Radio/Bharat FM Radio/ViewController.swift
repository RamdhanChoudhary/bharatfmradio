//
//  ViewController.swift
//  Bharat FM Radio
//
//  Created by RAMDHAN CHOUDHARY on 10/08/19.
//  Copyright © 2019 RDC Innovations Pvt Ltd. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var fmListTableView: UITableView!
    var fmListArry: [[String:String]] = []
    var selectedLiveStreamURL = "http://yp.shoutcast.com/sbin/tunein-station.m3u?id=1795332"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transparentNavigationBar()
        
        let bfrObj0 = ["Name": "AIR Live News 24x7", "URL":"http://esdcdn2-lh.akamaihd.net/i/esdcdn2_1@528073/master.m3u8"]
        let bfrObj1 = ["Name": "Vividh Bharati", "URL": "http://vividhbharati-lh.akamaihd.net/i/vividhbharati_1@507811/master.m3u8"]
        let bfrObj2 = ["Name": "FM Gold Delhi", "URL": "http://airfmgold-lh.akamaihd.net/i/fmgold_1@507591/master.m3u8"]
        let bfrObj3 = ["Name": "FM Rainbow Delhi", "URL": "http://fmrainbow-lh.akamaihd.net/i/fmrainbow_1@507812/master.m3u8"]
        let bfrObj4 = ["Name": "Raagam", "URL": "http://airraagam-lh.akamaihd.net/i/airraagam_1@507820/master.m3u8"]
        let bfrObj5 = ["Name": "AIR Gujarati", "URL": "http://airgujarati-lh.akamaihd.net/i/airgujarati_1@507814/master.m3u8"]
        let bfrObj6 = ["Name": "AIR Marathi", "URL": "http://airmarathi-lh.akamaihd.net/i/airmarathi_1@507815/master.m3u8"]
        let bfrObj7 = ["Name": "AIR Punjabi", "URL": "http://airpunjabi-lh.akamaihd.net/i/airpunjabi_1@507822/master.m3u8"]
        let bfrObj8 = ["Name": "AIR Malayalam", "URL": "http://airmalayalam-lh.akamaihd.net/i/airmalayalam_1@507816/master.m3u8"]
        let bfrObj9 = ["Name": "AIR Tamil", "URL": "http://airtamil-lh.akamaihd.net/i/airtamil_1@507817/master.m3u8"]
        let bfrObj10 = ["Name": "AIR Telugu", "URL": "http://airtelugu-lh.akamaihd.net/i/airtelugu_1@507818/master.m3u8"]
        let bfrObj11 = ["Name": "AIR Kannada", "URL": "http://airkannada-lh.akamaihd.net/i/airkannada_1@507819/master.m3u8"]
        let bfrObj12 = ["Name": "AIR Bangla", "URL": "http://airbangla-lh.akamaihd.net/i/airbangla_1@507821/master.m3u8"]
        let bfrObj13 = ["Name": "Radio Kashmir", "URL": "http://kashmiri-lh.akamaihd.net/i/kashmiri_1@528067/master.m3u8"]
        let bfrObj14 = ["Name": "AIR Odia", "URL": "http://airodiya-lh.akamaihd.net/i/airodiya_1@528056/master.m3u8"]
        let bfrObj15 = ["Name": "AIR Assamese", "URL": "http://airassamese-lh.akamaihd.net/i/airassamese_1@528059/master.m3u8"]
        let bfrObj16 = ["Name": "North East Service", "URL": "http://northeastservice-lh.akamaihd.net/i/northeastservice_1@528061/master.m3u8"]
        let bfrObj17 = ["Name": "FM Tragopan Kohima", "URL": "http://nondelhi-lh.akamaihd.net/i/airkohima_1@813589/master.m3u8"]
        let bfrObj18 = ["Name": "FM Rainbow Goa", "URL": "http://nondelhi-lh.akamaihd.net/i/fmraingoa_1@813593/master.m3u8"]
        let bfrObj19 = ["Name": "AIR Shimla", "URL": "http://nondelhi-lh.akamaihd.net/i/airshimla_1@813586/master.m3u8"]
        let bfrObj20 = ["Name": "AIR Bhuj", "URL": "http://nondelhi-lh.akamaihd.net/i/airbhuj_1@813592/master.m3u8"]
        let bfrObj21 = ["Name": "AIR Indore", "URL": "http://nondelhi-lh.akamaihd.net/i/airindore_1@813588/master.m3u8"]
        let bfrObj22 = ["Name": "AIR Mysuru", "URL": "http://nondelhi-lh.akamaihd.net/i/airmysuru_1@813587/master.m3u8"]
        let bfrObj23 = ["Name": "AIR Jodhpur", "URL": "http://nondelhi-lh.akamaihd.net/i/airjodhpc_1@813591/master.m3u8"]
        let bfrObj24 = ["Name": "Amrutvarshini", "URL": "http://nondelhi-lh.akamaihd.net/i/amruthbeng_1@812373/master.m3u8"]
        let bfrObj25 = ["Name": "Vividh Bharati Bengaluru", "URL": "http://nondelhi-lh.akamaihd.net/i/vbsbeng_1@812379/master.m3u8"]
        let bfrObj26 = ["Name": "Rainbow Kannada Kaamanbilu", "URL": "http://nondelhi-lh.akamaihd.net/i/rainbeng_1@812381/master.m3u8"]
        let bfrObj27 = ["Name": " Urdu Service", "URL": "http://airurdu-lh.akamaihd.net/i/airurdu_1@507813/master.m3u8"]
        
        let bfrObj28 = ["Name": " AIR Bengaluru", "URL": "http://nondelhi-lh.akamaihd.net/i/airbeng_1@813585/master.m3u8"]
        let bfrObj29 = ["Name": " Sun City FM Jodhpur", "URL": "http://nondelhi-lh.akamaihd.net/i/airjodhfm_1@813590/master.m3u8"]
        let bfrObj30 = ["Name": " AIR Pune", "URL": "http://nondelhi-lh.akamaihd.net/i/airpune_1@825822/master.m3u8"]
        let bfrObj31 = ["Name": " AIR Rohtak", "URL": "http://nondelhi-lh.akamaihd.net/i/rohtakair_1@825825/master.m3u8"]
        let bfrObj32 = ["Name": " FM Rainbow Lucknow", "URL": "http://nondelhi-lh.akamaihd.net/i/airlucknow_1@825824/master.m3u8"]
        let bfrObj33 = ["Name": " AIR Jabalpur", "URL": "http://nondelhi-lh.akamaihd.net/i/airjabalpur_1@825823/master.m3u8"]
        let bfrObj34 = ["Name": " AIR Bhopal", "URL": "http://nondelhi-lh.akamaihd.net/i/airbhopal_1@825828/master.m3u8"]
        let bfrObj35 = ["Name": " FM Rainbow Mumbai", "URL": "http://nondelhi-lh.akamaihd.net/i/rainmumb_1@830454/master.m3u8"]
        let bfrObj36 = ["Name": " FM Gold Mumbai", "URL": "http://nondelhi-lh.akamaihd.net/i/goldmumb_1@830453/master.m3u8"]
        let bfrObj37 = ["Name": " Samvadita Mumbai", "URL": "http://nondelhi-lh.akamaihd.net/i/pcmumbai_1@830455/master.m3u8"]
        let bfrObj38 = ["Name": " AIR Aadilabad", "URL": "http://nondelhi-lh.akamaihd.net/i/adilabad_1@830457/master.m3u8"]
        let bfrObj39 = ["Name": " AIR Jaipur", "URL": "http://nondelhi-lh.akamaihd.net/i/darbhanga_1@832738/master.m3u8"]
        let bfrObj40 = ["Name": " AIR Varanasi", "URL": "http://nondelhi-lh.akamaihd.net/i/varanasi_1@830459/master.m3u8"]
        let bfrObj41 = ["Name": " AIR Raipur", "URL": "http://nondelhi-lh.akamaihd.net/i/raipurair_1@832723/master.m3u8"]
        let bfrObj42 = ["Name": " AIR Sangli", "URL": "http://nondelhi-lh.akamaihd.net/i/gangtok_1@832725/master.m3u8"]
        let bfrObj43 = ["Name": " AIR Rajkot", "URL": "http://nondelhi-lh.akamaihd.net/i/ajmer_1@832729/master.m3u8"]
        let bfrObj44 = ["Name": " AIR Nagpur", "URL": "http://nondelhi-lh.akamaihd.net/i/airlsmp001_1@838083/master.m3u8"]
        let bfrObj45 = ["Name": " AIR Prayagraj", "URL": "http://nondelhi-lh.akamaihd.net/i/airlsmp002_1@838084/master.m3u8"]
        let bfrObj46 = ["Name": " AIR Patna", "URL": "http://nondelhi-lh.akamaihd.net/i/airpatna_1@832724/master.m3u8"]
        let bfrObj47 = ["Name": " AIR Patiala", "URL": "http://nondelhi-lh.akamaihd.net/i/airlsmp005_1@838088/master.m3u8"]
        let bfrObj48 = ["Name": " AIR Mhadei, Panaji", "URL": "http://nondelhi-lh.akamaihd.net/i/airlsmp004_1@838087/master.m3u8"]
        let bfrObj49 = ["Name": " AIR Gorakhpur", "URL": "http://nondelhi-lh.akamaihd.net/i/gorakhpur_1@832728/master.m3u8"]
        let bfrObj50 = ["Name": " AIR Hassan", "URL": "http://nondelhi-lh.akamaihd.net/i/airlsmp003_1@838086/master.m3u8"]
        let bfrObj51 = ["Name": " AIR Dehradun", "URL": "http://nondelhi-lh.akamaihd.net/i/airdehradun_1@830452/master.m3u8"]
        let bfrObj52 = ["Name": " AIR Solapur", "URL": "http://nondelhi-lh.akamaihd.net/i/airlsmp006_1@838089/master.m3u8"]
        let bfrObj53 = ["Name": " AIR Kota", "URL": "http://nondelhi-lh.akamaihd.net/i/airlsmp007_1@838091/master.m3u8"]
        let bfrObj54 = ["Name": " AIR Madurai", "URL": "http://nondelhi-lh.akamaihd.net/i/airlsmp008_1@838092/master.m3u8"]
        let bfrObj55 = ["Name": " AIR Kolhapur", "URL": "http://nondelhi-lh.akamaihd-staging.net/i/kolhapur_1@832727/master.m3u8"]
       
        
        let bfrObj56 = ["Name": " AIR Suratgarh", "URL": "http://nondelhi-lh.akamaihd.net/i/airlsmp009_1@838093/master.m3u8"]
        let bfrObj57 = ["Name": " Visakhapatnam FM Rainbow", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP011_1@99841/master.m3u8"]
        let bfrObj58 = ["Name": " AIR Visakhapatnam", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP012_1@28711/master.m3u8"]
        let bfrObj59 = ["Name": " AIR Kurnool", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP013_1@60578/master.m3u8"]
        let bfrObj60 = ["Name": " AIR Bikaner", "URL": "http://nondelhi-lh.akamaihd.net/i/airlsmp010_1@838094/master.m3u8"]
        let bfrObj61 = ["Name": " AIR Kochi", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP014_1@11753/master.m3u8"]
        let bfrObj62 = ["Name": " AIR Calicut", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP015_1@73331/master.m3u8"]
        let bfrObj63 = ["Name": " AIR Mathura", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP016_1@77269/master.m3u8"]
        let bfrObj64 = ["Name": " AIR Agra", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP018_1@107602/master.m3u8"]
        let bfrObj65 = ["Name": " FM Rainbow Vijayawada", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP028_1@855161/master.m3u8"]
        let bfrObj66 = ["Name": " AIR Vijayawada", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP026_1@855159/master.m3u8"]
        let bfrObj67 = ["Name": " AIR Kannur", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP022_1@855155/master.m3u8"]
        let bfrObj68 = ["Name": " FM Ananthapuri", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP024_1@855157/master.m3u8"]
        let bfrObj69 = ["Name": " AIR Lucknow", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP029_1@855162/master.m3u8"]
        let bfrObj70 = ["Name": " AIR Mount Abu", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP025_1@855158/master.m3u8"]
        let bfrObj71 = ["Name": " AIR Dharwad", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP020_1@107628/master.m3u8"]
        let bfrObj72 = ["Name": " AIR Chandigarh", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP039_1@855173/master.m3u8"]
        let bfrObj73 = ["Name": " AIR Chitradurga", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP038_1@855172/master.m3u8"]
        let bfrObj74 = ["Name": " AIR Manjeri", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP037_1@855171/master.m3u8"]
        let bfrObj75 = ["Name": " AIR Aurangabad", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP036_1@855170/master.m3u8"]
        let bfrObj76 = ["Name": " AIR Surat", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP035_1@855169/master.m3u8"]
        let bfrObj77 = ["Name": " AIR Tirupati", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP034_1@855168/master.m3u8"]
        let bfrObj78 = ["Name": " AIR Kodaikanal", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP032_1@855165/master.m3u8"]
        let bfrObj79 = ["Name": " AIR Ooty", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP033_1@855167/master.m3u8"]
        let bfrObj80 = ["Name": " AIR Chittorgarh", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP019_1@107611/master.m3u8"]
        let bfrObj81 = ["Name": " AIR Thrissur", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP031_1@855164/master.m3u8"]
        let bfrObj82 = ["Name": " AIR Satara", "URL": "http://airlsmp-lh.akamaihd.net/i/AIRLSMP030_1@855163/master.m3u8"]
        
        //let bfrObj = ["Name": "", "URL": ""]

        
        
//        let bfrObj19 = ["Name": "", "URL": ""]
//        let bfrObj45 = ["Name": "Radio City Hindi", "URL": "http://prclive1.listenon.in:9960/"]


        
//        let bfrObj2 = ["Name": "Radio Punjabi Virsa", "URL": "http://node-13.zeno.fm/25h82wv629duv?rj-ttl=5&rj-token=AAABbH9yGXzSqOSeg6AN-pZ--oR0fjYM5qDKHxsqurjP2Eq5K9EEgA"]
//        let bfrObj3 = ["Name": "Radio Retro Bollywood", "URL": "http://64.71.79.181:5124/stream?1505228937567.mp3"]
//        let bfrObj4 = ["Name": "Radio Bolly FM", "URL": "http://stream.radiobollyfm.in:8201/hd"]

        fmListArry = [bfrObj0,bfrObj1, bfrObj2,bfrObj3,bfrObj4, bfrObj5, bfrObj6, bfrObj7, bfrObj8, bfrObj9, bfrObj10, bfrObj11, bfrObj12,bfrObj13,bfrObj14, bfrObj15,bfrObj16, bfrObj17,bfrObj18,bfrObj19,bfrObj20,bfrObj21,bfrObj22,bfrObj23,bfrObj24, bfrObj25,bfrObj26,bfrObj27,bfrObj28,bfrObj29, bfrObj30,bfrObj31,bfrObj32, bfrObj33, bfrObj34, bfrObj35, bfrObj36, bfrObj37, bfrObj38, bfrObj39, bfrObj40,bfrObj41,bfrObj41, bfrObj42,bfrObj43, bfrObj44,bfrObj45,bfrObj46,bfrObj47,bfrObj48,bfrObj49,bfrObj50,bfrObj51, bfrObj52,bfrObj53,bfrObj54,bfrObj55,bfrObj56, bfrObj57,bfrObj58,bfrObj59, bfrObj60, bfrObj61, bfrObj62, bfrObj63, bfrObj64, bfrObj65, bfrObj66, bfrObj67,bfrObj68,bfrObj69, bfrObj70,bfrObj71, bfrObj72,bfrObj73,bfrObj74,bfrObj75,bfrObj76,bfrObj77,bfrObj78,bfrObj79, bfrObj80,bfrObj81,bfrObj82  ]
        

    }
    
    func transparentNavigationBar()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("No of fm:",fmListArry.count)
        return fmListArry.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.fmListTableView.dequeueReusableCell(withIdentifier: "FMListCell") as UITableViewCell?)!
        cell.selectionStyle = .none
        
        let dictObj = self.fmListArry[indexPath.row]
        
        cell.textLabel?.text = dictObj["Name"]
        //cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: CGFloat(18))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dictObj = self.fmListArry[indexPath.row]
        selectedLiveStreamURL = dictObj["URL"]!
        
        performSegue(withIdentifier: "showPlayerViewController", sender: self)
    }
    
    //Segue Delegate Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showPlayerViewController") {
            let controller = segue.destination as? PlayerViewController
            controller?.liveStreamURL = selectedLiveStreamURL
        }
    }
}

