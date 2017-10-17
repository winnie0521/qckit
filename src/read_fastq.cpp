#include <Rcpp.h>
#include <iostream>
#include <map>
#include <fstream>
#include <iostream>
#include <string>
#include "gzstream.h"
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


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically
// run after the compilation.
//

/*** R
timesTwo(42)
*/

// [[Rcpp::export]]

 void process_fastq (std::string infile, std::string out_prefix, int buffer_size)
  {
  std::map<char, int> ascii_map;
  ascii_map['!'] = 0;
  ascii_map['"'] = 1;
  ascii_map['#'] = 2;
  ascii_map['$'] = 3;
  ascii_map['%'] = 4;
  ascii_map['&'] = 5;
  ascii_map['\''] = 6;
  ascii_map['('] = 7;
  ascii_map[')'] = 8;
  ascii_map['*'] = 9;
  ascii_map['+'] = 10;
  ascii_map[','] = 11;
  ascii_map['-'] = 12;
  ascii_map['.'] = 13;
  ascii_map['/'] = 14;
  ascii_map['0'] = 15;
  ascii_map['1'] = 16;
  ascii_map['2'] = 17;
  ascii_map['3'] = 18;
  ascii_map['4'] = 19;
  ascii_map['5'] = 20;
  ascii_map['6'] = 21;
  ascii_map['7'] = 22;
  ascii_map['8'] = 23;
  ascii_map['9'] = 24;
  ascii_map[':'] = 25;
  ascii_map[';'] = 26;
  ascii_map['<'] = 27;
  ascii_map['='] = 28;
  ascii_map['>'] = 29;
  ascii_map['?'] = 30;
  ascii_map['@'] = 31;
  ascii_map['A'] = 32;
  ascii_map['B'] = 33;
  ascii_map['C'] = 34;
  ascii_map['D'] = 35;
  ascii_map['E'] = 36;
  ascii_map['F'] = 37;
  ascii_map['G'] = 38;
  ascii_map['H'] = 39;
  ascii_map['I'] = 40;
  ascii_map['J'] = 41;
  ascii_map['K'] = 42;
  ascii_map['L'] = 43;
  ascii_map['M'] = 44;
  ascii_map['N'] = 45;
  ascii_map['O'] = 46;
  ascii_map['P'] = 47;
  ascii_map['Q'] = 48;
  ascii_map['R'] = 49;
  ascii_map['S'] = 50;
  ascii_map['T'] = 51;
  ascii_map['U'] = 52;
  ascii_map['V'] = 53;
  ascii_map['W'] = 54;
  ascii_map['X'] = 55;
  ascii_map['Y'] = 56;
  ascii_map['Z'] = 57;
  ascii_map['['] = 58;
  ascii_map['\\'] = 59;
  ascii_map[']'] = 60;
  ascii_map['^'] = 61;
  ascii_map['_'] = 62;
  ascii_map['`'] = 63;
  ascii_map['a'] = 64;
  ascii_map['b'] = 65;
  ascii_map['c'] = 66;
  ascii_map['d'] = 67;
  ascii_map['e'] = 68;
  ascii_map['f'] = 69;
  ascii_map['g'] = 70;
  ascii_map['h'] = 71;
  ascii_map['i'] = 72;
  ascii_map['j'] = 73;
  ascii_map['k'] = 74;
  ascii_map['l'] = 75;
  ascii_map['m'] = 76;
  ascii_map['n'] = 77;
  ascii_map['o'] = 78;
  ascii_map['p'] = 79;
  ascii_map['q'] = 80;
  ascii_map['r'] = 81;
  ascii_map['s'] = 82;
  ascii_map['t'] = 83;
  ascii_map['u'] = 84;
  ascii_map['v'] = 85;
  ascii_map['w'] = 86;
  ascii_map['x'] = 87;
  ascii_map['y'] = 88;
  ascii_map['z'] = 89;
  ascii_map['{'] = 90;
  ascii_map['|'] = 91;
  ascii_map['}'] = 92;
  ascii_map['~'] = 93;

  std::map<std::string, int> over_rep_map;
  std::map<std::string,int>::iterator it;
  std::map<int,std::vector<int> > qual_by_column;
  std::map<int,std::vector<int> >::iterator qual_by_col_it;

  //std::string seq_out = out_prefix + ".seq.csv";
  //std::string qual_char_out = out_prefix + ".qual.char.csv";
  //std::string qual_num_out = out_prefix + ".qual.num.csv";
  //std::ofstream seq_file, qual_char_file, qual_num_file;

  std::string over_rep_out = out_prefix + ".over_rep.csv";
  std::ofstream over_rep_file;

  /*seq_file.open(seq_out.c_str());
  qual_char_file.open(qual_char_out.c_str());
  qual_num_file.open(qual_num_out.c_str());*/
  over_rep_file.open(over_rep_out.c_str());

  gz::igzstream in(infile.c_str());
  std::string line;
  int count = 1, line_count =1;
  //std::vector<int,std::vector<int> > base_counts;
  std::vector<double> gc_percent_all;
  while (std::getline(in, line)) {

    if (count == 2)
      {
        it = over_rep_map.find(line);
        if (it != over_rep_map.end())
        {
          // if found increment by 1
          over_rep_map.at(line) += 1;
        }
        else
        {
          // if not found add new key and initialize to 1
          over_rep_map.insert(std::pair<std::string, int>(line,1));
        }
        // iterating over each character in the string
        std::string base_cmp;
        //std::vector<int> counts_per_read;
        int count_A=0, count_G=0, count_T=0, count_C=0, count_N=0;
        for (std::string::iterator it = line.begin(); it != line.end(); ++it)
          {
            base_cmp.clear();
            base_cmp.push_back(*it);
            if (base_cmp.compare("A") ==0) { count_A +=1;}
            else if (base_cmp.compare("T")==0) { count_T +=1;}
            else if (base_cmp.compare("G")==0) { count_G +=1;}
            else if (base_cmp.compare("C")==0) { count_C +=1;}
            else if (base_cmp.compare("N")==0) { count_N +=1;}
          }
        double gc_percent = static_cast<double>(count_C+count_G)/static_cast<double>(count_A+count_T+count_G+count_C+count_N);
        gc_percent_all.push_back(gc_percent);
        /*counts_per_read.push_back(count_A);
        counts_per_read.push_back(count_T);
        counts_per_read.push_back(count_G);
        counts_per_read.push_back(count_C);
        counts_per_read.push_back(count_N);
        base_counts.insert(line_count,counts_per_read);*/

      }

    if (count == 4)
      {
       // iterate over each value for quality
       int pos_counter = 1;
        for (std::string::iterator it = line.begin(); it != line.end(); ++it)
          {
           qual_by_col_it = qual_by_column.find(pos_counter);
            if(qual_by_col_it != qual_by_column.end())
            {
              qual_by_column.at(pos_counter).push_back(ascii_map.find(*it)->second);
            }
            else
            {
              std::vector<int> tmp;
              tmp.push_back(ascii_map.find(*it)->second);
              qual_by_column.insert(std::pair<int, std::vector<int> >(pos_counter,tmp));
            }
          }
      count = 1;
      }
    else
      {
      count++;
      }
  }
  //Cleanup
  in.close();

  /*TODO
    write over_rep sequences to file
    return gc_percent vector
    return per column mean, median and quantile
   */
  over_rep_file.close();

  return ;
}
