//
//  SCNGeometry+Plane.swift
//  SCNCustomGeometries
//
//  Created by Max Cobb on 28/10/2018.
//  Copyright © 2018 Max Cobb. All rights reserved.
//

import SceneKit.SCNGeometry

extension SCNGeometry {
	static func Plane(width: CGFloat, height: CGFloat) -> SCNGeometry {
		let src = SCNGeometrySource(vertices: [
			SCNVector3(-width / 2, -height / 2, 0),
			SCNVector3(width / 2, -height / 2, 0),
			SCNVector3(-width / 2, height / 2, 0),
			SCNVector3(width / 2, height / 2, 0),
		])
		let indices: [UInt32] = [0, 1, 2, 3]
		let normals = SCNGeometrySource(normals: [SCNVector3](repeating: SCNVector3(0, 0, 1), count: 4) )
		let textureMap = SCNGeometrySource(textureCoordinates: [
			CGPoint(x: 0, y: 1),
			CGPoint(x: 1, y: 1),
			CGPoint(x: 0, y: 0),
			CGPoint(x: 1, y: 0)
		])
		let inds = SCNGeometryElement(indices: indices, primitiveType: .triangleStrip)
		return SCNGeometry.init(sources: [src, normals, textureMap], elements: [inds])
	}
}
