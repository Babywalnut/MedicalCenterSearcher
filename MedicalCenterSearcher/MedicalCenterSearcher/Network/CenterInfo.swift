//
//  CenterInfo.swift
//  MedicalCenterSearcher
//
//  Created by 김민성 on 2022/10/16.
//

import Foundation

struct CenterInfo: Decodable {
  var page: Int
  var perPage: Int
  var totalCount: Int
  var currentCount: Int
  var matchCount: Int
  var data: [CenterModel]
}

struct CenterModel: Decodable {
  var centerName: String
  var facilityName: String
  var address: String
  var lat: String
  var lng: String
  var phoneNumber: String
  var updatedAt: String
  var convertedUpdatedAt: Date?
}
