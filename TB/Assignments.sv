# code 1
...
   class base;

        int i;
        function static get();
                int a;
                a++;
                $display(a);
                $display(i);
        endfunction

endclass

base b1_h, b2_h;

module test();
        initial
        begin
                b1_h=new();
                b2_h=new();
                b1_h.get();
                b1_h.get();
                b2_h.get();
        end
endmodule
...


# code 2
...
   class base;
        static function static get();
                int a;
                a++;
                $display(a);
        endfunction
endclass

base b1_h, b2_h;


module assign2;
initial
        begin
                b1_h.get();
                b1_h.get();
                b2_h.get();

        end


endmodule
...


# code 3
...
   class base;
        int i;
        static function get();
                static int a;
                a++;
                $display(a);
        endfunction

endclass

base b1_h, b2_h;

module assign3;
initial
        begin
                b1_h.get();
                b1_h.get();
                b2_h.get();

        end

endmodule
...


# code 4
...
   class base;
        int i;
        static function get();
                int a;
                a++;
                $display(a);
        endfunction

endclass

base b1_h, b2_h;


module assign4;
initial
        begin
                b1_h.get();
                b1_h.get();
                b2_h.get();

        end

endmodule
...


# code 5
...
   class base;
        int i;
        static function get();
                int a;
                a++;
                i++;
                $display(a);
                $display(i);
        endfunction

endclass
base b1_h, b2_h;
module assign5;
initial
        begin
                b1_h.get();
                b1_h.get();
                b2_h.get();

        end


endmodule
...


# code 6
...
   class base;
        static int i;
        static function get();
                int a;
                a++;
                i++;
                $display(a);
                $display(i);
        endfunction

endclass
base b1_h, b2_h;
module assign6;
initial
        begin
                b1_h.get();
                b1_h.get();
                b2_h.get();

        end


endmodule
...


# code 7
...
   class base;
        static int i;
        function static get();
                int a;
                a++;
                i++;
                $display(a);
                $display(i);
        endfunction

endclass
base b1_h, b2_h;
module assign7;
initial
        begin
                b1_h.get();
                b1_h.get();
                b2_h.get();

        end


endmodule
...


# code 8
...
   class base;
        int i;
        function static get();
                int a;
                a++;
                i++;
                $display(a);
                $display(i);
        endfunction

endclass
base b1_h, b2_h;
module assign8;
initial
        begin
                b1_h.get();
                b1_h.get();
                b2_h.get();

        end


endmodule
...


# code 9
...
   class trans;
        int i;
        function new();
                i=10;
        endfunction
endclass

class ex_trans1 extends trans;
        int i;
        function new(int i);
                this.i=i;
        endfunction
endclass

ex_trans1 e_h;

module abc();
initial
begin
        e_h=new(10);
        $display("%p", e_h);
end
endmodule
...


# code 10
...
   class base;
        static int i;
        static function static get();
                int a;
                a++;
                i++;
                $display(a);
                $display(i);
        endfunction
endclass

base b1_h, b2_h;
module assign1;

        initial
        begin
                b1_h.get();
                b1_h.get();
                b2_h.get();


        end

endmodule
...
