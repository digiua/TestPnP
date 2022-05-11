unit Ufact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFfact = class(TForm)
    Button1: TButton;
    Button2: TButton;
    divisa: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ffact: TFfact;

implementation

uses UtestDEMO;

{$R *.dfm}

function TMain.EnviaryRecibir(Cadena:String):String;
var
   Envio,BCC,Debugging,enviar:String;
   Contador,Suma,Static,i:Integer;
   ahora:tdatetime;
begin
   // Se calcula el número de secuencia que acompañará la
   // instrucción.

   frespuesta:=false;
   Secuencia := Secuencia + $1;
   While (Secuencia < $20) Or (Secuencia > $46) do secuencia:=random($50);
    // Configura la cadena de salida (que se envía por el
    // puerto serial).
    Enviar := chr(STX)+chr(Secuencia)+Cadena+chr(ETX);
    edenvio.text:=transforma(enviar);
    // Suma los caracteres de la cadena de salida para
    // calcular el BCC.
    Suma := 0;
    For I := 1 To Length(Enviar) do
        Suma := Suma + ord(Enviar[i]);

    //' Convierte la suma en el BCC hexadecimal de 4 caracteres
    //' y agrega este último a la cadena de salida.
    BCC := format('%1.4x',[suma]);
    Enviar := Enviar+BCC;
    respuesta.text:='';
    puerto.WriteText(Enviar);

    //Loop de espera d&e respuesta
    ahora:=now+1/24/60/2;
    while (not frespuesta) and (ahora>now) do application.ProcessMessages;
    puerto.readtext;
    ahora:=now+1/24/60/60;    //1 seg aunque es demasiado
    while ahora>now do application.ProcessMessages;
    puerto.readtext;
end;

function TMain.transforma(entrada:string):string;
var
   x:integer;
begin
   result:='';
   for x:=1 to length(entrada) do
      case entrada[x] of
         chr(STX):result:=result+'[STX]';
         chr(ETX):result:=result+'[ETX]';
         chr(SEP):result:=result+'[FS]';   //'9','A'..'Z','a'.. '_',
         '0'..'z','.',',','-',' ':result:=result+entrada[x];
         else
         result:=result+'['+inttostr(ord(entrada[x]))+']';
      end;
end;
procedure TFfact.Button1Click(Sender: TObject);
var
   CadEnvio,can,pre,aux:string;
   ultimo,primero:boolean;
   c:char;
