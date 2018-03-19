// [[Rcpp::depends(RSeqAn)]]

#include <Rcpp.h>
#include <iostream>
#include <map>
#include <fstream>
#include <iostream>
#include <string>
#include <algorithm>
#include <cstdint>
#include "zlib.h"

using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

// pair<map < string adapter, vector<int>>, vector<int>> counts adapter_content(string infile, string adapters) {
//   // Read adapter file and turn into set of keys
//   std::pair<std::string, std::string> adapters = read_adapters(adapters);
//
//   // Turn adapter keys into Pattern objects to search for
//   seqan::String<seqan::CharString> needles;
//   appendValue(needles, )
//   Pattern<CharString, MultiBfamPattern> pattern(needle, SimpleScore(0, -1, -1));
//
//   gz::igstream in(infile.c_str());
//   std::string line;
//   int count=1, line_count = 1;
//   while(std::getline(in,line)) {
//     Finder<CharString> finder(line);
//     while(find(finder, pattern, getScore(pattern)))
//       std::cout << '[' << beginPosition(finder) << ',' << endPosition(finder) << ")\t"
//   }
// }

//' Reads in adapter sequences and returns as an R data frame.
//'
//' @param adapters filename of adapter sequences
//' @return A dataframe with columns adapter and sequence
//' @export
// [[Rcpp::export]]
DataFrame read_adapters(std::string adapters) {
  std::ifstream inFile(adapters.c_str());
  std::string line;
  std::vector<std::string> adapter;
  std::vector<std::string> sequence;

  if(!inFile.is_open()) {
    stop("ERROR: Could not open the file.\n");
  }
  else {
    int count = 0;
    while(std::getline(inFile, line)) {
      if(count==0) {
        adapter.push_back(line);
        count++;
      }
      else {
        sequence.push_back(line);
        count--;
      }
    }
  }

  DataFrame adapter_pairs = DataFrame::create(Named("adapter") = adapter, Named("sequence") = sequence);
  return adapter_pairs;
}


// Turn adapter keys into Pattern objects to search for
