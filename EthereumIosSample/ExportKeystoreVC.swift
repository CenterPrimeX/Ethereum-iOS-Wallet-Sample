//
//  ExportKeystoreVC.swift
//  EthereumIosSample
//
//  Created by Ergashev Odiljon on 2021/01/19.
//

import UIKit
import EthereumSDK
class ExportKeystoreVC: UIViewController {
    /**
       Declaring necessary UI outlet fields
     */
    @IBOutlet weak var walletTxtField: UITextField!
    @IBOutlet weak var keystoreUTextView: UITextView!
    @IBOutlet weak var copyBtnOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func exportBtnAction(_ sender: Any) {
        /**
            @param infura - Initialize infura
         */
        let eth = EthWalletManager.init(infuraUrl: "https://mainnet.infura.io/v3/a396c3461ac048a59f389c7778f06689")
        /**
         * Using this getKeyStore function user can get keyStore of provided walletAddress.
         *
         * @param WalletAddress - wallet address which user want to get key store
         *
         * @return if the function is completed successfully returns keyStore JSON file or error name
         */
        do{
            /**
                if function successfully completes result can be caught in this block
             */
            keystoreUTextView.text = try eth.exportKeystore(walletAddress: walletTxtField.text!)
            copyBtnOutlet.isHidden = false
        } catch {
            /**
                 if function fails error can be catched in this block
             */
            print(error.localizedDescription)
        }
    }
    
    @IBAction func copyBtnAction(_ sender: Any) {
        UIPasteboard.general.string = keystoreUTextView.text
    }
}

