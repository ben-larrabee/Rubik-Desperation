//package org.kociemba.twophase;

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Representation of the cube on the coordinate level
class CoordCube {
    
    let N_TWIST = 2187// 3^7 possible corner orientations
    let N_FLIP = 2048// 2^11 possible edge flips
    let N_SLICE1 = 495// 12 choose 4 possible positions of FR,FL,BL,BR edges
    let N_SLICE2 = 24 // 4! permutations of FR,FL,BL,BR edges in phase2
    let N_PARITY = 2// 2 possible corner parities
    let N_URFtoDLF = 20160// 8!/(8-6)! permutation of URF,UFL,ULB,UBR,DFR,DLF corners
    let N_FRtoBR = 11880 // 12!/(12-4)! permutation of FR,FL,BL,BR edges
    let N_URtoUL = 1320 // 12!/(12-3)! permutation of UR,UF,UL edges
    let N_UBtoDF = 1320 // 12!/(12-3)! permutation of UB,DR,DF edges
    let N_URtoDF = 20160 // 8!/(8-6)! permutation of UR,UF,UL,UB,DR,DF edges in phase2
    
    let N_URFtoDLB = 40320;// 8! permutations of the corners
    let N_URtoBR = 479001600;// 8! permutations of the corners
    
    let N_MOVE = 18;
    
