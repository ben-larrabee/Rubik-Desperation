//
//  CubieCube.swift
//  Rubik's Cube Solver
//
//  Created by Ben Larrabee on 11/27/16.
//  Copyright © 2016 Christopher Stanley. All rights reserved.
//

import Foundation

//package org.kociemba.twophase;

//import static org.kociemba.twophase.Corner.*;
//import static org.kociemba.twophase.Edge.*;
enum Corner: Int {
  case URF = 0
  case UFL
  case ULB
  case UBR
  case DFR
  case DLF
  case DBL
  case DRB
}

enum Edge: Int {
  case UR = 0
  case UF
  case UL
  case UB
  case DR
  case DF
  case DL
  case DB
  case FR
  case FL
  case BL
  case BR
}

let cpU: [Corner] = [ .UBR, .URF, .UFL, .ULB, .DFR, .DLF, .DBL, .DRB ]
let coU: [Int] = [ 0, 0, 0, 0, 0, 0, 0, 0 ]
let epU: [Edge] = [ .UB, .UR, .UF, .UL, .DR, .DF, .DL, .DB, .FR, .FL, .BL, .BR ]
let eoU: [Int] = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]

let cpR: [Corner] = [ .DFR, .UFL, .ULB, .URF, .DRB, .DLF, .DBL, .UBR ]
let coR: [Int] = [ 2, 0, 0, 1, 1, 0, 0, 2 ]
let epR: [Edge] = [ .FR, .UF, .UL, .UB, .BR, .DF, .DL, .DB, .DR, .FL, .BL, .UR ]
let eoR: [Int] = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]

let cpF: [Corner] = [ .UFL, .DLF, .ULB, .UBR, .URF, .DFR, .DBL, .DRB ]
let coF: [Int] = [ 1, 2, 0, 0, 2, 1, 0, 0 ]
let epF: [Edge] = [ .UR, .FL, .UL, .UB, .DR, .FR, .DL, .DB, .UF, .DF, .BL, .BR ]
let eoF: [Int] = [ 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0 ]

let cpD: [Corner] = [ .URF, .UFL, .ULB, .UBR, .DLF, .DBL, .DRB, .DFR ]
let coD: [Int] = [ 0, 0, 0, 0, 0, 0, 0, 0 ]
let epD: [Edge] = [ .UR, .UF, .UL, .UB, .DF, .DL, .DB, .DR, .FR, .FL, .BL, .BR ]
let eoD: [Int] = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]

let cpL: [Corner] = [ .URF, .ULB, .DBL, .UBR, .DFR, .UFL, .DLF, .DRB ]
let coL: [Int] = [ 0, 1, 2, 0, 0, 2, 1, 0 ]
let epL: [Edge] = [ .UR, .UF, .BL, .UB, .DR, .DF, .FL, .DB, .FR, .UL, .DL, .BR ]
let eoL: [Int] = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]

let cpB: [Corner] = [ .URF, .UFL, .UBR, .DRB, .DFR, .DLF, .ULB, .DBL ]
let coB: [Int] = [ 0, 0, 1, 2, 0, 0, 2, 1 ]
let epB: [Edge] = [ .UR, .UF, .UL, .BR, .DR, .DF, .DL, .BL, .FR, .FL, .UB, .DB ]
let eoB: [Int] = [ 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1 ]

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

//Cube on the cubie level
class CubieCube {
  
  
  // initialize to Id-Cube
  
  // corner permutation
  var cp: [Corner] = [ .URF, .UFL, .ULB, .UBR, .DFR, .DLF, .DBL, .DRB ]
  
  // corner orientation
  var co: [Int] = [ 0, 0, 0, 0, 0, 0, 0, 0 ]
  
  // edge permutation
  var ep: [Edge] = [ .UR, .UF, .UL, .UB, .DR, .DF, .DL, .DB, .FR, .FL, .BL, .BR ]
  
