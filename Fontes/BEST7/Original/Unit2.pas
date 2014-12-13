unit Unit2;


interface

uses Windows,Menus;

function fMainMenu (Menu : TMainMenu) : TMainMenu;

resourcestring

main1 = 'Files';
main2 = 'Quit';

const cMain : array [0..1] of string = ('Files','Quit');

implementation

function fMainMenu (Menu : TMainMenu) : TMainMenu;
var
i : integer;
 Begin
   for i := 0 to menu.Items.Count -1 do
     Begin
      menu.Items[i].caption := cmain[i];
     end;
  result := menu;   
 end;


end.
 