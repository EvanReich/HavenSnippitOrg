module UPDOWN (
    output reg [1:0] CNT,
    input wire Clock, Reset, Up
);

reg [1:0] current_state, next_state;
parameter C0 = 2'b00,
          C1 = 2'b01,
          C2 = 2'b10,
          C3 = 2'b11;

always @ (posedge Clock or negedge Reset)
begin: STATE_MEMORY
    if (!Reset)
        current_state <= C0;
    else
        current_state <= next_state;
end

always @ (current_state or Up)
begin: NEXT_STATE_LOGIC
    case (current_state)
        C0 : next_state = (Up == 1'b1) ? C1 : C3;
        C1 : next_state = (Up == 1'b1) ? C2 : C0;
        C2 : next_state = (Up == 1'b1) ? C3 : C1;
        C3 : next_state = (Up == 1'b1) ? C0 : C2;
        default : next_state = C0;
    endcase
end

always @ (current_state)
begin: OUTPUT_LOGIC
    case (current_state)
        C0: CNT = 2'b00;
        C1: CNT = 2'b01;
        C2: CNT = 2'b10;
        C3: CNT = 2'b11;
        default: CNT = 2'b00;
    endcase
end

endmodule
