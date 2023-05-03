import Foundation
import CoreFoundation

func readFile(filename:String) -> Array<Substring> {

    //Read in the file
    let contents = try! String(contentsOfFile: filename)

    //Split the file on endline (\n)
    let lines = contents.split(separator:"\n")

    print("Num words: \(lines.count)")

    return lines
}

func appendFile(filename:String, runTime:Double) {
  var contents : String = String(format: "%f", runTime)
  contents = contents + "\n"
  guard let data = contents.data(using:String.Encoding.utf8) else {return}
  let filePath = getDocumentsDirectory().appendingPathComponent(filename)
//  print("writing \(contents) to \(filePath)")
  if let fileHandle = try? FileHandle(forWritingTo: filePath) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
   }
}

func getDocumentsDirectory() -> URL {
  let fileURL: URL = URL(fileURLWithPath: "./")
  return fileURL
}

let commands = CommandLine.arguments
var filename = "Example-metars.csv"
if(commands.count > 1) {
  print("Commands \(commands)")
  filename = commands[1]
  print("Setting filename \(filename)")
}

//Arrary of Substrings
var strings = readFile(filename:filename)