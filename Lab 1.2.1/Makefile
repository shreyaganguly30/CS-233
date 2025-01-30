CXX = clang++
CPPFLAGS = -Wall -g

comparator1_deps = comparator1.v comparator1_tb.v

BENCHES = comparator1
.PHONY: all $(BENCHES) clean
.SECONDEXPANSION:

$(BENCHES): %: %_exe
	./$<

%_exe: $$(%_deps)
	iverilog -o $@ -Wall $^

clean:
	rm -rf *_exe *.vcd *.dSYM
