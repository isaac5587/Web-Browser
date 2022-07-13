//
//  ViewController.swift
//  WebBrowser
//
//  Created by Trill Isaac on 7/12/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, UISearchBarDelegate, UIWebViewDelegate, WKNavigationDelegate {
    
    //Different buttons from storyboard
    @IBOutlet weak var appWebView: WKWebView!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var goBackButton: UIButton!
    @IBOutlet weak var goForwardButton: UIButton!
    @IBOutlet weak var appSearchBar: UISearchBar!
    @IBOutlet var switchTabButton: UIView!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appWebView.allowsBackForwardNavigationGestures = true // allows webView to go back a page
        let refreshPage = UIRefreshControl() //initiates the refreshing of a scroll view
        refreshPage.addTarget(self, action: #selector(refreshAction(sender: )), for: UIControl.Event.valueChanged)
        appWebView.scrollView.bounces = true //Allows scrollview to bounce once it reaches the edge
        appWebView.scrollView.addSubview(refreshPage) //adds the scrollview
        let url = URL(string: "https://google.com/") //Main homepage for the browser
        let URLRequest = URLRequest(url: url!) // request our url from the url string passed
        appWebView.load(URLRequest) // loads the url from the request into the webView
        
    }
    

    
    //Refresh Button
    @IBAction func refreshPage(_ sender: Any) {
        appWebView.reload()
    }
    
    //goForward button
    @IBAction func goForward(_ sender: Any) {
        appWebView.goForward()
    }
    
    //goBackward Button
    @IBAction func goBack(_ sender: Any) {
        appWebView.goBack()
    }
    
    //reloads the webview when the refresh button is pressed
    @objc func refreshAction(sender: UIRefreshControl){
        appWebView.reload()
        sender.endRefreshing()
        

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        appSearchBar.resignFirstResponder()
        
        if let searchBarURL = URL(string: appSearchBar.text!){
            appWebView.load(URLRequest(url: searchBarURL))
        }else{
            print("Error with URL Search")
        }
    }
}

