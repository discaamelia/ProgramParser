//      Kelompok 1
//10114188 - Encep Suryana
//10114321 - Ihsan Khairul Jamil
//10114345 - Disca Amelia
//10114017 - Affandy Wahyudin
//10114427 - Rezha Maulana Jaya

program ParserKel1;
uses Crt;

const
     maks =100;
type
    Parse=array [1..maks] of string;

var //Kamus Global
    menu, panjang,z,b          : integer;
    prg_sumber, f_hasil        : text;
    i                          : byte;
    karakter                   : char;
    kata, Nm_Token             : string [20];
    parser                     : parse;
    benar,salah                : boolean;


// Fungsi Cek Keyword
Function cekkeyword (s:string):string;
var // Kamus Lokal Prosedur
    ftext : text;
    data : string;
begin
     panjang :=length(s);
     for i := 1 to panjang do
     begin
          if s[i] =upcase (s[i]) then
             s[i]:=s[i]
          else
              s[i]:= chr(ord(s[i])+32);
     end;
     assign (ftext,'Keyword.txt');
     reset(ftext);
     while not eof(ftext) do
     begin
          readln (ftext, data);
          if s=data then
          Nm_token := 'Identifier /Keyword';
     end;
     close (ftext);
end;

//Mencetak Hasil
Procedure hasil (var parser :parse);
begin
     parser[b]:= kata;
     append(f_hasil);
     writeln(f_hasil, kata : 15, ' : ', Nm_token);
     writeln(kata : 7, ' : ', Nm_token);
     b:=b+1;


end;

