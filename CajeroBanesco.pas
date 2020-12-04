{Programa para Emular el Funcionamiento de un Cajero Automatico}
Program CajeroBanesco;
Uses sysutils, crt;
Type
        RegistroCliente = Record
        Cedula, Saldo       :LongInt;
        Nombre, Apellido    :String;
        End;

        ReCliente = array[1..10] of RegistroCliente;
Var
        Cliente   :ReCliente;
        opt,i,c,a :Integer;
        dep, cd   :LongInt;
        fichero   :text;
        linea     :String;

Begin {Inicio del cajero}
ClrScr;
        textBackground(green);
        textColor(yellow);
        Writeln('--------------------');
        Writeln('Bienvenido a Banesco');
        Writeln('--------------------');
        Writeln;

        textBackground(black);
        textColor(white);
        Writeln('Presione ENTER para continuar.');
        Readln;

ClrScr;
        Writeln('--RECOMENDACIONES--');
        Writeln('1.Cualquier monto escrito no puede superar las 10 cifras.');
        Writeln('2.El cajero tiene un limite de 50 operaciones, luego se cerrara automaticamente.');
        Writeln('3.Cuando el cajero cierre, se borraran todos los datos, asegurate de hacer todo lo que quieras.');
        Writeln('4.El cajero soporta un maximo de 10 clientes, pero necesita al menos 2 para funcionar.');
        Writeln('5.La informacion que escribas puede ser personal. QUE NADIE MAS LA VEA!');
        Writeln;
        Writeln('Presione ENTER para continuar.');
        readln;
Begin {Registro de cliente}
Repeat
ClrScr;
        Writeln('Ingrese el numero de clientes que se van a registrar: ');
        readln(c);

                if c < 2 then
                Begin
                Writeln('El cajero requiere, al menos, 2 clientes para funcionar. Presiona ENTER para regresar.');
                readln;
                End;

                if c > 10 then
                Begin
                Writeln('El cajero tiene un limite de 10 clientes. Presiona ENTER para regresar.');
                readln;
                End;

Until (c > 1) and (c < 11);
End;
    For i:= 1 to c do
    Begin
                With Cliente[i] do
                Begin
                ClrScr;

                        Writeln('Por favor, ingrese los datos solicitados a continuacion para registrarse.');

                        Writeln('Cedula: ');            Readln(Cedula);
                        ClrScr;

                        Writeln('Nombre: ');            Readln(Nombre);
                        ClrScr;

                        Writeln('Apellido: ');          Readln(Apellido);
                        ClrScr;

                        Writeln('Deposito incial: ');   Readln(Saldo);
                        ClrScr;

                        textBackground(green);
                        textColor(yellow);
                        Writeln('C.I: ', Cedula);
                        Writeln('Nombre: ', Nombre);
                        Writeln('Apellido: ', Apellido);
                        Writeln('Saldo inicial: ', Saldo,' Bs.');
                        Writeln;

                        textBackground(black);
                        textColor(white);
                        Writeln('El cliente #', i,' a sido registrado con exito, presione ENTER para continuar');
                        Readln;
                End;
    End;

Begin {Menu de operaciones}

        Assign(fichero, 'Operaciones.TXT');
        Rewrite(fichero);
        Close(fichero);
