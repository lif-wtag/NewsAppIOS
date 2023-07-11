//
//  Constants.swift
//  NewsAppIOS
//
//  Created by Mizanur Remon on 11/7/23.
//

import Foundation

struct Constants{
    static let APIKEY = "4025478574c04e54b42d68f81393f84c"
    static let topHeadlines = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(APIKEY)")
    //static let topHeadlines = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=4025478574c04e54b42d68f81393f84c")
    static let everything = URL(string:"https://newsapi.org/v2/everything?q=bitcoin&apiKey=API_KEY")
}
