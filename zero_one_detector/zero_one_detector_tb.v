module seq_tb;
    reg A;
    reg clk;
    reg rst;
    wire Y;

    zero_one_detector uut(
        .A(A),
        .clk(clk),
        .rst(rst),
        .Y(Y)
        );

    initial begin
        $dumpfile("zero_one_detector.vcd");
        $dumpvars(0,seq_tb);
        rst = 1;
        #50
        rst = 0;

        #50

        clk = 0;
        A = 0;

        #50

        clk = 1;

        #50

        clk = 0;

        #50

        clk = 1;

        #20

        A = 1;

        #30

        clk = 0;

        #50

        clk = 1;

        #10

        A = 0;

        #40

        clk = 0;

        #50

        clk = 1;

        #50

        clk = 0;

        #10

        A = 1;

        #40

        clk = 1;

        #50

        clk = 0;

        #40

        A = 0;

        #10

        clk = 1;

        #50

        clk = 0;

        #50

        clk = 1;

        #50

        clk = 0;

        #30

        A = 1;

        #20

        clk = 1;

        #50

        clk = 0;

        #30

        A = 1;

        #20

        clk = 1;

        #50

        clk = 0;

        #50

        clk = 1;

        #50

        clk = 0;

        #50

        clk = 1;

        #50

        clk = 0;

        #50

        clk = 1;

        #30

        A = 0;

        #20

        clk = 0;

        #50

        clk = 1;

        #10

        A = 1;

        #40

        clk = 0;

        #50

        clk = 1;

        #50

        clk = 0;
    end
always@(clk == 1)// Prinitng output only at positive clock edges
    if($time%100 != 0 && $time%50 == 0)
        $display("time=%d:A = %b,clk = %b,rst = %b,Y = %b\n",$time-100,A,clk,rst,Y);
endmodule
