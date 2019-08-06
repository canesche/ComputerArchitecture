module led_helloWorld (
    input key,
    output led
);

    // simple code to use one key to control one led
    assign led = key;

endmodule