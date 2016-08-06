unit bst_MainEN;


interface

uses Windows,Menus,dialogs;

function fMainMenu (Menu : TMainMenu) : TMainMenu;



const cMainPR : array [0..20] of string = ('Atividades/Activities',
         'Aspectos Críticos/Issues',
         'Alvos de melhoria/Improvements',
        'Regras de Negócio/Business Rules',
         'Atores/Actors',
         'Pessoas/People',
         'Eventos de Negócio/Business Events' ,
         'Fluxos de dados/Data Groups',
         'Locais de Processamento/Sites',
         'Entidades Externas/Foreign Entities',
         'Ator x Atividade/Actor x Activities',
         '-',
       'Objetos de Interface/Interface Objects',
         'Objetos de Controle/Control Objects',
         'Objetos de Negócio/Business Objects',
         'Atividades x Objetos de Interface/Activities x Interface Objects' ,
       'Elementos de dado/Data Elements',
         'Aplicação dos Dados/Data Cross Reference' ,
        'Mecanismos/Sofwares',
        'Ator x Pessoa/Actor x People',
         'Atividade x Tecnologia/Activities x Technology');


 cMainPR5 : array [0..3] of string = ('Ajuda/Help','Sobre BEST/About','-','Configuração Atual/Current Configuration');



const cMainEN : array [0..6] of string = ('Tables','Dimensions','Repositories','Tools','Reports','Help','Exit');
const cMainEN0 : array [0..2] of string = ('Companies','Market','Domains');
const cMainEN1 : array [0..11] of string = ('Activities','Business Events','-','Business Rules','-','Human Resources','-','Technology','Information','Environment','-','Issues and Improvements');
const cMainEN15 : array [0..1] of string = ('Actors Classes','People');
const cMainen17 : array [0..3] of string = ('Interface Object','Control Object','Softwares','Programs');
const cMainEN18 : array [0..2] of string = ('Data Groups','Data Element','Business Objects');
const cMainEN19 : array [0..0] of string = ('Sites');
const cMainEN3 : array [0..5] of string = ('DB Compression','Diagrams Checking','Objects Configuration','Diagrams Integration','Dimensions Exporting','Languages');
const cMainEN35 : array [0..1] of string = ('Português','English');
const cMainEN4 : array [0..20] of string = ('Activities',
         'Issues',
         'Improvements',
         'Business Rules',
         'Actors',
         'People',
         'Business Events' ,
         'Data Groups',
         'Sites',
         'Foreign Entities',
         'Actor x Activities',
         '-',
         'Interface Objects',
         'Control Objects',
         'Business Objects',
         'Activities x Interface Objects' ,
         '/Data Elements',
         'Data Cross Reference' ,
         'Programs',
         'Actor x People',
         'Activities x Technology');
 cMainEN5 : array [0..3] of string = ('Help','About','-','Current Configuration');




implementation

function fMainMenu (Menu : TMainMenu) : TMainMenu;
var
i,j,k : integer;
 Begin
   
   for i := 0 to menu.Items.Count -1 do
     Begin
     MENU.Items[i].Caption := cMainEN[i]; 
     case i of
       0 :  Begin
             for j := 0 to menu.Items[i].Count-1 do
               Begin
                 menu.Items[i].Items[j].Caption := cMainEN0[j];
               end;

            end;
       1 :  Begin
             for j := 0 to menu.Items[i].Count-1 do
               Begin
                 menu.Items[i].Items[j].Caption := cMainEN1[j];
                 case j of
                   5 :  Begin
                          for k := 0 to menu.Items[i].items[j].Count-1 do
                           Begin
                             menu.Items[i].Items[j].items[k].Caption := cMainEN15[k];
                           end;
                        end;
                   7 :  Begin
                          for k := 0 to menu.Items[i].items[j].Count-1 do
                           Begin
                             menu.Items[i].Items[j].items[k].Caption := cMainEN17[k];
                           end;
                        end;
                   8 :  Begin
                          for k := 0 to menu.Items[i].items[j].Count-1 do
                           Begin
                             menu.Items[i].Items[j].items[k].Caption := cMainEN18[k];
                           end;
                        end;
                   9 :  Begin
                          for k := 0 to menu.Items[i].items[j].Count-1 do
                           Begin
                             menu.Items[i].Items[j].items[k].Caption := cMainEN19[k];
                           end;
                        end;
                   end;
               end;
            end;

          3 :  Begin
                 for j := 0 to menu.Items[i].Count-1 do
                   Begin
                     menu.Items[i].Items[j].Caption := cMainEN3[j];

                   end;
               end;
           4 :  Begin
                 for j := 0 to menu.Items[i].Count-1 do
                   Begin
                     menu.Items[i].Items[j].Caption := cMainEN4[j];

                   end;
                 end;
            5 :  Begin
                 for j := 0 to menu.Items[i].Count-1 do
                   Begin
                     menu.Items[i].Items[j].Caption := cMainEN5[j];

                   end;
                 end;

      end;
     end;
  result := menu;
 end;


end.
