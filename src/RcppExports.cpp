// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// process_fastq
void process_fastq(std::string infile, std::string out_prefix, int buffer_size);
RcppExport SEXP _qckit_process_fastq(SEXP infileSEXP, SEXP out_prefixSEXP, SEXP buffer_sizeSEXP) {
BEGIN_RCPP
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< std::string >::type infile(infileSEXP);
    Rcpp::traits::input_parameter< std::string >::type out_prefix(out_prefixSEXP);
    Rcpp::traits::input_parameter< int >::type buffer_size(buffer_sizeSEXP);
    process_fastq(infile, out_prefix, buffer_size);
    return R_NilValue;
END_RCPP
}
// qual_score_per_read
Rcpp::NumericVector qual_score_per_read(std::string infile);
RcppExport SEXP _qckit_qual_score_per_read(SEXP infileSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< std::string >::type infile(infileSEXP);
    rcpp_result_gen = Rcpp::wrap(qual_score_per_read(infile));
    return rcpp_result_gen;
END_RCPP
}
// gc_per_read
Rcpp::NumericVector gc_per_read(std::string infile);
RcppExport SEXP _qckit_gc_per_read(SEXP infileSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< std::string >::type infile(infileSEXP);
    rcpp_result_gen = Rcpp::wrap(gc_per_read(infile));
    return rcpp_result_gen;
END_RCPP
}
// calc_over_rep_seq
std::map<std::string,int> calc_over_rep_seq(std::string infile, std::string out_prefix, int min_size, int buffer_size);
RcppExport SEXP _qckit_calc_over_rep_seq(SEXP infileSEXP, SEXP out_prefixSEXP, SEXP min_sizeSEXP, SEXP buffer_sizeSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< std::string >::type infile(infileSEXP);
    Rcpp::traits::input_parameter< std::string >::type out_prefix(out_prefixSEXP);
    Rcpp::traits::input_parameter< int >::type min_size(min_sizeSEXP);
    Rcpp::traits::input_parameter< int >::type buffer_size(buffer_sizeSEXP);
    rcpp_result_gen = Rcpp::wrap(calc_over_rep_seq(infile, out_prefix, min_size, buffer_size));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_qckit_process_fastq", (DL_FUNC) &_qckit_process_fastq, 3},
    {"_qckit_qual_score_per_read", (DL_FUNC) &_qckit_qual_score_per_read, 1},
    {"_qckit_gc_per_read", (DL_FUNC) &_qckit_gc_per_read, 1},
    {"_qckit_calc_over_rep_seq", (DL_FUNC) &_qckit_calc_over_rep_seq, 4},
    {NULL, NULL, 0}
};

RcppExport void R_init_qckit(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
