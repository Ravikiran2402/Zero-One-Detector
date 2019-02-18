module zero_one_detector(
    input  clk,
    input rst,
    input A,
    output reg Y
    );
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
reg [1:0] curr_state;
reg [1:0] nxt_state;

always@(posedge clk)
    begin
    if(rst)
        begin
        curr_state <= S0;
        Y = 0;
        end
    else
        curr_state <= nxt_state;
    end
always@(*)
    begin
    case(curr_state)
        S0:
            if(A == 1'b1)
                begin
                nxt_state <= S0;
                end
            else
                begin
                nxt_state <= S1;
                end
        S1:
            if(A == 1'b1)
                begin
                nxt_state <= S2;
                end
            else
                begin
                nxt_state <= S1;
                end
        S2:
            if(A == 1'b1)
                begin
                nxt_state <= S0;
                end
            else
                begin
                nxt_state <= S1;
                end
        default: nxt_state <= S0;
    endcase
    end
always@(posedge clk)
    begin
        if(nxt_state == S2)
            Y = 1'b1;
        else
            Y = 1'b0;

    end
endmodule
