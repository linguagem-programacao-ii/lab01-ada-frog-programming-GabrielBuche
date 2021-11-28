with
    Ada.Strings.Fixed,
    Ada.Text_IO,
    Ada.Integer_Text_IO;
use
    Ada.Strings.Fixed,
    Ada.Text_IO,
    Ada.Integer_Text_IO;

procedure ada is
    String_X : String(1..300) := (others => ' ');
    Separador : String := " ";
    Ultimo_i : Natural;
    Splitar_i : Integer;
    Altura_do_Pulo : Integer;
    Canos : Integer;
    Cano_atual : Integer;
    Pulo_atual : Integer;

    procedure Split(Source : in String; Pos: in Integer; Value : out Integer; Remainder: out String) is
        Tmp : String(1..Source'Last);
    begin
        if Pos = Source'Last then Move(Source, Tmp);
        else Move(Source(Source'First .. Pos-1), Tmp); 
            Move(Source(Pos+1 .. Source'Last), Remainder);
        end if;
        Value := Integer'Value(Tmp);
    end Split;
begin
    Get_Line(Item => String_X, Last => Ultimo_i);
    Splitar_i := Index(Source => String_X, Pattern => Separador, From => 1);

    Split(Source => String_X, Pos => Splitar_i, Value => Altura_do_Pulo, Remainder => String_X);
    Split(Source => String_X, Pos => String_X'Last, Value => Canos, Remainder => String_X);

    Get_Line(Item => String_X, Last => Last_I);
    
    for I in 1 .. Canos loop
        Split_Idx := Index(Source => String_X, Pattern => Separador, From => 1);
        Split(Source => String_X, Pos => Split_Idx, Value => Pulo_atual, Remainder => String_X);
        if I /= 1 and abs(Pulo_atual - Cano_atual) > Altura_do_Pulo then
            Put_Line("voce perdeu");
            exit;
        end if;
        Cano_atual := Pulo_atual;
        if I = Canos then
            Put_Line("voce ganhou");
        end if;
    end loop;
end ada;