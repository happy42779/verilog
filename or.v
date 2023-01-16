module and_or (input a, b,
    output x, y, out);
    
    wire t1, t2;

    nand (x, a, a);
    nand (y, b, b);
    assign t1 = x;
    assign t2 = y;
    nand (out, t1, t2);
endmodule

module test;
    reg a, b;
    wire x, y, out;
    and_or test(.a(a), .b(b), .x(x), .y(y), .out(out));
    initial begin
        a = 1'b0;
        b = 1'b0;
        #1
        $display("a=%b, b=%b, out=%b", a, b, out);

        a = 1'b0;
        b = 1'b1;
        #1
        $display("a=%b, b=%b, out=%b", a, b, out);
        
        a = 1'b1;
        b = 1'b0;
        #1
        $display("a=%b, b=%b, out=%b", a, b, out);
        
        a = 1'b1;
        b = 1'b1;
        #1
        $display("a=%b, b=%b, out=%b", a, b, out);
    end
endmodule