package liquid

import (
	"testing"
)

func TestFreqDem(t *testing.T) {
	var modulationFactor float32 = 0.1
	instance := Freqdem_create(modulationFactor)

	data := []complex64{}
	out := []float32{}
	Freqdem_demodulate(instance, data, out)
}
