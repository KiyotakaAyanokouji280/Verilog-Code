//FIRST ATTEMPT USING COUNT VARIABLE

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    
    reg [3:0] count;
    parameter A=0,B=1,C=2,D=3;
    reg [1:0] state, next_state;
    
    always @ (*) begin
        if (state == A) begin
            count <= 8;
            if (in == 1) next_state <= A;
            else next_state <= B;
        end
        else if (state == B) begin
            if (count > 0) begin
               	count <= count - 1;
                next_state <= B;
            end
            else begin
                if( count == 0 & in == 0) begin
                   	next_state <= C; 
                end 
                else if (count == 0 & in == 1) begin
                   	next_state <= D; 
                end
            end
        end
        else if (state == C) begin
            if (in == 0) next_state <= C;
            else next_state <= A;
        end
        else if (state == D) begin
            if (in == 1) next_state <= A;
            else next_state <= B;
        end
        else next_state <= A;
    end
    
    always @ (posedge clk) begin
        if (reset) begin
           	state <= A;
        end
        else begin
           	state <= next_state;
        end
    end
    
    assign done = (state == D);

endmodule
