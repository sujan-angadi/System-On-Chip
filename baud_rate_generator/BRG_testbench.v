`timescale 1ns/1ps
module baud_rate_gen_tb ();
    reg clk;
    wire tx_enb;
    wire rx_enb;

    initial begin
    $dumpfile("baud.vcd");
    $dumpvars(0, baud_rate_gen_tb);
    end

    baud_rate_gen uut (
        .clk(clk),
        .tx_enb(tx_enb),
        .rx_enb(rx_enb)
    );

    initial begin
        clk = 0;
    end
    // clock genration: toggle every 10ns as the full cycle frequency is 20ns from calculation
    always #10 clk = ~clk;

    initial begin
        #500000;

        $finish;
    end
endmodule