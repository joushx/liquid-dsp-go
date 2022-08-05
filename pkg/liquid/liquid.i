%module liquid
%{
#include "liquid/liquid.h"
%}

%ignore "";
// %ignore spgramcf_get_alpha;
// %ignore spgramf_get_alpha;
// %ignore symtrack_rrrf_destroy;
// %ignore symtrack_rrrf_print;
// %ignore symtrack_rrrf_reset;
// %ignore symtrack_rrrf_create;
// %ignore symtrack_rrrf_create_default;
// %ignore symtrack_rrrf_set_modscheme;
// %ignore symtrack_rrrf_set_bandwidth;
// %ignore symtrack_rrrf_adjust_phase;
// %ignore symtrack_rrrf_execute;
// %ignore symtrack_rrrf_execute_block;
// %ignore qnsearch_execute;
// %ignore liquid_vectorf_init;
// %ignore liquid_vectorf_sumsq;
// %ignore liquid_vectorf_pnorm;
// %ignore liquid_vectorcf_init;
// %ignore liquid_vectorcf_sumsq;
// %ignore liquid_vectorcf_pnorm;

%rename("%s") get_liquid_version;
%rename("%s") freqdem_create;
//%rename("%s") freqdem_demodulate;
%rename("%s") freqdem_demodulate_block;
%rename("%s") liquid_float_complex;
%rename("%s") complexfloat;

%include "typemaps.i";
%typemap(gotype) liquid_float_complex* "[]complex64"
%typemap(gotype) liquid_float_complex "complex64"
%typemap(gotype) float* "[]float32"
%typemap(imtype) liquid_float_complex* "*C.complexfloat"
%typemap(goin) liquid_float_complex* {
  $result = (*C.complexfloat)(&$1[0])
}
%typemap(imtype) float* "*C.float"
%typemap(goin) float* {
  $result = (*C.float)(&$1[0])
}

%typemap(in) (SWIGTYPE q, liquid_float_complex* s, uint n, float* m) {
    $1 = $input;
    $2 = NULL;
}

%include "liquid/liquid.h";

%insert(cgo_comment_typedefs) %{
#cgo LDFLAGS: -L ./usr/include -lliquid -lm
%}