begin
   primero:=true;
   with main do begin
   CadEnvio := Chr($40) + Chr(SEP);
   If (rif.text<>'') and (razon.text<>'') then begin
      if length(razon.text)>38 then begin
           CadEnvio:= CadEnvio  +Chr(SEP) + rif.text+ chr(SEP)+chr($00)+chr(SEP)
           +chr($7F)+chr(SEP)+chr($7F)+chr(SEP)+
            chr($7F)+chr(SEP)+'T'+chr(SEP)+chr($7F)
           +chr(SEP)+chr($7F);
           enviaryrecibir(Cadenvio);
       //    cADENVIO:=Chr($41) + Chr(SEP) + 'RIF: '+rif.text+ ' Razon Social:' + Chr(SEP)+'S';
       //    enviaryrecibir(Cadenvio);
           cADENVIO:=Chr($41) + Chr(SEP) + COPY(RAZON.TEXT,1,40) + Chr(SEP)+'S';
           enviaryrecibir(Cadenvio);
           cADENVIO:=Chr($41) + Chr(SEP) + COPY(RAZON.TEXT,41,40) + Chr(SEP)+'S';
           if length(trim(COPY(RAZON.TEXT,41,40)))>0 then 
           enviaryrecibir(Cadenvio);
          // cADENVIO:=Chr($41) + Chr(SEP) + 'Cant   Desc                   Precio' + Chr(SEP)+'S';
          // enviaryrecibir(Cadenvio);
           cADENVIO:=Chr($41) + Chr(SEP) + '----------------------------------------' + Chr(SEP)+'S';
         end else
            CadEnvio := CadEnvio + Razon.Text + Chr(SEP) + RIF.Text+ chr(SEP)+chr($7F)+chr(SEP)
            +chr($7F)+chr(SEP)+chr($7F)+chr(SEP)+
            chr($7F)+chr(SEP)+'T'+chr(SEP)+chr($7F)
            +chr(SEP)+chr($7F);
         end
      else
           CadEnvio:= CadEnvio + Chr($7F)+Chr(SEP) + Chr($7F)+ chr(SEP)+chr($7F)+chr(SEP)
           +chr($7F)+chr(SEP)+chr($7F)+chr(SEP)+
            chr($7F)+chr(SEP)+'T'+chr(SEP)+chr($7F)
           +chr(SEP)+chr($7F);
            //' Se envía la cadena generada.
     EnviaryRecibir(CadEnvio);
        // renglones
     MEM.First;
     while not mem.Eof do begin
        ultimo:=false;
        can:='1000';
        pre:='0';
        try
          can:=inttostr(trunc(mem.FieldValues['Cant']*1000));
           //while length(can)< 7 do can:='0'+can;
          pre:=inttostr(trunc(mem.FieldValues['Precio']*100));
        except
        end;

    //    if primero and (length(razon.text)>38)  then begin
     //      CadEnvio := Chr($42) + Chr(SEP) + Chr($7F)+ Chr(SEP);
      //     CadEnvio := CadEnvio + '0' + Chr(SEP);
     //      CadEnvio := CadEnvio + '0' + Chr(SEP);
    //       CadEnvio := CadEnvio + '0000';
     //      CadEnvio := CadEnvio + Chr(SEP) + 'M' + Chr(SEP) + Chr($7F) + Chr(SEP) + Chr($7F) + Chr(SEP) + Chr($7F);
    //       EnviaryRecibir(CadEnvio);
     //   end;

           CadEnvio := Chr($42) + Chr(SEP) + copy(mem.FieldValues['Desc'],1,20) + Chr(SEP);
           CadEnvio := CadEnvio + can + Chr(SEP);
           CadEnvio := CadEnvio + pre + Chr(SEP);
           try
           aux:= mem.FieldValues['IMP'];
           case aux[1] of
             'G': CadEnvio := CadEnvio + '1600';
             'A': CadEnvio := CadEnvio + '3100';
             'R': CadEnvio := CadEnvio + '0800';
           else
              CadEnvio := CadEnvio + '0000';
           end;
           except
              CadEnvio := CadEnvio + '0000';
           end;
           CadEnvio := CadEnvio + Chr(SEP) + 'M' + Chr(SEP) + Chr($7F)+
             Chr(SEP) + Chr($7F) + Chr(SEP) + Chr($7F);
        EnviaryRecibir(CadEnvio);
        if length(mem.FieldValues['Desc'])>22 then begin
           ultimo:=true;
           cADENVIO:=Chr($41) + Chr(SEP) + COPY(mem.FieldValues['Desc'],21,40) + Chr(SEP)+'S';
           enviaryrecibir(Cadenvio);
        end;
        mem.delete;
     end;
     //cERRANDO fACTURA
//     if ultimo then begin
     // Producto final ya que ultimo comando debe ser un porducto antes de cierre de factura
//        CadEnvio := Chr($42) + Chr(SEP) + Chr($7F) + Chr(SEP)+ '9999' + Chr(SEP) + 'M' + Chr(SEP) + Chr($7F)+
//             Chr(SEP) + Chr($7F) + Chr(SEP) + Chr($7F);
 //       EnviaryRecibir(Cadenvio);
//     end;
     if divisa.text<>'0' then begin
     try
        pre:=inttostr(trunc(strtocurr(divisa.Text)*100));
        EnviaryRecibir(Chr($45) + Chr(SEP) + 'U' +Chr(SEP) + pre);
     except
         EnviaryRecibir(Chr($45) + Chr(SEP) + 'T');
     end;
     end else
     EnviaryRecibir(Chr($45) + Chr(SEP) + 'T');
    end;
end;

end.
