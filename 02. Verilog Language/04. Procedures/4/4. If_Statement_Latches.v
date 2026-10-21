// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*)
        begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else
                shut_off_computer = 0;
        end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else
            keep_driving = 0;
    end

endmodule

//__________________________________________OR______________________________________________________//

always @(*) begin
    shut_off_computer = 0;          // default
    if (cpu_overheated)
        shut_off_computer = 1;
end

always @(*) begin
    keep_driving = 0;               // default
    if (~arrived)
        keep_driving = ~gas_tank_empty;
end

//____________________________________________OR_____________________________________________________//


always @(*) begin
    shut_off_computer = cpu_overheated ? 1'b1 : 1'b0;
    keep_driving      = arrived ? 1'b0 : ~gas_tank_empty;
end
