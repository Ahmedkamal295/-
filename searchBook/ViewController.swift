//
//  ViewController.swift
//  searchBook
//
//  Created by Ahmed on 11/6/19.
//  Copyright © 2019 Ahmed. All rights reserved.
//

import DropDown
import NVActivityIndicatorView
import UIKit
import WebKit
class ViewController: UIViewController, UIWebViewDelegate {
    // Outlets
    @IBOutlet weak var reloadButton: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var forwardBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var BackView: UIView!
    
    @IBOutlet weak var HomeView: UIView!
    @IBOutlet weak var HomeViewButtom: UIView!
    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!

    @IBOutlet var WebView: WKWebView!
    var pagNum = 0
    // Varibles     
    let Main_Url = "http://hadeer.azq1.com/book2/"
    let dropDown1 = DropDown()
    let Color = #colorLiteral(red: 0.4509052634, green: 0.8459502459, blue: 0.2923763692, alpha: 1)
   

    var lastContentOffset: CGFloat = 15
  
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBackForwardList()
        setupMakeDropDown()
       
        WebView.navigationDelegate = self
        WebView.scrollView.bounces = false
        pagNum = srarchData.pageIndex
        
        WebView.load(URLRequest(url: URL(string: "\(Main_Url)page\(pagNum).html")!))
        
        print("\(Main_Url)\(pagNum).html")
     
        backBtn.tintColor = Color
        forwardBtn.tintColor = Color
        menuBtn.tintColor = Color
        homeBtn.tintColor = Color
        BackView.isHidden = true
    }


    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
           
    func checkBackForwardList() {
        UIView.animate(withDuration: 0.4) {
            if self.pagNum == 107 {
                self.forwardBtn.tintColor = #colorLiteral(red: 0.8374213576, green: 0.8374213576, blue: 0.8374213576, alpha: 1)
            } else {
                self.forwardBtn.tintColor = self.Color
            }
            
            if self.pagNum == 1 {
                self.backBtn.tintColor = #colorLiteral(red: 0.8374213576, green: 0.8374213576, blue: 0.8374213576, alpha: 1)
            } else {
                self.backBtn.tintColor = self.Color
            }
        }
    }

    // Check connection
    func checkConnection() {
        if CheckInternet.Connection() == false {
            if Locale.current.languageCode == "ar" {
                Alert(Message: "تحقق من الاتصال بالانترنت")
            } else if Locale.current.languageCode == "en" {
                Alert(Message: "The Internet connection appears to be offline.")
            }
        } else {

        }
    }

    func Alert(Message: String) {
        let alert = UIAlertController(title: "", message: Message, preferredStyle: UIAlertController.Style.alert)
        if Locale.current.languageCode == "ar" {
            let action = UIAlertAction(title: "موافق", style: .default) { _ in
            }
            alert.addAction(action)
        } else if Locale.current.languageCode == "en" {
            let action = UIAlertAction(title: "OK", style: .default) { _ in
            }
            alert.addAction(action)
        }

        present(alert, animated: true, completion: nil)
    }

    // Reload pages
    func reload() {
        if CheckInternet.Connection() {
            if WebView.url != nil {
                WebView.reload()
            } else {
                WebView.load(URLRequest(url: URL(string: Main_Url)!))
            }
        }
    }

    // IBACTION
    @IBAction func backButton(_ sender: Any) {
        checkConnection()
        if pagNum > 1 {
            pagNum -= 1
            srarchData.pageIndex = pagNum
            WebView.load(URLRequest(url: URL(string: "\(Main_Url)page\(pagNum).html")!))
            print("\(Main_Url)\(pagNum).html")
        }
        // WebView.goBack()
    }

    @IBAction func HomeButton(_ sender: Any) {
        checkConnection()
        pagNum = 1
        srarchData.pageIndex = pagNum
        WebView.load(URLRequest(url: URL(string: "\(Main_Url)page\(pagNum).html")!))
        print("\(Main_Url)\(pagNum).html")

       
    }

    @IBAction func ForwardButton(_ sender: Any) {
        checkConnection()
        if pagNum < 107 {
            pagNum += 1
            srarchData.pageIndex = pagNum
            WebView.load(URLRequest(url: URL(string: "\(Main_Url)page\(pagNum).html")!))
            print("\(Main_Url)\(pagNum).html")
        }
        //  WebView.goForward()
    }

    @IBAction func refresh(_ sender: Any) {
        reload()
    }

    @IBAction func menu(_ sender: Any) {
        dropDown1.show()
    }

    //
}

extension ViewController: UIScrollViewDelegate {
    // this delegate is called when the scrollView (i.e your UITableView) will start scrolling
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        lastContentOffset = scrollView.contentOffset.y
    }

    // while scrolling this delegate is being called so you may now check which direction your scrollView is being scrolled to
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if lastContentOffset < scrollView.contentOffset.y {
            // did move up
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                self.HomeView.alpha = 0.0
                self.HomeViewButtom.alpha = 0.0
              
            })
        } else if lastContentOffset > scrollView.contentOffset.y {
            // did move down
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.HomeView.alpha = 1.0
                self.HomeViewButtom.alpha = 1.0
              
            })
        } else {
            // didn't move
        }
    }

    //
}

extension ViewController {
    func setupMakeDropDown() {
        var title = [String]()
        dropDown1.selectionAction = { [unowned self] (index: Int, _: String) in
            self.pagNum = srarchData.dict[index].index
            srarchData.pageIndex = self.pagNum
            self.WebView.load(URLRequest(url: URL(string: "\(self.Main_Url)page\(self.pagNum).html")!))
            print("\(self.Main_Url)page\(self.pagNum).html")

        }
        dropDown1.selectionBackgroundColor = Color
        dropDown1.selectedTextColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        for t in srarchData.dict {
            title.append(t.title)
        }
        dropDown1.dataSource = title
        dropDown1.anchorView = menuBtn
        dropDown1.cornerRadius = 7
        dropDown1.direction = .top
        dropDown1.topOffset = CGPoint(x: 0, y: -40)
        dropDown1.backgroundColor = Color
        dropDown1.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        dropDown1.shadowColor = Color
        
    }
}


//
extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        HomeView.alpha = 1.0
        HomeViewButtom.alpha = 1.0
      
        checkConnection()
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        print("fail load frame")

    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
        print(error.localizedDescription)
        print("Start")
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        // checkConnection()
        checkBackForwardList()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceld")
    }
}