procedure periksa;
begin
     while not eof (prg_sumber) do
     begin
        read(prg_sumber, karakter);
        if karakter = '{' then
        begin
             repeat
             begin
                  read(prg_sumber, karakter);
             end;
             until karakter ='}';
             kata:= '';
        end;
        if karakter =char (39) then
        begin
             repeat
             begin
                  kata := kata +karakter;
                  read(prg_sumber, karakter);
             end;
             until karakter=char (39);
             kata := kata + karakter;
             Nm_token := 'Kalimat String';
             hasil(parser);
             kata := '';
        end;
        if (karakter in['A'..'Z','a'..'z','_']) then {mengecek karakter/kata}
          begin
               repeat
               begin
                    kata := kata + karakter;
                    read(prg_sumber,karakter);
                    if((kata = 'program')OR(kata = 'Program'))then
                            Nm_token:='program'
                    else if((kata = 'var')OR(kata = 'Var'))then
                            Nm_token:='varsy'
                    else if((kata = 'not') OR(kata = 'NOT'))then
                            Nm_token:='notsy'
                    else if(kata = 'mod')then
                            Nm_token:='imod'
                    else if((kata = 'and') OR(kata = 'AND'))then
                            Nm_token:='andsy'
                    else if((kata = 'or') OR(kata = 'OR'))then
                            Nm_token:='orsy'
                    else if((kata = 'const') OR(kata = 'CONST'))then
                            Nm_token:='constsy'
                    else if((kata = 'type') OR(kata = 'Type'))then
                            Nm_token:='typesy'
                    else if((kata = 'procedure') OR(kata = 'Procedure'))then
                            Nm_token:='proceduresy'
                    else if((kata = 'function') OR(kata = 'Function'))then
                            Nm_token:='functionsy'
                    else if((kata = 'begin')OR(kata = 'Begin'))then
                            Nm_token:='beginsy'
                    else if((kata = 'if')OR(kata = 'IF'))then
                            Nm_token:='ifsy'
                    else if((kata = 'case')OR(kata = 'CASE'))then
                            Nm_token:='casesy'
                    else if((kata = 'repeat')OR(kata = 'Repeat'))then
                            Nm_token:='repeatsy'
                    else if((kata = 'while')OR(kata = 'While'))then
                            Nm_token:='whilesy'
                    else if((kata = 'for')OR(kata = 'For'))then
                            Nm_token:='forsy'
                    else if((kata = 'end')OR(kata = 'End'))then
                            Nm_token:='endsy'
                    else if(kata = 'else')then
                            Nm_token:='elsesy'
                    else if(kata = 'until')then
                            Nm_token:='untilsy'
                    else if(kata = 'of')then
                            Nm_token:='ofsy'
                    else if(kata = 'do')then
                            Nm_token:='dosy'
                    else if(kata = 'to')then
                            Nm_token:='tosy'
                    else if(kata = 'downto')then
                            Nm_token:='downtosy'
                    else if(kata = 'then')then
                            Nm_token:='thensy'
                    else if(kata = 'integer')then
                            Nm_token:='typeint'
                    else if(kata = 'char')then
                            Nm_token:='typechar'
                    else if(kata = 'real')then
                            Nm_token:='typereal'
                    else if((kata = 'writeln')OR(kata = 'Writeln'))then
                            Nm_token:='writeln'
                    else if((kata = 'readln')OR(kata = 'Readln'))then
                            Nm_token:='readln'
                    else
                            Nm_token:='Identifier';

               end;
               until (not(karakter in['A'..'Z','a'..'z','_']));
               cekkeyword(kata);
               hasil(parser);
               kata :='';
          end;

          if (karakter in['0'..'9']) then {mengecek angka}
          begin
               repeat
               begin
                    kata := kata + karakter;
                    read(prg_sumber,karakter);
               end;
               until (not(karakter in['0'..'9']));
               Nm_token := 'Identifier / Integer';
               hasil(parser);
               kata :='';
          end;

          if (karakter in['+','-','*','/','^','=','<','>']) then
          begin
               repeat
               begin
                    kata := kata+karakter;
                    read(prg_sumber,karakter);
                    if(kata = '+') then
                                Nm_token :='plus'
                    else if(kata = '-') then
                                Nm_token :='minus'
                    else if(kata = '*') then
                                Nm_token :='times'
                    else if(kata = '/') then
                                Nm_token :='rdiv'
                    else if(kata = '=') then
                                Nm_token :='egl'
                    else if(kata = ':=') then
                                Nm_token :='becomes'
                    else if(kata = '<') then
                                Nm_token :='lss'
                    else if(kata = '>') then
                                Nm_token :='gtr'
                    else if(kata = '>=') then
                                Nm_token :='geg'
                    else if(kata = '<=') then
                                Nm_token :='leg'
                    else
                        Nm_token :='Token Tidak Dikenali';
               end;
               until (not(karakter in['+','-','*','/','^','=','<','>']));


               hasil(parser);
               kata:='';
          end;

          if (karakter in['(',')','[',']',':',';',',','.']) then
          begin
               kata:=karakter;
               if(kata = '(')then
                       Nm_token :='lparent'
               else if(kata = ')')then
                       Nm_token :='rparent'
               else if(kata = '[')then
                       Nm_token :='lbrack'
               else if(kata = ']')then
                       Nm_token :='rbrack'
               else if(kata = ':')then
                       Nm_token :='period'
               else if(kata = ';')then
                       Nm_token :='semicolon'
               else if(kata = '.')then
                       Nm_token :='colon'
               else if(kata = ',')then
                       Nm_token :='comma'
               else
                       Nm_token :='identifier';

               hasil(parser);
               kata:='';
          end;
     end;
end;
//Parsing
procedure endd;
begin
     if(parser[z] = 'end') then
      begin
       writeln();
       writeln('No : [',z,']  ',parser[z]);
       writeln('statement');
       writeln(parser[z]);
       writeln();
       writeln('Grammar Diterima');
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');

       salah := true;
     end;
end;

procedure titikkomaaa;
begin
     if(parser[z] = ';') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('if');
       writeln('aksi');
       writeln('titikkoma');
       writeln(parser[z]);
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
      end;
end;

procedure masukkan;
begin
     if(parser[z] <> 'kosong') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('asigment');
       writeln(parser[z]);
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
       titikkomaaa;
      end;
end;

procedure asigment;
begin
     if(parser[z] <> 'kosong') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('aksi');
       writeln('asigment');
       writeln(parser[z]);
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
       masukkan;
      end;
