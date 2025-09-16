module PBWC (output reg Open_CW, Close_CCW,
             input wire Clock, Reset, Press);

    reg current_state, next_state;
    parameter w_closed = 1'b0,
              w_open = 1'b1;

    always @ (posedge Clock or negedge Reset)
        begin: STATE_MEMORY
            if (!Reset)
                current_state <= w_closed;
            else
                current_state <= next_state;
        end

    always @ (current_state or Press)
        begin: NEXT_STATE_LOGIC
            case (current_state)
                w_closed : if (Press == 1'b1)
                               next_state = w_open;
                           else
                               next_state = w_closed;
                w_open : if (Press == 1'b1)
                             next_state = w_closed;
                         else
                             next_state = w_open;
                default : next_state = w_closed;
            endcase
        end

    always @ (current_state or Press)
        begin: OUTPUT_LOGIC
            case (current_state)
                w_closed : if (Press == 1'b1)
                               begin
                                   Open_CW = 1'b0;
                                   Close_CCW = 1'b0;
                               end
                           else 
                               begin 
                                   Open_CW = 1'b0; 
                                   Close_CCW = 1'b0; 
                               end 
                w_open : if (Press == 1'b1) 
                             begin 
                                 Open_CW = 1'b0; 
                                 Close_CCW = 1'b0; 
                             end 
                         else  
                             begin  
                                 Open_CW = 1'b0;  
                                 Close_CCW = 1'b0;  
                             end  
                default : begin   
                              Open_CW = 1'b0;   
                              Close_CCW = 1'b0;   
                          end   
            endcase    
        end    

endmodule

            
