{Programa para Emular el Funcionamiento de un Cajero Automatico}
Program CajeroBanesco;
Uses crt;
Type
        RegistroCliente = Record
        Cedula, Saldo       :LongInt;
        Nombre, Apellido    :String;
        End;

        ReCliente = array[1..4] of RegistroCliente;
Var
        Cliente   :ReCliente;
        opt, i    :Integer;
        dep, cd   :LongInt;
        fichero   :text;
        linea     :String;
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

ClrScr;
        Writeln('--RECOMENDACIONES--');
        Writeln('1.Cualquier monto escrito no puede superar las 10 cifras.');
        Writeln('2.Cuando salgas del menu principal, se borraran todos los datos, asegurate de hacer todo lo que quieras.');
        Writeln('3.La informacion que escribas puede ser personal. QUE NADIE MAS LA VEA!');
        readln;

                Begin {Registro del Cliente + dos clientes predeterminados}

                With Cliente[1] do
                Begin
                        Cedula   := 30424655;
                        Nombre   := 'Penelope';
                        Apellido := 'Ody';
                        Saldo    := 100000;
                end;

                With Cliente[2] do
                Begin
                        Cedula   := 15407077;
                        Nombre   := 'Haruki';
                        Apellido := 'Murakami';
                        Saldo    := 750000;
                end;

                ClrScr;
                Writeln('Por favor, ingrese los datos solicitados a continuacion para registrarse.');

                Writeln('Cedula: ');            Readln(Cliente[3].Cedula);
                ClrScr;

                Writeln('Nombre: ');            Readln(Cliente[3].Nombre);
                ClrScr;

                Writeln('Apellido: ');          Readln(Cliente[3].Apellido);
                ClrScr;

                Writeln('Deposito incial: ');   Readln(Cliente[3].Saldo);
                ClrScr;

                assign(fichero, 'NuevoCliente.TXT');
                rewrite(fichero);
                Writeln(fichero,'Cedula: ', Cliente[3].Cedula);
                Writeln(fichero,'Nombre: ', Cliente[3].Nombre);
                Writeln(fichero,'Apellido: ', Cliente[3].Apellido);
                Writeln(fichero,'Saldo inicial: ', Cliente[3].Saldo, ' Bs.');
                Close(fichero);

                textBackground(green);
                textColor(yellow);
                Writeln('C.I: ', Cliente[3].Cedula);
                Writeln(Cliente[3].Nombre);
                Writeln(Cliente[3].Apellido);
                Writeln(Cliente[3].Saldo,' Bs.');
                Writeln;

                textBackground(black);
                textColor(white);
                Writeln('Ha sido registrado con exito, presione ENTER para continuar');
                Readln;
                End;

