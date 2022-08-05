package liquid

import (
	"testing"
)

func TestFreqDem(t *testing.T) {
	var modulationFactor float32 = 0.1
	instance := Freqdem_create(modulationFactor)

	data := []complex64{1+0.2i, 2+0.3i, 5+2i}
	out := make([]float32, len(data))
        FreqdemDemodulateBlock(instance, data, uint(len(data)), out)

        t.Logf("%+v", out)

        if out[1] == 0.0 {
                t.Fail()
        } 
}
