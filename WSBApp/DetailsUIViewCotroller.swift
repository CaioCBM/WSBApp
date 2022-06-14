//
//  DetailsUIViewCotroller.swift
//  WSBApp
//
//  Created by Yhan Nunes on 12/06/22.
//

import UIKit

class DetailsUIViewCotroller: UIViewController {
    
    @IBOutlet weak var ticketName:UILabel!
    @IBOutlet weak var sentimentScore:UILabel!
    @IBOutlet weak var sentiment:UILabel!
    @IBOutlet weak var noComment:UILabel!


    var wsbApi: WSBAPIElement?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ticketName.text = "\((wsbApi?.ticker)!)"
        sentimentScore.text = "Sentiment Score: \((wsbApi?.sentimentScore)!)"
        sentiment.text = "Sentiment: \((wsbApi?.sentiment)!)"
        noComment.text = "N. Comments: \((wsbApi?.noOfComments)!)"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
