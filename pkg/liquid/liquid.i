%module liquid
%{
#include "liquid/liquid.h"
%}

%go_import("fmt")

%ignore spgramcf_get_alpha;
%ignore spgramf_get_alpha;
%ignore symtrack_rrrf_destroy;
%ignore symtrack_rrrf_print;
%ignore symtrack_rrrf_reset;
%ignore symtrack_rrrf_create;
%ignore symtrack_rrrf_create_default;
%ignore symtrack_rrrf_set_modscheme;
%ignore symtrack_rrrf_set_bandwidth;
%ignore symtrack_rrrf_adjust_phase;
%ignore symtrack_rrrf_execute;
%ignore symtrack_rrrf_execute_block;
%ignore qnsearch_execute;
%ignore liquid_vectorf_init;
%ignore liquid_vectorf_sumsq;
%ignore liquid_vectorf_pnorm;
%ignore liquid_vectorcf_init;
%ignore liquid_vectorcf_sumsq;
%ignore liquid_vectorcf_pnorm;
%ignore set_real;
%ignore get_real;
%ignore set_imag;
%ignore get_imag;
%ignore liquid_float_complex;

%rename("%(camelcase)s") "";

%include "typemaps.i";

// complex number
%typemap(imtype) liquid_float_complex "C.complexfloat"
%typemap(gotype) liquid_float_complex "complex64"
%typemap(goin) liquid_float_complex {
  $result = C.complexfloat($1)
}
%typemap(in) liquid_float_complex {
  $1 = $input;
}
%typemap(goout) liquid_float_complex {
  $result = complex64($1)
}

// complex array
%typemap(imtype) liquid_float_complex* "*C.complexfloat"
%typemap(gotype) liquid_float_complex* "[]complex64"
%typemap(goin) liquid_float_complex* {
  $result = (*C.complexfloat)(&$1[0])
}
%typemap(goout) liquid_float_complex* {
  fmt.Printf("Warning: This function does not return anything! %v", $1)
  $result = []complex64{} // TODO: take length from somewhere
}

// float array
%typemap(imtype) float* "*C.float"
%typemap(gotype) float* "[]float32"
%typemap(goin) float* {
  $result = (*C.float)(&$1[0])
}
%typemap(goout) float* {
  fmt.Printf("Warning: This function does not return anything! %v", $1)
  $result = []float32{} // TODO: take length from somewhere
}

%include "liquid/liquid.h";

%insert(cgo_comment_typedefs) %{
#cgo LDFLAGS: -L ./usr/include -lliquid -lm
#include <liquid/liquid.h>
%}
