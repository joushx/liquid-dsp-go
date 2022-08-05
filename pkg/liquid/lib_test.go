package liquid

import (
	"testing"
)

func TestFreqDem(t *testing.T) {
	var modulationFactor float32 = 0.1
	instance := Freqdem_create(modulationFactor)

	data := []complex64{0+0i}
	out := []float32{0.0}
	Freqdem_demodulate_block(instance, data, 1, out)
}
