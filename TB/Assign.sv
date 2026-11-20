# code 11
...
class trans;
        int i;
        function new(int i);
                this.i=i;
        endfunction
endclass

class ex_trans1 extends trans;
        int i;
        function new(int i);
                super.new(i);
                this.i=20;
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


# code 12
...
class trans;
        int i;
        function new(int i=10);
                this.i=i;
        endfunction
endclass

class ex_trans1 extends trans;
        int i;
        function new();
                i=20;
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


# code 13
...
class trans;
        int i;
        function new(int i=10);
                i=10;
        endfunction
endclass

class ex_trans1 extends trans;
        int i;
        function new();
                i=20;
        endfunction
endclass

ex_trans1 e_h;

module abc();
        initial
        begin
                e_h=new(20);
                $display("%p", e_h);
        end
endmodule
...


# code 14
...
class trans;
        int i;
        function new();
                i=10;
        endfunction
endclass

class ex_trans1 extends trans;
        int i;
        function new();
                i=20;
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


# code 15
...
class trans;
        virtual task send();
                $display("In class trans");
        endtask
endclass

class ex_trans1 extends trans;
        virtual task send();
                $display("In class ex_trans1");
        endtask
endclass

class ex_trans2 extends trans;
        virtual task send();
                $display("In class ex_trans2");
        endtask
endclass

trans b_h;
ex_trans1 ex1_h;
ex_trans2 ex2_h;

module inheritance;
initial
begin
        ex1_h=new();
        ex2_h=new();
        b_h=ex2_h;
        b_h.send();
end
endmodule
...


# code 16
...
class trans;
        virtual task send();
                $display("In class trans");
        endtask
endclass

class ex_trans1 extends trans;
        virtual task send();
                $display("In class ex_trans1");
        endtask
endclass

class ex_trans2 extends trans;
        virtual task send();
                $display("In class ex_trans2");
        endtask
endclass

trans b_h;
ex_trans1 ex1_h;
ex_trans2 ex2_h;

module inheritance;
initial
begin
        ex1_h=new();
        ex2_h=new();
        b_h=ex1_h;
        ex1_h=ex2_h;
        b_h.send();
end
endmodule
...


# code 17
...
class trans;
        virtual task send();
                $display("In class trans");
        endtask
endclass

class ex_trans1 extends trans;
        virtual task send();
                $display("In class ex_trans1");
        endtask
endclass

class ex_trans2 extends trans;
        virtual task send();
                $display("In class ex_trans2");
        endtask
endclass

trans b_h;
ex_trans1 ex1_h;
ex_trans2 ex2_h;

module inheritance;
initial
begin
        ex1_h=new();
        ex2_h=new();
        ex1_h=ex2_h;
        b_h.send();
end
endmodule
...


# code 18
...
class trans;
        virtual task send();
                $display("In class trans");
        endtask
endclass

class ex_trans1 extends trans;
        virtual task send();
                $display("In class ex_trans1");
        endtask
endclass

class ex_trans2 extends trans;
        virtual task send();
                $display("In class ex_trans2");
        endtask
endclass

trans b_h;
ex_trans1 ex1_h;
ex_trans2 ex2_h;

module inheritance;
initial
begin
        ex1_h=new();
        ex2_h=new();
        ex1_h=ex2_h;
        b_h.send();
end
endmodule
...


# code 19
...
//working in VCS , not working in Questa
/*
vcs -sverilog assign19.sv
./simv
*/

class AB;
        int i=1;
endclass

AB a1;

module test();
initial
        begin
        repeat(2)
        begin
                AB a2=new();
                a1=new();
                a1.i++;
                a2.i++;
                $display("disp1 -- a1.i=%0d a2.i=%0d",a1.i,a2.i);
                a1.i++;
                a2.i++;
                $display("disp2 -- a1.i=%0d a2.i=%0d",a1.i,a2.i);

        end
        end
endmodule
...


# code 20
...
class AB;
        int i;
        pure virtual function void disp();
endclass

class BC extends AB;
        int j;
        function void disp(int z);
                j=z;
                $display("%0d",j);

        endfunction
endclass

class CD extends AB;
        int k;
        function void display(int z);
                k=z;
                $display("%0d",k);

        endfunction
endclass


AB a_h=new();
BC b_h=new();
CD c_h=new();

module test();
initial
        begin
                a_h.disp();
                b_h.disp(2);
                c_h.display(3);
        end
endmodule
...


# code 21
...
class AB;

        rand int i;
        task xyz(string s);
        fork
                begin
                        #(i);
                end
                begin
                        #(20);
                        $display("In object of %s, 20ns delay is completed %t",s,$time);
                end
        join_any

        disable fork;
        endtask
endclass

AB a1=new();
AB a2=new();

module test();
initial
begin
        a1.i=5;
        a2.i=30;
        fork
                a1.xyz("a1");
                a2.xyz("a2");
        join
end
endmodule
...


# code 22
...
class AB #(type T=int, int width=8);
        T i;
        bit[width-1:0]b;
endclass

AB #(int ,8) a_h1;
AB #(real,16)  a_h2;
AB a_h3;
...

          
  
