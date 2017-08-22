//
//	ActInfo.swift
//  Created by 郝松岩 on 2017/8/22.
//  Copyright © 2017年 hsy. All rights reserved.

import Foundation

struct ActInfo{

	var icon : String!
	var uid : Int!


	/**
	 * 用字典来初始化一个实例并设置各个属性值
	 */
	init(fromDictionary dictionary: NSDictionary){
		icon = dictionary["icon"] as? String
		uid = dictionary["uid"] as? Int
	}

	/**
	 * 把所有属性值存到一个NSDictionary对象，键是相应的属性名。
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if icon != nil{
			dictionary["icon"] = icon
		}
		if uid != nil{
			dictionary["uid"] = uid
		}
		return dictionary
	}

}
