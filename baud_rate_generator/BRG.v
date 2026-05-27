module baud_rate_gen (
    input clk,
    output reg tx_enb,
    output reg rx_enb
);

    reg [12:0] tx_counter;
    reg [9:0] rx_counter;

    initial begin
        tx_counter = 0;
        rx_counter = 0;
    end

    // FOR TRANSMITTER
    always @(posedge clk) begin

        if (tx_counter == 5207) begin
            tx_counter <= 0;
            tx_enb <= 1'b1;
        end
        else begin
            tx_counter <= tx_counter + 1'b1;
            tx_enb <= 1'b0;
        end

    end

    // FOR RECEIVER
    always @(posedge clk) begin

        if (rx_counter == 324) begin
            rx_counter <= 0;
            rx_enb <= 1'b1;
        end
        else begin
            rx_counter <= rx_counter + 1'b1;
            rx_enb <= 1'b0;
        end

    end

endmodule