Begin
Repeat
ClrScr;
 a:=a+0;
        Writeln('------------------Menu principal---------------------');
        Writeln('-------------(Operaciones realizadas: ' ,a,')--------------');
        Writeln('Escriba el numero de la operacion que va a realizar y presione ENTER.');
        Writeln('Retirar                           ---> 1');
        Writeln('Depositar                         ---> 2');
        Writeln('Consultar Saldo                   ---> 3');
        Writeln('Mostrar historial de operaciones  ---> 4');
        Writeln('Salir                             ---> 5');
        Readln(opt);

        Assign(fichero, 'Operaciones.TXT');
        append(fichero);
        Writeln(fichero,'---------------');
        Close(fichero);

                Case opt of
                        1 : Begin
                            ClrScr;
                                Writeln('Escriba el numero de la cuenta desde donde realizara el retiro y presione ENTER. ');

                                For i:=1 to c do
                                Begin
                                Writeln('[', Cliente[i].cedula,'] ---> ', i);
                                End;

                                read(i);

                            With Cliente[i] do
                            Begin
                            ClrScr;
                                Writeln('Seleccione la cantidad que va a retirar y presione ENTER.');
                                Writeln('1000 bs. ---> 1');    Writeln('2000 bs. ---> 2');
                                Writeln('10000 bs. --> 3');    Writeln('20000 bs. --> 4');
                                Writeln('50000 bs. --> 5');
                                Readln(opt);

                                        Case opt of
                                         1 : begin
                                             ClrScr;

                                             Saldo := Saldo-1000;

                                             Writeln('Su saldo actual es: ', Saldo, ' Bs.');
                                             Readln;

                                             assign(fichero, 'Operaciones.TXT');
                                             append(fichero);
                                             Writeln(fichero,'Cuenta utilizada: [', Cedula, ']');
                                             Writeln(fichero, 'Retiro de: 1000 Bs.');
                                             Writeln(fichero, 'Su saldo actual es: ', Saldo, ' Bs.');
                                             close(fichero);
                                             a := a+1;
                                             end;
                                         2 : begin
                                             ClrScr;

                                             Saldo := Saldo-2000;

                                             Writeln('Su saldo actual es: ', Saldo, ' Bs.');
                                             readln;

                                             assign(fichero, 'Operaciones.TXT');
                                             append(fichero);
                                             Writeln(fichero,'Cuenta utilizada: [', Cedula, ']');
                                             Writeln(fichero, 'Retiro de: 2000 Bs.');
                                             Writeln(fichero, 'Su saldo actual es: ', Saldo, ' Bs.');
                                             close(fichero);
                                             a := a+1;
                                             end;
                                         3 : begin
                                             ClrScr;

                                             Saldo := Saldo-10000;

                                             Writeln('Su saldo actual es: ', Saldo, ' Bs.');
                                             readln;

                                             assign(fichero, 'Operaciones.TXT');
                                             append(fichero);
                                             Writeln(fichero,'Cuenta utilizada: [', Cedula, ']');
                                             Writeln(fichero, 'Retiro de: 10000 Bs.');
                                             Writeln(fichero, 'Su saldo actual es: ', Saldo, ' Bs.');
                                             close(fichero);
                                             a := a+1;
                                             end;
                                         4 : begin
                                             ClrScr;

                                             Saldo := Saldo-20000;

                                             Writeln('Su saldo actual es: ', Saldo, ' Bs.');
                                             Readln;

                                             assign(fichero, 'Operaciones.TXT');
                                             append(fichero);
                                             Writeln(fichero,'Cuenta utilizada: [', Cedula, ']');
                                             Writeln(fichero, 'Retiro de: 20000 Bs.');
                                             Writeln(fichero, 'Su saldo actual es: ', Saldo, ' Bs.');
                                             close(fichero);
                                             a :=a+1;
                                             end;
                                         5 : begin
                                             ClrScr;

                                             Saldo := Saldo-50000;

                                             Writeln('Su saldo actual es: ', Saldo, ' Bs.');
                                             Readln;

                                             assign(fichero, 'Operaciones.TXT');
                                             append(fichero);
                                             Writeln(fichero,'Cuenta utilizada: [', Cedula, ']');
                                             Writeln(fichero, 'Retiro de: 50000 Bs.');
                                             Writeln(fichero, 'Su saldo actual es: ', Saldo, ' Bs.');
                                             close(fichero);
                                             a := a+1;
                                             end;
                                             end;
                            End;
                           End;
                        2 : Begin
                            ClrScr;
                                Writeln('Escriba el numero asignado a la cuenta desde donde realizara el deposito y presione ENTER. ');

                                For i:=1 to c do
                                Begin
                                Writeln('[', Cliente[i].cedula,'] ---> ', i);
                                End;

                                read(i);

                            With Cliente[i] do
                            Begin
                            ClrScr;
                            Writeln('Seleccione el tipo de deposito a realizar y presione ENTER.');
                            Writeln('Propia Cuenta ---> 1');       Writeln('Otra Cuenta -----> 2');
                            Readln(opt);

                               Case opt of
                                1 : begin
                                    ClrScr;
                                    Writeln('Monto a depositar: ');
                                    readln(dep);

                                    Saldo := Saldo+dep;

                                    ClrScr;
                                    Writeln('Su saldo actual es: ', Saldo, ' Bs.');
                                    Readln;

                                    assign(fichero, 'Operaciones.TXT');
                                    append(fichero);
                                    Writeln(fichero, 'Cuenta utilizada: [', cedula, ']');
                                    Writeln(fichero, 'Deposito a Propia Cuenta de: ', dep,' Bs.');
                                    Writeln(fichero, 'Su saldo actual es: ', Saldo, ' Bs.');
                                    close(fichero);
                                    a :=a+1;
                                    end;

                                2 : begin
                                    ClrScr;
                                    Writeln('Monto a depositar: ');
                                    readln(dep);

                                    if dep > Saldo then
                                        Begin
                                        ClrScr;
                                                Writeln('Transaccion fallida. SALDO INSUFICIENTE!.Presiona ENTER para continuar');
                                                Readln;

                                                assign(fichero, 'Operaciones.TXT');
                                                append(fichero);
                                                Writeln(fichero, 'Cuenta Utilizada: [', cedula,']');
                                                Writeln(fichero, 'Error en operacion. SALDO INSUFICIENTE!');
                                                close(fichero);
                                                a := a+1;
                                        End;

                                    if dep < Saldo then
                                    Begin
                                        ClrScr;
                                        Writeln('Ingrese el numero asignado a la cuenta a la que se le depositara: ');

                                        For i:= 1 to c do
                                        Begin
                                        Writeln('[', Cliente[i].cedula,'] ---> ', i);
                                        End;

                                        read(i);
                                        readln;

                                        Cliente[i].Saldo := Cliente[i].Saldo+dep;
                                        Saldo := Saldo-dep;

                                        ClrScr;
                                        Writeln('Transaccion exitosa!');
                                        Writeln('Su saldo actual es: ', Saldo, ' Bs.');
                                        readln;

                                        assign(fichero, 'Operaciones.TXT');
                                        append(fichero);
                                        Writeln(fichero, 'Cuenta utilizada: [', cedula, ']');
                                        Writeln(fichero, 'Deposito a Cuenta: [', Cliente[i].Cedula,'] de: ', dep,' Bs.');
                                        Writeln(fichero, 'Su saldo actual es: ', Saldo, ' Bs.');
                                        close(fichero);
                                        a := a+1;
                                    end;
                                    end;
                                end;
                                end;
                                end;
                        3 : begin
                            ClrScr;
                                Writeln('Escriba el numero asignado a la cuenta que quiere consultar y presione ENTER. ');

                                For i:=1 to c do
                                Begin
                                Writeln('[', Cliente[i].cedula,'] ---> ', i);
                                End;

                                read(i);
                                readln;

                            With Cliente[i] do
                            begin
                            ClrScr;
                            Writeln('Su saldo actual es: ', Saldo, ' Bs.');
                            Readln;

                            assign(fichero, 'Operaciones.TXT');
                            append(fichero);
                            Writeln(fichero, 'Cuenta utilizada: [', cedula, ']');
                            Writeln(fichero, 'Consulta de saldo actual: ', Saldo, ' Bs.');
                            close(fichero);
                            a := a+1;
                            end;

                           readln;
                           End;

                        4 : begin
                            ClrScr;
                            Writeln('//Historial de operaciones//');

                            assign(fichero, 'Operaciones.TXT');
                            reset(fichero);
                            While not eof(fichero) do
                            begin
                                readln(fichero, linea);
                                writeln(linea);
                            end;
                            close(fichero);
                            readln;

                            assign(fichero, 'Operaciones.TXT');
                            append(fichero);
                            Writeln(fichero, 'Revision del historial de operaciones.');
                            close(fichero);
                            a := a+1;
                            end;
                            end;



Until (opt =5) or (a =50);

End;
End;
End.