  // edge orientation
  var eo: [Int] = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
  
  init() {
  }
  
  init(cp: [Corner], co: [Int], ep: [Edge], eo: [Int]) {
    self.cp = cp
    self.co = co
    self.ep = ep
    self.eo = eo
  }
  
  //Seems a bit unnecessary
  /*init(cp: [Corner], co: [Int], ep: [Edge], eo: [Int]) {
   for i in 0..<8 {
   self.cp[i] = cp[i]
   self.co[i] = co[i]
   }
   for i in 0..<12 {
   self.ep[i] = ep[i]
   self.eo[i] = eo[i]
   }
   }*/
  
  // ************************************** Moves on the cubie level ***************************************************
  
  
  
  // this CubieCube array represents the 6 basic cube moves
    var moveCube: [CubieCube] = [
        CubieCube(cp: cpU, co: coU, ep: epU, eo: eoU),
        CubieCube(cp: cpR, co: coR, ep: epR, eo: eoR),
        CubieCube(cp: cpF, co: coF, ep: epF, eo: eoF),
        CubieCube(cp: cpD, co: coD, ep: epD, eo: eoD),
        CubieCube(cp: cpL, co: coL, ep: epL, eo: eoL),
        CubieCube(cp: cpB, co: coB, ep: epB, eo: eoB)
    ]
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  /*
   CubieCube(Corner[] cp, byte[] co, Edge[] ep, byte[] eo) {
   this();
   for (int i = 0; i < 8; i++) {
   this.cp[i] = cp[i];
   this.co[i] = co[i];
   }
   for (int i = 0; i < 12; i++) {
   this.ep[i] = ep[i];
   this.eo[i] = eo[i];
   }
   }
   */
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // n choose k
  /*
   static int Cnk(int n, int k) {
   int i, j, s;
   if (n < k)
   return 0;
   if (k > n / 2)
   k = n - k;
   for (s = 1, i = n, j = 1; i != n - k; i--, j++) {
   s *= i;
   s /= j;
   }
   return s;
   }
   */
  func Cnk(n: Int, k: Int) -> Int {
    var s: Int = 1
    if n < k {
      return 0
    }
    for i in 1...k {
      s *= (n-i+1)
      s /= i
    }
    return s
  }
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // & is the referene symbol, and will need to be part of the funciton call
  func rotateLeft(arr: inout [Corner], l: Int, r: Int) -> () {
    // Left rotation of all array elements between l and r
    let temp: Corner = arr[l]
    for i in l..<r {
      arr[i] = arr[i + 1]
    }
    arr[r] = temp
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
  func rotateRight(arr: inout [Corner], l: Int, r: Int) -> () {
    // Right rotation of all array elements between l and r
    let temp: Corner = arr[r]
    for i in 0..<(r-l) {
      arr[r-i] = arr[r-i-1]
    }
    arr[l] = temp
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func rotateLeft(arr: inout [Edge], l: Int, r: Int) -> () {
    // Left rotation of all array elements between l and r
    let temp: Edge = arr[l];
    for i in l..<r {
      arr[i] = arr[i + 1]
    }
    arr[r] = temp;
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func rotateRight(arr: inout [Edge], l: Int, r: Int) -> () {
    // Right rotation of all array elements between l and r
    let temp: Edge = arr[r]
    for i in 0..<(r-l) {
      arr[r-i] = arr[r-i-1]
    }
    arr[l] = temp
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/*
  // return cube in facelet representation
  func toFaceCube() -> FaceCube {
    var fcRet = FaceCube()
    for c in 0...7 {
      let i = c;
      let j = cp[i].rawValue;// cornercubie with index j is at
      // cornerposition with index i
      var ori: Int = co[i];// Orientation of this cubie
      for n in 0..<3 {
        fcRet.f[FaceCube.cornerFacelet[i][(n + ori) % 3].rawValue] = FaceCube.cornerColor[j][n];
      }
    }
    for e in 0...11 {
      let i = e
      let j = ep[i].rawValue// edgecubie with index j is at edgeposition
      // with index i
      var ori: Int = eo[i];// Orientation of this cubie
      for n in 0..<2 {
        fcRet.f[FaceCube.edgeFacelet[i][(n + ori) % 2].ordinal()] = FaceCube.edgeColor[j][n];
      }
    }
    return fcRet;
  }
 */
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Multiply this CubieCube with another cubiecube b, restricted to the corners.<br>
  // Because we also describe reflections of the whole cube by permutations, we get a complication with the corners. The
  // orientations of mirrored corners are described by the numbers 3, 4 and 5. The composition of the orientations
  // cannot
  // be computed by addition modulo three in the cyclic group C3 any more. Instead the rules below give an addition in
  // the dihedral group D3 with 6 elements.<br>
  //
  // NOTE: Because we do not use symmetry reductions and hence no mirrored cubes in this simple implementation of the
  // Two-Phase-Algorithm, some code is not necessary here.
  //
  func cornerMultiply(b: CubieCube) {
    var cPerm: [Corner] = []
    var cOri: [Int]  = []
    for  corn in 0...7 {
      cPerm[corn] = cp[b.cp[corn].rawValue];
      
      let oriA: Int = co[b.cp[corn].rawValue];
      let oriB: Int = b.co[corn];
      var ori: Int = 0
      
      if (oriA < 3 && oriB < 3) {// if both cubes are regular cubes...
        ori = oriA + oriB // just do an addition modulo 3 here
        if (ori >= 3) {
          ori -= 3; // the composition is a regular cube
        }
        // +++++++++++++++++++++not used in this implementation +++++++++++++++++++++++++++++++++++
      } else if (oriA < 3 && oriB >= 3) {// if cube b is in a mirrored state...
        ori = oriA + oriB
        if (ori >= 6) {
          ori -= 3 // the composition is a mirrored cube
        }
      } else if (oriA >= 3 && oriB < 3) {// if cube a is an a mirrored state...
        ori = oriA - oriB
        if (ori < 3) {
          ori += 3 // the composition is a mirrored cube
        }
      } else if (oriA >= 3 && oriB >= 3) {// if both cubes are in mirrored states...
        ori = oriA - oriB
        if (ori < 0) {
          ori += 3; // the composition is a regular cube
        }
        // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
      }
      cOri[corn] = ori;
    }
    for c in 0...7 {
      cp[c] = cPerm[c]
      co[c] = cOri[c]
    }
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Multiply this CubieCube with another cubiecube b, restricted to the edges.
  func edgeMultiply(b: CubieCube) -> () {
    var ePerm: [Edge] = []
    var eOri: [Int] = []
    for edge in 0...12 {
      ePerm[edge] = ep[b.ep[edge].rawValue];
      eOri[edge] = ((b.eo[edge] + eo[b.ep[edge].rawValue]) % 2);
    }
    for e in 0...11 {
      ep[e] = ePerm[e]
      eo[e] = eOri[e];
    }
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Multiply this CubieCube with another CubieCube b.
  func multiply(b: CubieCube) -> () {
    cornerMultiply(b: b);
    // edgeMultiply(b: b);
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Compute the inverse CubieCube
  func invCubieCube(c: CubieCube) -> () {
    for edge in 0...11 {
      c.ep[ep[edge].rawValue] = Edge(rawValue: edge)!;
    }
    for edge in 0...11 {
      c.eo[edge] = eo[c.ep[edge].rawValue]
    }
    for corn in 0...7 {
      c.cp[cp[corn].rawValue] = Corner(rawValue: corn)!;
    }
    for corn in 0...7 {
      let ori: Int = co[c.cp[corn].rawValue];
      if (ori >= 3) {// Just for completeness. We do not invert mirrored cubes in the program.
        c.co[corn] = ori;
      } else {// the standard case
        c.co[corn] = -ori;
        if (c.co[corn] < 0) {
          c.co[corn] += 3
        }
      }
    }
  }
  
  // ********************************************* Get and set coordinates *********************************************
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // return the twist of the 8 corners. 0 <= twist < 3^7
  func getTwist() -> Int {
    var ret = 0
    for i in 0...7 {
      ret = (3 * ret + co[i])
    }
    return ret
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
  func setTwist(twist: Int) -> () {
    var twistParity = 0;
    var localTwist = twist
    for ii in 0...6 {
      let i = 6-ii
      co[i] = localTwist % 3
      twistParity += co[i]
      localTwist /= 3
    }
    co[7] = ((3 - twistParity % 3) % 3);
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // return the flip of the 12 edges. 0<= flip < 2^11
  func getFlip() -> Int {
    var ret = 0;
    for i in 0..<11 {
      ret = 2 * ret + eo[i]
    }
    return ret
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func setFlip(flip: inout Int) -> () {
    var flipParity = 0
    for ii in 0...10 {
      let i = 10 - ii
      eo[i] = flip % 2
      flipParity += eo[i]
      flip /= 2
    }
    eo[11] = ((2 - flipParity % 2) % 2)
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Parity of the corner permutation
  func cornerParity() -> Int {
    var s = 0
    for ii in 1...7 {
      let i = 8 - ii                    // 0 ... i - 1
      for jj in 0...(i-1) { //i-1 ... 0 down
        let j = i - 1 - jj
        if (cp[j].rawValue > cp[i].rawValue) {
          s += 1
        }
      }
    }
    return s % 2
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Parity of the edges permutation. Parity of corners and edges are the same if the cube is solvable.
  func edgeParity() -> Int {
    var s = 0
    for ii in 1...11 {// 11...1
      let i = 12 - ii
      for jj in 0...(i-1) {
        let j = (i - i) - jj
        if (ep[j].rawValue > ep[i].rawValue) {
          s += 1
        }
      }
    }
    return s % 2
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // permutation of the UD-slice edges FR,FL,BL and BR
  func getFRtoBR() -> Int {
    var a = 0, x = 0
    var edge4 : [Edge] = []
    // compute the index a < (12 choose 4) and the permutation array perm.
    for jj in 0...11 { // 0...11
      let j = jj - 11
      if (8 <= ep[j].rawValue && ep[j].rawValue <= 11) {
        a += Cnk(n: 11 - j, k: x + 1);
        x += 1
        edge4[3 - x] = ep[j];
      }
    }
    var b = 0;
    for jj in 1...3 {// compute the index b < 4! for the permutation in perm// 3...1
      let j = 4 - jj
      var k = 0
      while (edge4[j].rawValue != j + 8) {
        rotateLeft(arr: &edge4, l: 0, r: j)
        k += 1
      }
      b = (j + 1) * b + k
    }
    return (24 * a + b)
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func setFRtoBR(idx: Int) -> () {
    var x: Int
    var sliceEdge: [Edge] = [ .FR, .FL, .BL, .BR ]
    var otherEdge: [Edge] = [ .UR, .UF, .UL, .UB, .DR, .DF, .DL, .DB ]
    var b = idx % 24; // Permutation
    var a = idx / 24; // Combination
    for e in 0...11 {
      ep[e] = .DB// Use UR to invalidate all edges
    }
    var k: Int
    for j in 1..<4 {// generate permutation from index b
      k = b % (j + 1)
      b /= j + 1;
      while (k - 1 > 0) {
        k -= 1
        rotateRight(arr: &sliceEdge, l: 0, r: j)
      }
    }
    x = 3// generate combination and set slice edges
    for j in 0...11 {
      if (a - Cnk(n: 11 - j, k: x + 1) >= 0) {
        ep[j] = sliceEdge[3 - x];
        x -= 1
        a -= Cnk(n: 11 - j, k: x + 1);
      }
    }
    x = 0; // set the remaining edges UR..DB
    for j in 0...11 {
      if (ep[j] == .DB) {
        x+=1
        ep[j] = otherEdge[x]
      }
    }
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Permutation of all corners except DBL and DRB
  func getURFtoDLF() -> Int {
    var a = 0, x = 0
    var corner6 : [Corner] = []
    // compute the index a < (8 choose 6) and the corner permutation.
    for j in 0...7 {
      if ((cp[j]).rawValue <= 5) {
        a += Cnk(n: j, k: x + 1)
        x += 1
        corner6[x] = cp[j];
      }
    }
    var b = 0;
    for jj in 1...5 {// compute the index b < 6! for the permutation in corner6 // 5...1
      let j = 6 - jj
      var k = 0
      while (corner6[j].rawValue != j) {
        rotateLeft(arr: &corner6, l: 0, r: j)
        k += 1
      }
      b = (j + 1) * b + k
    }
    return (720 * a + b)
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func setURFtoDLF(idx: Int) -> () {
    var x: Int
    var corner6: [Corner] = [ .URF, .UFL, .ULB, .UBR, .DFR, .DLF ]
    var otherCorner: [Corner] = [ .DBL, .DRB ]
    var b = idx % 720 // Permutation
    var a = idx / 720 // Combination
    for c in 0...7 {
      cp[c] = .DRB// Use DRB to invalidate all corners
    }
    var k = 0
    for j in 1..<6 {// generate permutation from index b
      k = b % (j + 1)
      b /= j + 1
      k -= 1
      while (k > 0) {
        k -= 1
        rotateRight(arr: &corner6, l: 0, r: j)
      }
    }
    x = 5;// generate combination and set corners
    for jj in 0...7 {
      let j = 7 - jj
      if (a - Cnk(n: j, k: x + 1) >= 0) {
        cp[j] = corner6[x];
        x -= 1
        a -= Cnk(n: j, k: x + 1)
      }
    }
    x = 0;
    for j in 0...7 {
      if (cp[j] == .DRB) {
        x += 1
        cp[j] = otherCorner[x];
      }
    }
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Permutation of the six edges UR,UF,UL,UB,DR,DF.
  func getURtoDF() -> Int {
    var a = 0, x = 0
    var edge6: [Edge] = []
    // compute the index a < (12 choose 6) and the edge permutation.
    for j in 0...11 {
      if (ep[j].rawValue <= 5) {
        a += Cnk(n: j, k: x + 1)
        x += 1
        edge6[x] = ep[j]
      }
    }
    
    var b = 0;
    // compute the index b < 6! for the permutation in edge6 5...1
    for jj in 1...5 {
      let j = 6 - jj
      var k = 0
      while (edge6[j].rawValue != j) {
        rotateLeft(arr: &edge6, l: 0, r: j)
        k+=1
      }
      b = (j + 1) * b + k
    }
    return 720 * a + b
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func setURtoDF(idx: Int) -> () {
    var x: Int
    var edge6: [Edge] = [ .UR, .UF, .UL, .UB, .DR, .DF ]
    var otherEdge: [Edge] = [ .DL, .DB, .FR, .FL, .BL, .BR ]
    var b = idx % 720 // Permutation
    var a = idx / 720 // Combination
    for e in 0...11 {
      ep[e] = .BR// Use BR to invalidate all edges
    }
    var k: Int
    for j in 1..<6 {// generate permutation from index b
      k = b % (j + 1)
      b /= j + 1
      k -= 1
      while (k > 0){
        k -= 1
        rotateRight(arr: &edge6, l: 0, r: j)
      }
    }
    x = 5;// generate combination and set edges
    for jj in 0...11 {
      let j = 11 - jj
      if (a - Cnk(n: j, k: x + 1) >= 0) {
        ep[j] = edge6[x];
        x -= 1
        a -= Cnk(n: j, k: x + 1);
      }
    }
    x = 0; // set the remaining edges DL..BR
    for j in 0...11 {
      if (ep[j] == .BR) {
        x += 1
        ep[j] = otherEdge[x];
      }
    }
  }
  
  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Permutation of the six edges UR,UF,UL,UB,DR,DF
  public static func getURtoDF(idx1: Int, idx2: Int) -> Int {
    let a = CubieCube()
    let b = CubieCube()
    a.setURtoUL(idx: idx1)
    b.setUBtoDF(idx: idx2)
    for i in 0..<8 {
      if (a.ep[i] != .BR) {
        if (b.ep[i] != .BR) {// collision
          return -1;
        } else {
          b.ep[i] = a.ep[i];
        }
      }
    }
    return b.getURtoDF();
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Permutation of the three edges UR,UF,UL
  func getURtoUL() -> Int {
    var a = 0, x = 0
    var edge3: [Edge] = []
    // compute the index a < (12 choose 3) and the edge permutation.
    //for (int j = UR.ordinal(); j <= BR.ordinal(); j++)
    for j in 0...11 {
      if (ep[j].rawValue <= 2) {
        a += Cnk(n: j, k: x+1) // should be right
        x += 1
        edge3[x] = ep[j];
      }
    }
    var b = 0;
    for jj in 1...2 {// compute the index b < 3! for the permutation in edge3
      let j = 3 - jj
      var k = 0;
      while (edge3[j].rawValue != j) {
        rotateLeft(arr: &edge3, l: 0, r: j)
        k += 1
      }
      b = (j + 1) * b + k
    }
    return (6 * a + b)
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func setURtoUL(idx: Int) -> () {
    var x: Int
    var edge3: [Edge] = [ .UR, .UF, .UL ]
    var b = idx % 6; // Permutation
    var a = idx / 6; // Combination
    for e in 0...11 {
      ep[e] = .BR // Use BR to invalidate all edges
    }
    var k: Int
    for j in 1...2 {// generate permutation from index b
      k = b % (j + 1);
      b /= j + 1;
      k -= 1
      while (k > 0) {
        k -= 1
        rotateRight(arr: &edge3, l: 0, r: j)
      }
    }
    x = 2;// generate combination and set edges
    for jj in 0...11 {
      let j = 11 - jj
      if (a - Cnk(n: j, k: x + 1) >= 0) {
        ep[j] = edge3[x];
        x -= 1
        a -= Cnk(n: j, k: x + 1)
      }
    }
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Permutation of the three edges UB,DR,DF
  func getUBtoDF() -> Int {
    var a = 0, x = 0;
    var edge3: [Edge] = []
    // compute the index a < (12 choose 3) and the edge permutation.
    for j in 0...11 {
      if (3 <= j && j <= 5) {
        a += Cnk(n: j, k: x + 1)
        x += 1
        edge3[x] = ep[j];
      }
    }
    
    var b = 0;
    for jj in 1...2 { // compute the index b < 3! for the permutation in edge3
      let j = 3 - jj
      var k = 0;
      while (edge3[j].rawValue != 3 + j) {
        rotateLeft(arr: &edge3, l: 0, r: j)
        k+=1;
      }
      b = (j + 1) * b + k;
    }
    return (6 * a + b);
  }
  
  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func setUBtoDF(idx: Int) -> () {
    var x: Int
    var edge3: [Edge] = [ .UB, .DR, .DF ]
    var b = idx % 6; // Permutation
    var a = idx / 6; // Combination
    for e in 0...11 {
      ep[e] = .BR// Use BR to invalidate all edges
    }
    var k: Int
    for j in 1...2 {// generate permutation from index
      k = b % (j + 1);
      b /= j + 1;
      k -= 1
      while (k > 0) {
        k -= 1
        rotateRight(arr: &edge3, l: 0, r: j)
      }
    }
    x = 2// generate combination and set edges
    for jj in 0...11 {
      let j = 11 - jj
      if (a - Cnk(n: j, k: x+1) > 0) {
        ep[j] = edge3[x]
        x -= 1
        a -= Cnk(n: j, k: x + 1)
      }
    }
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func getURFtoDLB() -> Int {
    var perm: [Corner] = []
    var b = 0
    for i in 0...7 {
      perm[i] = cp[i];
    }
    for jj in 1...7 { // compute the index b < 8! for the permutation in perm
      let j = 8 - jj
      var k = 0
      while (perm[j].rawValue != j) {
        rotateLeft(arr: &perm, l: 0, r: j)
        k += 1
      }
      b = (j + 1) * b + k;
    }
    return b
  }
  
  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func setURFtoDLB(idx: inout Int) -> () {
    var perm: [Corner] = [ .URF, .UFL, .ULB, .UBR, .DFR, .DLF, .DBL, .DRB ]
    var k: Int
    for j in 1...7 {
      k = idx % (j + 1);
      idx /= j + 1;
      k -= 1
      while (k > 0) {
        k -= 1
        rotateRight(arr: &perm, l: 0, r: j)
      }
    }
    var x = 7;// set corners
    for jj in 0...7 {
      let j = 7 - jj
      x -= 1
      cp[j] = perm[x]
    }
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func getURtoBR() -> Int {
    var perm: [Edge] = []
    var b = 0
    for i in 0...11 {
      perm[i] = ep[i]
    }
    for jj in 1...11 { // compute the index b < 12! for the permutation in perm
      let j = 12 - jj
      var k = 0;
      while (perm[j].rawValue != j) {
        rotateLeft(arr: &perm, l: 0, r: j)
        k += 1
      }
      b = (j + 1) * b + k;
    }
    return b;
  }
  
  // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  func setURtoBR(idx: inout Int) -> () {
    var perm: [Edge] = [ .UR, .UF, .UL, .UB, .DR, .DF, .DL, .DB, .FR, .FL, .BL, .BR ]
    var k: Int
    for j in 1...11 {
      k = idx % (j + 1);
      idx /= j + 1;
      k -= 1
      while (k > 0) {
        k -= 1
        rotateRight(arr: &perm, l: 0, r: j)
      }
    }
    var x = 11;// set edges
    for jj in 0...11 {
      let j = 11 - jj
      x -= 1
      ep[j] = perm[x]
    }
  }
  
  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Check a cubiecube for solvability. Return the error code.
  // 0: Cube is solvable
  // -2: Not all 12 edges exist exactly once
  // -3: Flip error: One edge has to be flipped
  // -4: Not all corners exist exactly once
  // -5: Twist error: One corner has to be twisted
  // -6: Parity error: Two corners ore two edges have to be exchanged
  func verify() -> Int {
    var sum = 0
    var edgeCount: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    for e in 0...11 {
      edgeCount[ep[e].rawValue] += 1;
    }
    for i in 0...11 {
      if edgeCount[i] != 1 {
        return -2
      }
    }
    for i in 0...11 {
      sum += eo[i]
    }
    if (sum % 2 != 0) {
      return -3;
    }
    
    var cornerCount: [Int] = [0, 0, 0, 0, 0, 0, 0, 0]
    for c in 0...7 {
      cornerCount[cp[c].rawValue] += 1
    }
    for i in 0...7 {
      if (cornerCount[i] != 1) {
        return -4;// missing corners
      }
    }
    sum = 0
    for i in 0...7 {
      sum += co[i]
      if (sum % 3 != 0){
        return -5;// twisted corner
      }
    }
    
    if ((edgeParity() ^ cornerParity()) != 0){
      return -6;// parity error
    }
    return 0;// cube ok
  }
}