{Menu de operaciones}
        Begin
        Repeat
        ClrScr;
                Writeln('------------------Menu principal---------------------');
                Writeln('Escriba el numero de la operacion que va a realizar y presione ENTER.');
                Writeln('Retirar                           ---> 1');
                Writeln('Depositar                         ---> 2');
                Writeln('Directorio                        ---> 3');
                Writeln('Agregar al directorio             ---> 4');
                Writeln('Consultar Saldo                   ---> 5');
                Writeln('Mostrar historial de operaciones  ---> 6');
                Writeln('Salir                             ---> 7');
                Readln(opt);

                assign(fichero, 'NuevoCliente.TXT');
                append(fichero);
                writeln(fichero,'---------------');
                close(fichero);

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
                                    ClrScr;

                                    Cliente[3].Saldo := Cliente[3].Saldo-1000;

                                    Writeln('Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                    Readln;

                                    assign(fichero, 'NuevoCliente.TXT');
                                    append(fichero);
                                    Writeln(fichero, 'Retiro de: 1000 Bs.');
                                    Writeln(fichero, 'Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                    close(fichero);

                                    end;
                                2 : begin
                                    ClrScr;

                                    Cliente[3].Saldo := Cliente[3].Saldo-2000;

                                    Writeln('Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                    readln;

                                    assign(fichero, 'NuevoCliente.TXT');
                                    append(fichero);
                                    Writeln(fichero, 'Retiro de: 2000 Bs.');
                                    Writeln(fichero, 'Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                    close(fichero);

                                    end;
                                3 : begin
                                    ClrScr;

                                    Cliente[3].Saldo := Cliente[3].Saldo-10000;

                                    Writeln('Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                    readln;

                                    assign(fichero, 'NuevoCliente.TXT');
                                    append(fichero);
                                    Writeln(fichero, 'Retiro de: 10000 Bs.');
                                    Writeln(fichero, 'Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                    close(fichero);

                                    end;
                                4 : begin
                                    ClrScr;

                                    Cliente[3].Saldo := Cliente[3].Saldo-20000;

                                    Writeln('Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                    Readln;

                                    assign(fichero, 'NuevoCliente.TXT');
                                    append(fichero);
                                    Writeln(fichero, 'Retiro de: 20000 Bs.');
                                    Writeln(fichero, 'Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                    close(fichero);

                                    end;
                                5 : begin
                                    ClrScr;

                                    Cliente[3].Saldo := Cliente[3].Saldo-50000;

                                    Writeln('Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                    Readln;

                                    assign(fichero, 'NuevoCliente.TXT');
                                    append(fichero);
                                    Writeln(fichero, 'Retiro de: 50000 Bs.');
                                    Writeln(fichero, 'Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                    close(fichero);

                                    end;
                                End;
                            Readln;
                            end;

                        2 : begin
                            ClrScr;
                            Writeln('Seleccione el tipo de deposito a reaalizar y presione ENTER.');
                            Writeln('Cuenta Propia ---> 1');        Writeln('Otra Cuenta -----> 2');
                            Readln(i);

                               Case i of
                                1 : begin
                                    ClrScr;
                                    Writeln('Monto a depositar: ');
                                    readln(dep);

                                    Cliente[3].Saldo := Cliente[3].Saldo+dep;

                                    ClrScr;
                                    Writeln('Su saldo actual es: ', CLiente[3].Saldo, ' Bs.');
                                    Readln;

                                    assign(fichero, 'NuevoCliente.TXT');
                                    append(fichero);
                                    Writeln(fichero, 'Deposito a Cuenta Propia de: ', dep,' Bs.');
                                    Writeln(fichero, 'Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                    close(fichero);

                                    end;

                                2 : begin
                                    ClrScr;
                                    Writeln('Monto a depositar: ');
                                    readln(dep);

                                    if dep < Cliente[3].Saldo then
                                    Begin
                                    ClrScr;
                                    Writeln('Numero de cedula del cliente al que va a depositar: ');
                                    readln(cd);

                                        If cd = Cliente[1].Cedula then
                                        Begin
                                                ClrScr;
                                                Writeln('OPERACION EXITOSA!');

                                                Cliente[3].Saldo := Cliente[3].Saldo - dep;

                                                Writeln('Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                                Readln;

                                                assign(fichero, 'NuevoCliente.TXT');
                                                append(fichero);
                                                Writeln(fichero, 'Deposito a Cuenta:[', Cliente[1].Cedula, '] De:', dep,' Bs.');
                                                Writeln(fichero, 'Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                                close(fichero);
                                        End;

                                        If cd = Cliente[2].Cedula then
                                        Begin
                                                ClrScr;
                                                Writeln('OPERACION EXITOSA!');

                                                Cliente[3].Saldo := Cliente[3].Saldo - dep;

                                                Writeln('Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                                Readln;

                                                assign(fichero, 'NuevoCliente.TXT');
                                                append(fichero);
                                                Writeln(fichero, 'Deposito a Cuenta:[', Cliente[2].Cedula, '] De:', dep,' Bs.');
                                                Writeln(fichero, 'Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                                close(fichero);
                                        End;

                                        If cd = Cliente[4].Cedula then
                                        Begin
                                                ClrScr;
                                                Writeln('OPERACION EXITOSA!');

                                                Cliente[3].Saldo := Cliente[3].Saldo - dep;

                                                Writeln('Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                                Readln;

                                                assign(fichero, 'NuevoCliente.TXT');
                                                append(fichero);
                                                Writeln(fichero, 'Deposito a Cuenta:[', Cliente[4].Cedula, '] De:', dep,' Bs.');
                                                Writeln(fichero, 'Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                                                close(fichero);
                                        End;


                                        if (cd <> Cliente[1].Cedula) then
                                        Begin
                                                 if (cd <> Cliente[2].Cedula) then
                                                 begin
                                                        if (cd <> Cliente[4].Cedula) then
                                                        begin
                                                                ClrScr;
                                                                Writeln('El Cliente que buscas no esta registrado en este banco.');
                                                                readln;
                                                        end;
                                                 end;
                                        End;

                                    end;

                                    if dep > Cliente[3].Saldo then
                                    Begin
                                    ClrScr;
                                        Writeln('Operacion invalida. SALDO INSUFICIENTE!');
                                        readln;
                                    end;

                                    End;
                                end;
                            end;

                        3 : begin
                            ClrScr;
                                Writeln('Los clientes registrados en su directorio son: ');
                                Writeln('[', Cliente[1].Cedula, '] ---> ', Cliente[1].Apellido);
                                Writeln('[', Cliente[2].Cedula, '] ---> ', Cliente[2].Apellido);

                                if Cliente[4].Cedula > 1 then
                                begin
                                        Writeln('[', Cliente[4].Cedula, '] ---> ', Cliente[4].Apellido);
                                end;

                                readln;
                            end;

                        4 : begin
                            ClrScr;
                                Writeln('Nombre: ');   Readln(CLiente[4].Nombre);
                                readln;

                            ClrScr;
                                Writeln('Apellido: '); Readln(CLiente[4].Apellido);
                                readln;

                            ClrScr;
                                Writeln('Cedula: ');   Readln(Cliente[4].Cedula);
                                readln;

                            ClrScr;
                                Writeln('Registrado con exito! (Presione ENTER para continuar)');
                                readln;
                            end;

                        5 : begin
                            ClrScr;
                            Writeln('Su saldo actual es: ', Cliente[3].Saldo, ' Bs.');
                            Readln;

                            assign(fichero, 'NuevoCliente.TXT');
                            append(fichero);
                            Writeln(fichero, 'Consulta de saldo actual: ', Cliente[3].Saldo, ' Bs.');
                            close(fichero);

                            end;

                        6 : begin
                            ClrScr;
                            Writeln('//Historial de operaciones//');
                            Readln;

                            assign(fichero, 'NuevoCliente.TXT');
                            reset(fichero);
                            While not eof(fichero) do
                            begin
                                readln(fichero, linea);
                                writeln(linea);
                            end;
                            close(fichero);
                            readln;

                            end;

                        7 : Exit;
                End;
        Until opt=7;
        End;

Readln;
End.