end;

procedure aksiif;
begin
     if(parser[z] <> 'kosong') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('if');
       writeln('aksi');
       writeln('namadata');
       writeln(parser[z]);
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
       asigment;
      end;
end;

procedure thenn;
begin
     if(parser[z] <> 'kosong') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('aksi');
       writeln('if');
       writeln(parser[z]);
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
       aksiif;
      end;
end;

procedure kurungtutup;
begin
     if(parser[z] <> 'kosong') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('aksi');
       writeln('if');
       writeln(parser[z]);
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
         thenn;
      end;
end;

procedure pembanding;
begin
     if(parser[z] <> 'kosong') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('aksi');
       writeln('if');
       writeln('pembanding');
       writeln(parser[z]);
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
         kurungtutup;
      end;
end;

procedure oprator;
begin
     if(parser[z] <> 'kosong') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('aksi');
       writeln('if');
       writeln('oprator');
       writeln(parser[z]);
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Error');
       salah := true;
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
         pembanding;
      end;
end;

procedure kondisi;
begin
     if(parser[z] <> 'kosong') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('aksi');
       writeln('if');
       writeln('kondisi');
       writeln('namadata');
       writeln(parser[z]);
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
         oprator;
      end;
end;

procedure kurungbuka;
begin
     if(parser[z] = '(') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('aksi');
       writeln('if');
       writeln('(');
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
         kondisi;
      end;
end;

procedure iff;
begin
     if(parser[z] = 'if') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('aksi');
       writeln('if');
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
         kurungbuka;
      end;
end;

procedure aksi;
begin
   while ((parser[z] <> 'end')and (salah = false)) do
   begin
     if(parser[z] = 'if') then
      begin
       iff;
       benar := true;
      end
      else
      if(parser[z] <> 'kosong') then
       begin
        aksiif;
       end
       else
       begin
         writeln();
         writeln('Grammar Tidak Diterima');
         salah := true;
       end;
    end;
      if((benar = true)and (salah = false)) then
      begin
         benar := false;
         endd;
      end;
end;

procedure statement;
begin
     if(parser[z] = 'begin') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('pascal');
       writeln('statement');
       writeln('begin');
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

      if((benar = true) and (salah = false)) then
      begin
         benar := false;
         z := z+1;
         aksi;
      end;
end;

procedure titikkomaa;
begin
  if(parser[z] = ';') then
   begin
     writeln();
     writeln('No :[',z,']  ',parser[z]);
     writeln('deklarasi');
     writeln('titikkoma');
     writeln(';');
     benar := true;
   end
  else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

  if(benar = true) then
  begin
   benar := false;
   z := z+1;

   end;
end;

procedure tipedata;
begin
  if(parser[z] = 'integer') then
   begin
     writeln();
     writeln('No :[',z,']  ',parser[z]);
     writeln('deklarasi');
     writeln('tipedata');
     writeln('integer');
     benar := true;
   end
  else
    if(parser[z] = 'real') then
    begin
     writeln();
     writeln('No :[',z,']  ',parser[z]);
     writeln('deklarasi');
     writeln('tipedata');
     writeln('real');
     benar := true;
    end
    else
       if(parser[z] = 'real') then
       begin
          writeln();
          writeln('No :[',z,']  ',parser[z]);
          writeln('deklarasi');
          writeln('tipedata');
          writeln('real');
          benar := true;
       end
       else
         if(parser[z] = 'string') then
         begin
            writeln();
            writeln('No :[',z,']  ',parser[z]);
            writeln('deklarasi');
            writeln('tipedata');
            writeln('string');
            benar := true;
         end
         else
           if(parser[z] = 'char') then
           begin
             writeln();
             writeln('No :[',z,']  ',parser[z]);
             writeln('deklarasi');
             writeln('tipedata');
             writeln('char');
             benar := true;
           end
           else
             if(parser[z] = 'boolean') then
             begin
               writeln();
               writeln('No :[',z,']  ',parser[z]);
               writeln('deklarasi');
               writeln('tipedata');
               writeln('boolean');
               benar := true;
             end
             else
             begin
               writeln();
               writeln('Grammar Tidak Diterima');
               salah := true;
             end;

  if(benar = true) then
  begin
   benar := false;
   z := z+1;
   titikkomaa;
   end;