    // All coordinates are 0 for a solved cube except for UBtoDF, which is 114
    var twist: Int
    var flip: Int
    var parity: Int
    var FRtoBR: Int
    var URFtoDLF: Int
    var URtoUL: Int
    var UBtoDF: Int
    var URtoDF: Int
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Generate a CoordCube from a CubieCube
    init(c: CubieCube){
        twist = c.getTwist()
        flip = c.getFlip()
        parity = c.cornerParity()
        FRtoBR = c.getFRtoBR()
        URFtoDLF = c.getURFtoDLF()
        URtoUL = c.getURtoUL()
        UBtoDF = c.getUBtoDF()
        URtoDF = c.getURtoDF()// only needed in phase2
    }
    /*
    
    // A move on the coordinate level
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    func move(m:Int) -> () {
        twist = twistMove[twist][m];
        flip = flipMove[flip][m];
        parity = CoordCube.parityMove[parity][m];
        FRtoBR = FRtoBR_Move[FRtoBR][m];
        URFtoDLF = URFtoDLF_Move[URFtoDLF][m];
        URtoUL = URtoUL_Move[URtoUL][m];
        UBtoDF = UBtoDF_Move[UBtoDF][m];
        if (URtoUL < 336 && UBtoDF < 336){// updated only if UR,UF,UL,UB,DR,DF
        // are not in UD-slice
        URtoDF = MergeURtoULandUBtoDF[URtoUL][UBtoDF];
        }
    }

    // ******************************************Phase 1 move tables*****************************************************
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Move table for the twists of the corners
    // twist < 2187 in phase 2.
    // twist = 0 in phase 2.
    lazy var twistMove: [[Int]] = { [unowned self] in
        

        let cubieCube = CubieCube()
        var array: [[Int]] = [[]]
        
        for i in 0..<2187 { //N_TWIST
            cubieCube.setTwist(twist: i)
            
            for j in 0..<6 {
                for k in 0..<3 {
                    cubieCube.cornerMultiply(b: CubieCube.moveCube[j])
                    array[i][3 * j + k] = cubieCube.getTwist()
                }
                
                cubieCube.cornerMultiply(b: CubieCube.moveCube[j])
            }
        }
 
        return array
    }()
    
    

    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Move table for the flips of the edges
    // flip < 2048 in phase 1
    // flip = 0 in phase 2.
    
    lazy var flipMove: [[Int]] = { [unowned self] in
    
    let cubieCube = CubieCube()
    var array: [[Int]] = [[]]

    for i in 0..<2048 {//N_FLIP
        cubieCube.setFlip(flip: &i)
    
        for j in 0..<6 {
            for k in 0..<3 {
                cubieCube.edgeMultiply(b: CubieCube.moveCube[j])
                array[i][3 * j + k] = cubieCube.getFlip()
            }
    
            cubieCube.edgeMultiply(b: CubieCube.moveCube[j])
        }
    }
        
    return array
    }()
    
    
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Parity of the corner permutation. This is the same as the parity for the edge permutation of a valid cube.
    // parity has values 0 and 1
    static let parityMove: [[Int]]  = [ [ 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1 ],
    [ 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0 ] ]
    
    

    // ***********************************Phase 1 and 2 movetable********************************************************
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Move table for the four UD-slice edges FR, FL, Bl and BR
    // FRtoBRMove < 11880 in phase 1
    // FRtoBRMove < 24 in phase 2
    // FRtoBRMove = 0 for solved cube
    lazy var FRtoBR_Move: [[Int]] = { [unowned self] in
        
    let cubieCube = CubieCube()
    let array: [[Int]] = [[]]
        
        for i in 0..<11880 {//N_FRtoBR
            cubieCube.setFRtoBR = i
            
            for j in 0..<6 {
                for k in 0..<3 {
                    cubieCube.edgeMultiply(CubieCube.moveCube[j])
                    array[i][3 * j + k] = cubieCube.getFRtoBR()
                }
            
            
            cubieCube.edgeMultiply(CubieCube.moveCube[j])
        }
    }
        
    return array
}()



    
    // *******************************************Phase 1 and 2 movetable************************************************
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Move table for permutation of six corners. The positions of the DBL and DRB corners are determined by the parity.
    // URFtoDLF < 20160 in phase 1
    // URFtoDLF < 20160 in phase 2
    // URFtoDLF = 0 for solved cube.
    
    lazy var URFtoDLF_Move: [[Int]] = { [unowned self] in
        
    let cubieCube = CubieCube()
    let array: [[Int]] = [[]]
        
        for i in 0..<N_URFtoDLF {
            cubieCube.setURFtoDLF = i
            
            for j in 0..<6 {
                for k in 0..3 {
                    cubieCube.cornerMultiply(cubieCube.moveCube[j])
                    array[i][3 * j + k] = cubieCube.getURFtoDLF()
                }
                
                cubieCube.cornerMultiply(CubieCube.moveCube[j])
            }
        }
        
        return array
    }()
    
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Move table for the permutation of six U-face and D-face edges in phase2. The positions of the DL and DB edges are
    // determined by the parity.
    // URtoDF < 665280 in phase 1
    // URtoDF < 20160 in phase 2
    // URtoDF = 0 for solved cube.
    
    
    lazy var URtoDF_Move: [[Int]] = { [unowned self] in
        
        let cubieCube = CubieCube()
        let array: [[Int]] = [[]]
        
        for i in 0..<N_URtoDF {
            cubieCube.setURtoDF = i
            for j in 0..<6 {
                for k in 0..3 {
                    cubieCube.edgeMultiply(cubieCube.moveCube[j])
                    array[i][3 * j + k] = cubieCube.getURtoDF()
                }
                
                cubieCube.edgeMultiply(CubieCube.moveCube[j])
            }
        }
        
        return array
        }()
    
    
    // **************************helper move tables to compute URtoDF for the beginning of phase2************************
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    lazy var URtoUL_Move: [[Int]] = { [unowned self] in
        
        let cubieCube = CubieCube()
        let array: [[Int]] = [[]]
        
        for i in 0..<N_URtoUL {
            cubieCube.setURtoUL = i
            for j in 0..<6 {
                for k in 0..3 {
                    cubieCube.edgeMultiply(cubieCube.moveCube[j])
                    array[i][3 * j + k] = cubieCube.getURtoUL()
                }
                
                cubieCube.edgeMultiply(CubieCube.moveCube[j])
            }
        }
        
        return array
        }()

    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    lazy var UBtoDF_Move: [[Int]] = { [unowned self] in
        
        let cubieCube = CubieCube()
        let array: [[Int]] = [[]]
        
        for i in 0..<N_UBtoDF {
            cubieCube.setUBtoDF = i
            for j in 0..<6 {
                for k in 0..3 {
                    cubieCube.edgeMultiply(cubieCube.moveCube[j])
                    array[i][3 * j + k] = cubieCube.getUBtoDF()
                }
                
                cubieCube.edgeMultiply(CubieCube.moveCube[j])
            }
        }
        
        return array
        }()
    

    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    
    // Table to merge the coordinates of the UR,UF,UL and UB,DR,DF edges at the beginning of phase2

    
    lazy var MergeURtoULandUBtoDF: [[Int]] = { [unowned self] in
    let array: [[Int]] = [[]]
        
        for uRtoUL in 0..<336 {
            for uBtoDF in 0..<336 {
                array[uRtoUL][uBtoDF] = CubieCube.getURtoDF(uRtoUL, uBtoDF)
            }
        }
        return array
    }()
    
    
    
    
    
    
    
   
    // ****************************************Pruning tables for the search*********************************************
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Pruning table for the permutation of the corners and the UD-slice edges in phase2.
    // The pruning table entries give a lower estimation for the number of moves to reach the solved cube.
   
    
    
    lazy var Slice_URFtoDLF_Parity_Prun = { [unowned self] -> [Int] in
    let array: [Int] = []
        
        for i in 0..<N_SLICE2 * N_URFtoDLF * N_PARITY / 2 {
            array[i] = -1
            var depth = 0
            setPruning(array, 0, 0)
            var done = 1
            
            while done != N_SLICE2 * N_URFtoDLF * N_PARITY {
                for i in 0..<N_SLICE2 * N_URFtoDLF * N_PARITY {
                    var parity: Int = i % 2
                    var URFtoDLF: Int = (i / 2) / N_SLICE2
                    var slice: Int = (i / 2) % N_SLICE2
                    if (getPruning(array, i) == depth) {
                        for j in 0..<18 {
                            switch j {
                            case 3, 5, 6, 8, 12, 14, 15, 17:
                                continue;
                            default:
                                var newSlice: Int = FRtoBR_Move[slice][j]
                                var newURFtoDLF: Int = URFtoDLF_Move[URFtoDLF][j]
                                var newParity: Int = parityMove[parity][j]
                                if (getPruning(array, (N_SLICE2 * newURFtoDLF + newSlice) * 2 + newParity) == 0x0f) {
                                    setPruning(array, (N_SLICE2 * newURFtoDLF + newSlice) * 2 + newParity,
                                    (depth + 1))
                                    done += 1
                                }
                            }
                        }
                    }
                }
                depth += 1
            }
        }
        return array

    }()
    
    
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Pruning table for the permutation of the edges in phase2.
    // The pruning table entries give a lower estimation for the number of moves to reach the solved cube.
        lazy var Slice_URtoDF_Parity_Prun = { [unowned self] -> [Int] in
            let array: [Int] = []
            
            for i in 0..<N_SLICE2 * N_URtoDF * N_PARITY / 2 {
                array[i] = -1
                var depth = 0
                setPruning(array, 0, 0)
                var done = 1
                
                while done != N_SLICE2 * N_URtoDF * N_PARITY {
                    for i in 0..<N_SLICE2 * N_URtoDF * N_PARITY {
                        var parity: Int = i % 2
                        var URtoDF: Int = (i / 2) / N_SLICE2
                        var slice: Int = (i / 2) % N_SLICE2
                        if (getPruning(array, i) == depth) {
                            for j in 0..<18 {
                                switch j {
                                case 3, 5, 6, 8, 12, 14, 15, 17:
                                    continue;
                                default:
                                    var newSlice: Int = FRtoBR_Move[slice][j]
                                    var newURtoDF: Int = URtoDF_Move[URFtoDLF][j]
                                    var newParity: Int = parityMove[parity][j]
                                    if (getPruning(array, (N_SLICE2 * newURtoDF + newSlice) * 2 + newParity) == 0x0f) {
                                        setPruning(array, (N_SLICE2 * newURtoDF + newSlice) * 2 + newParity,
                                                   (depth + 1))
                                        done += 1
                                    }
                                }
                            }
                        }
                    }
                    depth += 1
                }
            }
            return array
    }()
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Pruning table for the twist of the corners and the position (not permutation) of the UD-slice edges in phase1
    // The pruning table entries give a lower estimation for the number of moves to reach the H-subgroup.
   
        lazy var Slice_Twist_Prun: [Int] = { [unowned, self] -> in
        let array: [Int] = []
        
        for i in 0..<N_SLICE1 * N_TWIST / 2 + 1 {
            array[i] = -1
            var depth: Int = 0
            setPruning(array, 0, 0)
            var done: Int = 1
            
            while done != N_SLICE1 * N_TWIST {
                for i in 0..<N_SLICE1 * N_TWIST {
                    var twist: Int = i / N_SLICE1
                    var slice: Int = i % N_SLICE1
                    if (getPruning(array, i) == depth) {
                        for j in 0..<18 {
                            var newSlice: Int = FRtoBR_Move[slice * 24][j] / 24
                            var newTwist: Int = twistMove[twist][j]
                            if (getPruning(array, N_SLICE1 * newTwist + newSlice) == 0x0f) {
                                setPruning(array, N_SLICE1 * newTwist + newSlice, (depth + 1))
                                done += 1
                            }
                        }
                    }
                }
                depth += 1
            }
        }
            return array
    }()
    
            
    
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Pruning table for the flip of the edges and the position (not permutation) of the UD-slice edges in phase1
    // The pruning table entries give a lower estimation for the number of moves to reach the H-subgroup.
    
    lazy var Slice_Flip_Prun: [Int] = { [unowned, self] -> in
        let array: [Int] = []
        
        for i in 0..<N_SLICE1 * N_TWIST / 2 {
            array[i] = -1
            var depth: Int = 0
            setPruning(array, 0, 0)
            var done: Int = 1
            
            while done != N_SLICE1 * N_FLIP {
                for i in 0..<N_SLICE1 * N_FLIP {
                    var flip: Int = i / N_SLICE1
                    var slice: Int = i % N_SLICE1
                    if (getPruning(array, i) == depth) {
                        for j in 0..<18 {
                            var newSlice: Int = FRtoBR_Move[slice * 24][j] / 24
                            var newFlip: Int = flipMove[flip][j]
                            if (getPruning(array, N_SLICE1 * newFlip + newSlice) == 0x0f) {
                                setPruning(array, N_SLICE1 * newFlip + newSlice, (depth + 1))
                                done += 1
                            }
                        }
                    }
                }
                depth += 1
            }
        }
        return array
    }()
    
    
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Set pruning value in table. Two values are stored in one byte.
    void setPruning(byte[] table, int index, byte value) {
    if ((index & 1) == 0) {
    table[index / 2] &= 0xf0 | value;
    } else {
    table[index / 2] &= 0x0f | (value << 4);
    }
    }
    
    // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    // Extract pruning value
    getPruning(byte[] table, int index) {
    if ((index & 1) == 0) {
    return (byte) (table[index / 2] & 0x0f);
    } else {
    return (byte) ((table[index / 2] & 0xf0) >>> 4);
    }
    }
 */
}
