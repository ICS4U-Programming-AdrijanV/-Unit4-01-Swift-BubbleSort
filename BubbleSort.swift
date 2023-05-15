// Importing
import Foundation

// bubble sort
func bubbleSort(_ array: inout [Int]) {
    let n = array.count
    for i in 0..<n {
        for j in 0..<n-i-1 {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
            }
        }
    }
}

// Main function
func readAndSortFile(inputFileName: String, outputFileName: String) {
    do {
        // Create input and output
        let inputURL = URL(fileURLWithPath: inputFileName)
        let outputURL = URL(fileURLWithPath: outputFileName)
        
        // Read the input file
        let input = try String(contentsOf: inputURL)
        
        // Split input into lines
        let lines = input.split(separator: "\n")
        
        var output = ""
        
        for line in lines {

            // Split line by spaces
            let numbers = line.split(separator: " ")
            
            var array = [Int]()
            for number in numbers {

                // Convert each number to an integer and add to array
                if let num = Int(number) {
                    array.append(num)
                }
            }

            // Bubble sort function call
            bubbleSort(&array)
            
            // Add the sorted array to the output string
            output += "\(array)\n"
        }

        // Display output
        try output.write(to: outputURL, atomically: true, encoding: .utf8)
    } catch {
        // Display error
        print("Error: \(error.localizedDescription)")
    }
}

// Create input/output file.
let inputFileName = "input.txt"
let outputFileName = "output.txt"

// Call main function
readAndSortFile(inputFileName: inputFileName, outputFileName: outputFileName)
