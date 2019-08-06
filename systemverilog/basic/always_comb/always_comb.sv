/*
    VANTAGENS DE USAR always_comb
    * Executa automaticamente uma ve no tempo zero
    * É sensivel a mudancas dentro do conteudo de uma funcao
    * Variaveis no lado esquerdo das atribuicoes, nao podem ser gravadas por nenhum outro processo
*/

module tb;
    logic a, b, c, always_x, always_comb_x;

    function logic func (input logic _c);
        func = a | b | _c;
    endfunction

    always @*
        always_x = func(c);
    
    always_comb
        always_comb_x = func(c);

    initial begin
        $monitor("@%0t: a = %d, b = %d, c = %d, always_x = %d, always_comb_x = %d", $time, a, b, c, always_x, always_comb_x);
    end

    initial begin
        a = 0;
        b = 0;
        c = 0;
        #10 a = 1;
        #10 b = 1;
        #10 c = 1;
    end
endmodule