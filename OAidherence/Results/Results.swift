//
//  Results.swift
//  OAidherence
//
//  Created by Yue chen Yu on 2022-12-05.
//

struct Results: Decodable {
    var id: Int?
    var exercises: [String]? // Array of available exercises to select in drop-down menu
    var summaryGraphTitle: String?
    var summaryGraphXLabel: String?
    var summaryGraphYLabel: String?
    var problems: [Problem]?
}

struct Problem: Decodable, Hashable {
    var icon: String?
    var name: String?
//        var problemDescription: String
//        var problemImage: Image
//        var solutionDescription: String
//        var solutionImage: Image
}
