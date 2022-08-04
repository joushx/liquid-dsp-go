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
%rename("wrapped_%s") freqdem_demodulate;
%rename("%s") liquid_float_complex;
%rename("%s") complexfloat;

%insert(go_wrapper) %{
func Freqdem_demodulate(instance Freqdem_s, data []complex64, result []float32) {
  Cdata := (Liquid_float_complex)(data[0])
  Cresult := &result[0]

  Wrapped_freqdem_demodulate(instance, Cdata, Cresult)
}
%}

%include "liquid/liquid.h"

%insert(cgo_comment_typedefs) %{
#cgo LDFLAGS: -L ./usr/include -lliquid -lm
%}