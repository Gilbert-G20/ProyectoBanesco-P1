{Programa para Emular el Funcionamiento de un Cajero Automatico}
Program CajeroBanesco;
Uses crt;
Type
        RegistroCliente = Record
        Cedula    :String[8];
        Nombre    :String;
        Apellido  :String;
        Saldo     :LongInt;
        End;

Var
        ReCliente :RegistroCliente;
        opt, i    :Integer;
        dep       :LongInt;
Begin
{Inicio del cajero}
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

{Registro del Cliente}
        ClrScr;
        Writeln('Por favor, ingrese los datos solicitados a continuacion para registrarse.');

        Writeln('Cedula: ');            Readln(ReCliente.Cedula);
        ClrScr;

        Writeln('Nombre: ');            Readln(ReCliente.Nombre);
        ClrScr;

        Writeln('Apellido: ');          Readln(ReCliente.Apellido);
        ClrScr;

        Writeln('Deposito incial: ');   Readln(ReCliente.Saldo);
        ClrScr;

        textBackground(green);
        textColor(yellow);
        Writeln('C.I: ', ReCliente.Cedula);
        Writeln(ReCliente.Nombre);
        Writeln(ReCliente.Apellido);
        Writeln(ReCliente.Saldo,' Bs.');
        Writeln;

        textBackground(black);
        textColor(white);
        Writeln('Ha sido registrado con exito, presione ENTER para continuar');
        Readln;

{Menu de operaciones}
        Begin
        Repeat
        ClrScr;
                Writeln('------------------Menu principal---------------------');
                Writeln('Escriba el numero de la operacion que va a realizar y presione ENTER.');
                Writeln('Retirar -----------------------------> 1');
                Writeln('Depositar ---------------------------> 2');
                Writeln('Consultar Saldo ---------------------> 3');
                Writeln('Mostrar historial de operaciones ----> 4');
                Writeln('Salir -------------------------------> 5');
                Readln(opt);

                Case opt of
                        1 : begin
                            ClrScr;
                            Writeln('Seleccione la cantidad que va a retirar y presione ENTER.');
                            Writeln('1000 bs. ---> 1');    Writeln('2000 bs. ---> 2');
                            Writeln('10000 bs. --> 3');    Writeln('20000 bs. --> 4');
                            Writeln('50000 bs. --> 5');
                            Readln(i);

                            Case i of
                                1 : begin
                                    Writeln('Su saldo actual ahora es: ', ReCliente.Saldo - 1000, ' Bs.');
                                    Readln;
                                    end;
                                2 : begin
                                    Writeln('Su saldo actual ahora es: ', ReCliente.Saldo - 2000, ' Bs.');
                                    readln;
                                    end;
                                3 : begin
                                    Writeln('Su saldo actual ahora es: ', ReCliente.Saldo - 10000, ' Bs.');
                                    readln;
                                    end;
                                4 : begin
                                    Writeln('Su saldo actual ahora es: ', ReCliente.Saldo - 20000, ' Bs.');
                                    Readln;
                                    end;
                                5 : begin
                                    Writeln('Su saldo actual ahora es: ', ReCliente.Saldo - 50000, ' Bs.');
                                    Readln;
                                    end;
                                End;
                            Readln;
                            end;

                        2 : begin
                            ClrScr;
                            Writeln('Cantidad que va a depositar: ');
                            Readln(dep);

                            ClrScr;
                            Writeln('Su saldo actual ahora es: ', ReCliente.Saldo + dep, ' Bs.');
                            Readln;
                            end;

                        3 : begin
                            ClrScr;
                            Writeln('Su saldo actual es: ', ReCliente.Saldo, ' Bs.');
                            Readln;
                            end;

                        4 : begin
                            ClrScr;
                            Writeln('//Historial de operaciones//'); {<--- En proceso de creacion}
                            Readln;
                            end;

                        5 : Exit;
                End;
        Until opt=5;
        End;

Readln;
End.



