//
//  ChatbotSDK.swift
//  ChatbotSDK
//
//  Created by Khirish Meshram on 26/04/22.
//

import Foundation
import WebKit
import AVFoundation

public class ChatbotSDK: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webView: WKWebView = WKWebView()
    let webViewController = UIViewController()

//  Display & configure webview
    public func dispWebView(viewController: UIViewController) {
        let config: WKWebViewConfiguration = WKWebViewConfiguration()
        config.preferences.javaScriptCanOpenWindowsAutomatically = true
        config.userContentController.add(self, name: "close")
        config.userContentController.add(self, name: "speechToText")
        
        let preferences: WKWebpagePreferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        
        webView.configuration.defaultWebpagePreferences = preferences
        webView = WKWebView(frame: viewController.view.frame, configuration: config)
        webView.navigationDelegate = viewController.self as? WKNavigationDelegate
        webView.uiDelegate = webViewController.self as? WKUIDelegate
        webView.translatesAutoresizingMaskIntoConstraints = true
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        webViewController.view.addSubview(webView)
//  Change string url to with verified url
        if let _url = URL(string: "https://easychat-dev.allincall.in/chat/index/?id=602&channel=iOS") {
            let request = URLRequest(url: _url)
            webView.load(request)
        }
        webViewController.modalPresentationStyle = .fullScreen
        viewController.present(webViewController, animated: true, completion: nil)
    }
    
//  Text to Voice Conversion
    public func textToVoice(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
}

//  Handle User response for Webview Interface
extension ChatbotSDK: WKScriptMessageHandler {
    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        if message.name == "close" {
            webViewController.dismiss(animated: true, completion: nil)
            
        } else if message.name == "speechToText" {
            print(" I am speech to Text ")
//  Handle Speech to Text Here
            let alertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: .actionSheet)
            let margin: CGFloat = 8.0
            let rect = CGRect(x: margin, y: margin, width: alertController.view.bounds.size.width - margin * 4.0, height: 100.0)
            let customView = UITextView(frame: rect)
            customView.backgroundColor = UIColor.clear
            customView.font = UIFont(name: "Helvetica", size: 20)
            alertController.view.addSubview(customView)
            let doneAction = UIAlertAction(title: "DONE", style: UIAlertAction.Style.cancel, handler: { _ in
                if let voiceText = customView.text {
                    self.webView.evaluateJavaScript("speech_intent_for_ios('\(voiceText)')", completionHandler: nil)
                }
            })
            alertController.addAction(doneAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
}


