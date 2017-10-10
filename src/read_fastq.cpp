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

  /*if (argc < 2) {
    std::cerr << "Usage: " << argv[0] << " <gzipped input file> <output_prefix>" << std::endl;
  }*/
  //Read from the first command line argument, assume it's gzipped

  //std::ifstream file(argv[1], std::ios_base::in | std::ios_base::binary);
  //std::string out_prefix(argv[2]);
  std::string seq_out = out_prefix + ".seq.csv";
  std::string qual_char_out = out_prefix + ".qual.char.csv";
  std::string qual_num_out = out_prefix + ".qual.num.csv";
  std::ofstream seq_file, qual_char_file, qual_num_file;

  seq_file.open(seq_out.c_str());
  qual_char_file.open(qual_char_out.c_str());
  qual_num_file.open(qual_num_out.c_str());

  gz::igzstream in(infile.c_str());
  std::string line;
  std::string out_seq_buffer="";
  std::string out_qual_buffer;
  int count = 1, buffer_count = 1;

  while (std::getline(in, line)) {
    //std::cout << count <<  std::endl;
    /*if ( buffer_count > buffer_size)
    {
      out_seq_buffer="";
    }
    if (count == 2) {
      //std::cout << line <<  std::endl;
      for (std::string::iterator it = line.begin(); it != line.end(); ++it)
        {

        if (it == --line.end())
        { out_seq_buffer.append(1,*it);
          out_seq_buffer.append("\n"); }
        else
          {
          out_seq_buffer.append(1,*it);
          out_seq_buffer.append( ","); }
      }

    }

    if (count == 4) {
      //std::cout << line <<  std::endl;
      for (std::string::iterator it = line.begin(); it != line.end(); ++it) {
        if (it == --line.end()) {
          //qual_char_file << *it;
          //qual_num_file << ascii_map[*it];
        } else {
          //qual_char_file << *it << ",";
          //qual_num_file << ascii_map[*it] << ",";
        }
      }
      //qual_char_file << '\n';
      //qual_num_file << '\n';

      count = 1;
    } else { count++; }*/
    buffer_count ++;
  }
  //Cleanup
  in.close();
  seq_file.close();
  qual_char_file.close();
  qual_num_file.close();
  //******************************************
  //  Coding with Boost instead
  //******************************************
  /*boost::iostreams::filtering_istream inbuf;
  inbuf.push(boost::iostreams::gzip_decompressor());
  inbuf.push(file);
  //Convert streambuf to istream
  //Iterate lines
  std::string line;
  int count =1;
  while(std::getline(inbuf, line))
  {
  //std::cout << count <<  std::endl;
  if (count == 2 )
  {
  //std::cout << line <<  std::endl;
  for ( std::string::iterator it=line.begin(); it!=line.end(); ++it)
  {

  if( it == --line.end())
  { seq_file << *it;}
  else {seq_file << *it << ",";}
  }
  seq_file << '\n';

  }

  if (count ==4)
  {
  //std::cout << line <<  std::endl;
  for ( std::string::iterator it=line.begin(); it!=line.end(); ++it)
  {
  if( it == --line.end())
  {
  qual_char_file << *it;
  qual_num_file << ascii_map[*it];
  }
  else
  {
  qual_char_file << *it << ",";
  qual_num_file << ascii_map[*it] << ",";
  }
  }
  qual_char_file << '\n';
  qual_num_file << '\n';

  count=1;
  }
  else{ count++ ;}
  }
  //Cleanup
  file.close();
  seq_file.close();
  qual_char_file.close();
  qual_num_file.close();*/

  return ;
}
