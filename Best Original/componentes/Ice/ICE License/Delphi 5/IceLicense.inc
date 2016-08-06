{$IFDEF DIZZY4}
{$UNDEF DIZZY1}
{$UNDEF DIZZY2} 
{$UNDEF DIZZY3} 
{$UNDEF DIZZY4} 
{$ENDIF} 

{$IFDEF DIZZY3} 
  {$IFNDEF DIZZY4} 
   Asm 
   DB $EB,$06,$55,$44,$55,$03,$a8,$09;   
   end; 
  {$DEFINE DIZZY4} 
  {$ENDIF} 
{$ENDIF} 

{$IFDEF DIZZY2} 
{$IFNDEF DIZZY3} 
  {$IFNDEF DIZZY4} 
   Asm 
   DB $EB,$04,$75,$13,$a2,$14; 
   end; 
   {$DEFINE DIZZY3} 
  {$ENDIF} 
{$ENDIF} 
{$ENDIF} 

{$IFNDEF DIZZY1} 
{$IFNDEF DIZZY2} 
   {$IFNDEF DIZZY3} 
    {$IFNDEF DIZZY4} 
     Asm 
     DB $EB,$04,$55,$03,$a7,$44; 
     end; 
     {$DEFINE DIZZY2} 
    {$ENDIF} 
   {$ENDIF} 
{$ENDIF} 
{$ENDIF} 
;