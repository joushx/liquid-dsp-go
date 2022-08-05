package liquid

import (
	"testing"
)

func TestFreqDem(t *testing.T) {
	var modulationFactor float32 = 0.1
	instance := Freqdem_create(modulationFactor)

	data := []complex64{1+0.2i, 2+0.3i, 5+2i}
	out := []float32{0.0, 0.0, 0.0}
	Freqdem_demodulate_block(instance, data, 1, out)

        if out[0] == 0.0 {
                t.Fail()
        } 
}
