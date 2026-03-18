`define TRUE   1'b1
`define FALSE   1'b0

//State Defiintion

`define init 3'd0
`define S0 3'd1
`define S1 3'd2
`define S2 3'd3

module fsm(y,x,clock,clear);

output y;

reg y;

input x;

input clock, clear;

//Interal State var
reg [1:0] state;
reg [1:0] next_state;

initial
begin
state =`init;
next_state =  `init;
y = 0;
end

always @(posedge clock)
state <= next_state;

always @(state)
begin
   case(state)

     `init: begin
           y = 0;
           end

      `S0: begin
           end

      `S1: begin
           end

      `S2: begin
          y = 1;
          end
       endcase
end


 always @(state or clear or x)
   begin
      if(clear)
        next_state =     `init;

     else

        case (state)
        
    	`init: if(x)
                next_state = `S0;
              else
                 next_state = `init;

         `S0: if(!x)
                next_state = `S1;
               else
                 next_state = `S0;
         `S1: if(x)
                next_state = `S2;
                else
                next_state = `init;
         `S2:
             next_state = `init;
      default:
      next_state = `S0;
      endcase
end

endmodule

