import Cocoa

// Optionals

var strName : String?

strName = "Ashish"
// One way of handling optional
if strName != nil {
    print(strName!)
}

// If let statement
 if let name = strName {
    
    print(name)
}
/*
private static void sampleFunc(String str){
    
}*/

var iValue : Int?



func sampleFunctionForGuard(strVal : String?){
    // print the string
    
    guard let name = strName else { return}
    
    print(name)
    
    
}














