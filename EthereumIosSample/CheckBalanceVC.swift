//
//  CheckBalanceVC.swift
//  EthereumIosSample
//
//  Created by Ergashev Odiljon on 2021/01/19.
//

import UIKit
import EthereumSDK
class CheckBalanceVC: UIViewController {
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var walletAddressTxtFieldOutlet: UITextField!
    @IBOutlet weak var balanceLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func checkBalanceBtnAction(_ sender: Any) {
        /**
            @param infura - Initialize infura
         */
        let eth = EthWalletManager(infuraUrl: "https://mainnet.infura.io/v3/a396c3461ac048a59f389c7778f06689")
        /**
         * Using this getEtherBalance function you can check balance of provided walletAddress.
         *
         * @param walletAddress - which user want to check it's balance
         *
         * @return if the function completes successfully returns balance of provided wallet address or returns error name
         */
        do {
            /**
                if function successfully completes result can be caught in this block
             */
            let balance = try eth.getEtherBalance(walletAddress: walletAddressTxtFieldOutlet.text!)
            balanceLabelOutlet.text = "Ethereum balance: " + balance!
        }catch{
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
}

