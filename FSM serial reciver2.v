// SECOND ATTEMPT AT THE CODE

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    
    reg [3:0] state, next_state;
    parameter X=0,A=1,B=2,C=3,D=4,E=5,F=6,G=7,H=8,Y=9,Z=10;
    
    always @ (*) begin
        if (state == X) begin
            if (in == 0) next_state <= A;
            else next_state <= X;
        end
        else if (state == A) begin
            next_state <= B;
        end
        else if (state == B) begin
            next_state <= C;
        end
        else if (state == C) begin
            next_state <= D;
        end
        else if (state == D) begin
            next_state <= E;
        end
        else if (state == E) begin
            next_state <= F;
        end
        else if (state == F) begin
            next_state <= G;
        end
        else if (state == G) begin
            next_state <= H;
        end
        else if (state == H) begin
            if (in == 0) next_state <= Y;
            else next_state <= Z;
        end
        else if (state == Y) begin
            if (in == 0) next_state <= Y;
            else next_state <= A;
        end
        else if (state == Z) begin
            if (in == 0) next_state <= B;
            else next_state <= A;
        end
    end
    
    always @ (posedge clk) begin
        if (reset) state <= A;
        else state <= next_state;
    end
    
    assign done = (state == D);

endmodule
