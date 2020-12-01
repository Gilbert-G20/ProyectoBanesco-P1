{Programa para Emular el Funcionamiento de un Cajero Autom tico}
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
Readln;
End.



