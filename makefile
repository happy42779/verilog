target1=and
target2=or

all: $(target1) $(target2)

$(target1): $(target1).v
	iverilog -o $@ $<

$(target2): $(target2).v
	iverilog -o $@ $<

.PHONY: clean run

run:
	@echo "--------Testing 'and' via NAND gate ---------------"
	@vvp $(target1)
	@echo "--------Testing 'or' via NAND gate ---------------"
	@vvp $(target2)

clean:
	rm $(target1) $(target2)