end;


procedure titkdua;
begin
  if(parser[z] = ':') then
   begin
     writeln();
     writeln('No :[',z,']  ',parser[z]);
     writeln('deklarasi');
     writeln('titikdua');
     writeln(':');
     benar := true;
   end
  else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

  if(benar = true) then
  begin
   benar := false;
   z := z+1;
   tipedata;
   end;
end;

procedure namavar;
begin
       if(parser[z] <> 'kosong') then
       begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('deklarasi');
       writeln('namaVar');
       writeln(parser[z]);
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
       salah := true;
     end;

       if(benar = true) then
       begin
        benar := false;
        z := z+1;
        titkdua;
       end;

end;

procedure deklarasi;
begin
       if(parser[z] = 'var') then
       begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('deklarasi');
       writeln('var');
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
         salah := false;
        while ((parser[z]<>'begin') and (salah=false)) do
        begin
           benar := false;
           namavar;
         end;
        if (salah = false) then
        begin
         statement;
        end;
      end;
end;

procedure titkkoma;
begin
  if(parser[z] = ';') then
   begin
     writeln();
     writeln('No :[',z,']  ',parser[z]);
     writeln('pascal');
     writeln('judul');
     writeln('program');
     writeln('namaprogram');
     writeln('hitung');
     writeln(';');
     benar := true;
   end
  else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
     end;

  if(benar = true) then
  begin
   benar := false;
   z := z+1;
   deklarasi;
   end;
end;

procedure namaprogram;
begin
  if(parser[z] <> 'kosong') then
   begin
     writeln();
     writeln('No :[',z,']  ',parser[z]);
     writeln('pascal');
     writeln('judul');
     writeln('program');
     writeln('namaprogram');
     writeln(parser[z]);
     benar := true;
   end
  else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
     end;

  if(benar = true) then
  begin
   benar := false;
   z := z+1;
   titkkoma;
  end;
end;

procedure judul;
begin
     if(parser[z] = 'program') then
      begin
       writeln();
       writeln('No :[',z,']  ',parser[z]);
       writeln('pascal');
       writeln('judul');
       writeln('program');
       benar := true;
      end
     else
     begin
       writeln();
       writeln('Grammar Tidak Diterima');
     end;

      if(benar = true) then
      begin
         benar := false;
         z := z+1;
         namaprogram;
      end;
end;


// Program Utama
begin
repeat
     clrscr();
     writeln('-----------------------------');
     writeln('Kelompok 1 Scanner dan Parser');
     writeln('-----------------------------');
     writeln('1. Scaner dan Parser');
     writeln('0. Keluar');
     write  ('Pilih Menu : ');



     readln(menu);

     case (menu) of
     1 :
        begin
             clrscr();
             b:=b+1;
             assign (prg_sumber, 'ProgramBenar.txt');
             //assign (prg_sumber, 'ProgramSalah.txt');
             reset(prg_sumber);
             assign(f_hasil,'Scanner.txt');
             rewrite(f_hasil);
             writeln ('----------------------');
             writeln ('|    Token Scanner   |');
             writeln ('----------------------');
             periksa;
             close (prg_sumber);
             close (f_hasil);
             writeln ('Jumlah Token = ',b-1);
             writeln ('Tekan Enter Untuk Parsing');
             readln();
             writeln ();
             writeln ('Parsing Kode Sumber');
             z:=1;
             judul;
             writeln ();

             //writeln ('Hasil Scanner bisa dilihat di HasilScanner.txt');
             readln;
        end;

        0 :

        begin
           writeln ('Terima kasih :)');readln;
        end
        else
        begin
          write ('Menu salah');
          readln();
        end;
        end;
until (menu=0);
end.

