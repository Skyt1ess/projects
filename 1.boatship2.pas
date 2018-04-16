uses graphabc;

var a,b:array[-3..14,-3..14] of char;
c,d:array[-3..14,-3..14] of char;
xt:array[0..11,0..11] of boolean;
x1,x2,y1,y2,m1,n1,m2,n2:array[1..10] of longint;
i,j,k,kil,x,y,shot,ter,l,s1,s2,s3,s4,w1,w2,w3,w4,kilbot,z1,z2,step,bx1,bx2,by1,by2,ran,f,r,lol,shotbot,shipbt,ror:longint;
s,ss:string;

procedure stop(x,y,m:longint);//останавливает игру
begin
end;

procedure checkKill(ter:longint);//процедура, проверяющая уничтожено ли судно и окончена ли игра
var i,j,l,q,w:longint;
begin

for l:=1 to ter do
if x1[l]<>0 then
begin
q:=0;
for i:=x1[l] to x2[l] do
for j:=y1[l] to y2[l] do
if a[i,j]=b[i,j] then inc(q);
if q=x2[l]-x1[l]+y2[l]-y1[l]+1 then
  begin
  for i:=x1[l]-1 to x2[l]+1 do
  for j:=y1[l]-1 to y2[l]+1 do
    a[i,j]:='.';
  for i:=x1[l] to x2[l] do
  for j:=y1[l] to y2[l] do
    a[i,j]:='k';
  x1[l]:=0;
  dec(kil);
  case q of
    1: dec(s1);
    2: dec(s2);
    3: dec(s3);
    4: dec(s4);
  end
end;
end;


for l:=1 to ter do
if m1[l]<>0 then
begin
q:=0;
for i:=m1[l] to m2[l] do
for j:=n1[l] to n2[l] do
if c[i,j]=d[i,j] then inc(q);
if q=m2[l]-m1[l]+n2[l]-n1[l]+1 then
  begin
  for i:=m1[l]-1 to m2[l]+1 do
  for j:=n1[l]-1 to n2[l]+1 do
    c[i,j]:='.';
  for i:=m1[l] to m2[l] do
  for j:=n1[l] to n2[l] do
    c[i,j]:='k';
  m1[l]:=0;
  dec(kilbot);
  case q of
    1: dec(w1);
    2: dec(w2);
    3: dec(w3);
    4: dec(w4);
  end
end;
end;
end;



procedure writeArr(k:longint); //процедура вывода массива
var i,j,l,r:longint;
s:string;
begin
setfontstyle(fsbold);
setfontsize(12);
setfontcolor(clblack);
rectangle(10,10,40,40);
textout(25,10,'X');
textout(10,25,'Y');
line(10,10,40,40);
if step=1 then textout((k)*40,(k+3)*40,'Ваш ход');
rectangle(10+(k+2)*40,10,(k+3)*40,40);
textout(25+(k+2)*40,10,'X');
textout(10+(k+2)*40,25,'Y');
line(10+(k+2)*40,10,(k+3)*40,40);

 setfontstyle(fsbold);
setfontsize(18);
SETFONTcolor(clblue);

  
  line(0,(k+1)*40,1000,(k+1)*40);
  SETFONTcolor(clred);
  textout(10,(k+1)*40+5,'Поле противника');
  textout((k+3)*40,(k+1)*40+5,'Ваше поле');
  rectangle(0,(k+2)*40,(10*k)*40,(k+15)*40);
  line(0,(k+2)*40,1000,(k+2)*40);
setwindowheight(700);
setwindowwidth(1000);
setfontstyle(fsbold);
SETFONTcolor(clblue);
setfontsize(14);
R:=-15;
  textout((k+2)*40-20,40+r,'М');
  textout((k+2)*40-20,60+r,'О');
  textout((k+2)*40-20,80+r,'Р');
  textout((k+2)*40-20,100+r,'С');
  textout((k+2)*40-20,120+r,'К');
  textout((k+2)*40-20,140+r,'О');
  textout((k+2)*40-20,160+r,'Й');
  textout((k+2)*40-20,190+r,'Б');
  textout((k+2)*40-20,210+r,'О');
  textout((k+2)*40-20,230+r,'Й');
setfontcolor(clblack);
if ror=0 then

for i:=1 to k do
for j:=1 to k do
begin
rectangle(i*40,j*40,(i+1)*40,(j+1)*40);


if a[i,j]='.' then floodfill(i*40+20,j*40+20,rgb(178,178,178));
if a[i,j]='x' then
  begin
  setpenwidth(4);
  floodfill(i*40+10,j*40+20,rgb(178,178,178));
  line(i*40,j*40,(i+1)*40,(j+1)*40);
  line((i+1)*40,j*40,i*40,(j+1)*40);
  setpenwidth(1);
  end;
if a[i,j]='k' then
  begin
  setpencolor(clred);
setpenwidth(4);
  line(i*40,j*40,(i+1)*40,(j+1)*40);
  line((i+1)*40,j*40,i*40,(j+1)*40);
   setpencolor(clblack);
 setpenwidth(1); 
  end;
  if (kilbot=0)  then
  begin
  ror:=1;
  if a[i,j]='x' then
    begin
      setpencolor(clred);
setpenwidth(4);
  line(i*40,j*40,(i+1)*40,(j+1)*40);
  line((i+1)*40,j*40,i*40,(j+1)*40);
   setpencolor(clblack);
 setpenwidth(1); 
 end else
 begin
  if (a[i,j]='*') and (b[i,j]='x') then a[i,j]:=b[i,j];
if a[i,j]='.' then floodfill(i*40+20,j*40+20,rgb(178,178,178));
if a[i,j]='x' then
  begin
  setpenwidth(4);
  floodfill(i*40+10,j*40+20,rgb(178,178,178));
  line(i*40,j*40,(i+1)*40,(j+1)*40);
  line((i+1)*40,j*40,i*40,(j+1)*40);
  setpenwidth(1);
  end;
  end;
  end;
end;

for i:=k+3 to 2*k+2 do
for j:=1 to k do
begin
setpencolor(clblack);
rectangle(i*40,j*40,(i+1)*40,(j+1)*40);
if c[i-k-2,j]='.' then floodfill(i*40+20,j*40+20,rgb(178,178,178));
if d[i-k-2,j]='x' then
  begin
  setpenwidth(4);
  
  line(i*40,j*40,(i+1)*40,(j+1)*40);
  line((i+1)*40,j*40,i*40,(j+1)*40);
  setpenwidth(1);
  end;
  
  if c[i-k-2,j]='x' then
  begin
  setpenwidth(4);
  setpencolor(clred);
  
  line(i*40,j*40,(i+1)*40,(j+1)*40);
  line((i+1)*40,j*40,i*40,(j+1)*40);
  setpenwidth(1);
  end;
if c[i-k-2,j]='k' then
  begin
 
setpenwidth(4);
  setpencolor(clred);
  line(i*40,j*40,(i+1)*40,(j+1)*40);
  line((i+1)*40,j*40,i*40,(j+1)*40);
  setpencolor(clblack);
 setpenwidth(1); 
  end;
end;

setfontstyle(fsbold);
setfontsize(16);
for i:=1 to k do
begin
str(i,s);
textout(10+(k+2)*40,i*40+10,s);
textout((k+2+i)*40+10,10,s);
end;


for i:=1 to k do
begin
str(i,s);
textout(10,i*40+10,s);
textout(i*40+10,10,s);
end;
  
setfontstyle(fsnormal);
setfontsize(12);
r:=150;
if (kil*kilbot<>0) then
begin
if step=0 then
begin
 textout((k+4)*40,40*(k+1)+r,'Расставьте '+chr(w4+48)+' 4-палубный корабль') ;
  textout((k+4)*40,40*(k+1)+r+20,'Расставьте '+chr(w3+48)+  ' 3-палубных корабль');
  textout((k+4)*40,40*(k+2)+r,'Расставьте '+chr(w2+48)+' 2-палубных кораблей');
 textout((k+4)*40,40*(k+2)+r+20,'Расставьте '+chr(w1+48)+' 1-палубных кораблей'); 
end else
begin
  if s4>0 then textout(10,40*(k+1)+r,'Остался уничтожить 1 4-палубный корабль');
  if s3>0 then textout(10,40*(k+1)+r+20,'Остался уничтожить '+chr(s3+48)+ ' 3-палубных корабль');
  if s2>0 then textout(10,40*(k+2)+r,'Осталось уничтожить '+chr(s2+48)+' 2-палубных кораблей');
  if s1>0 then textout(10,40*(k+2)+r+20,'Осталось уничтожить '+chr(s1+48)+' 1-палубных кораблей');
 
 if w4>0 then textout((k+4)*40,40*(k+1)+r,'У вас остался 1 4-палубный корабль');
  if w3>0 then textout((k+4)*40,40*(k+1)+r+20,'У вас осталось '+chr(w3+48)+  ' 3-палубных корабль');
  if w2>0 then textout((k+4)*40,40*(k+2)+r,'У вас осталось '+chr(w2+48)+' 2-палубных кораблей');
  if w1>0 then textout((k+4)*40,40*(k+2)+r+20,'У вас осталось '+chr(w1+48)+' 1-палубных кораблей'); 
  end;
  
 end; 
  setfontstyle(fsbold);
setfontsize(18);
SETFONTcolor(clblue);
if step=1 then textout((k)*40,(k+3)*40,'Ваш ход') else if step=2 then textout((k)*40,(k+3)*40,'Ход противника')
end;

procedure mouseMove(x,y,m:longint);//НАШ ХОД
begin
  
 
if (m=1)and (step=1) then
begin

setfontstyle(fsbold);
setfontsize(16);
inc(shot);
x:=(x)div 40;
y:=(y) div 40;



  if (x<1) or (x>k) or (y<1) or (y>k) then 
    begin
    
    
 
    textout((k)*40,(k+3)*40,'Введите правильную координату');
    dec(shot);
  end else
  if a[x,y]='*' then  //проверяем, стреляли ли мы в эту точку раньше
  begin
    a[x,y]:=b[x,y];
    
    checkKill(ter);
   
    setfontstyle(fsbold);
setfontsize(18);
if kil*kilbot <>0 then
begin
    if a[x,y]='.' then textout((k)*40,(k+4)*40,'Промах    ');
    if a[x,y]='x' then textout((k)*40,(k+4)*40,'Попал   ');
    if a[x,y]='k' then textout((k)*40,(k+4)*40,'Уничтожил');
    sleep(600);
   writeArr(k);
    
    if a[x,y]='.' then begin step:=2;textout((k)*40,(k+3)*40,'Ход противника');end;
    
    end
  end else
  begin
  
    checkKill(ter);
   
    dec(shot);
 
    textout((k)*40,(k+3)*40,'Вы уже стреляли в эту точку')
  end;
 
exit;
end;

end;
function free(m,n:longint):boolean;//функция проверяющая, можно ли поставить 1-палубный корабль
var x,y:longint;
begin
free:=true;
for x:=m-1 to m+1 do
for y:=n-1 to n+1 do
if (b[x,y]='x') then free:=false;
end;

function freebt(m,n:longint):boolean;//функция проверяющая, можно ли поставить 1-палубный корабль
var x,y:longint;
begin
freebt:=true;
for x:=m-1 to m+1 do
for y:=n-1 to n+1 do
if (d[x,y]='x') then freebt:=false;
end;

procedure ship(k,f,d:longint);//на поле k*k создаем d f-палубных кораблей
var z,y,x,r,i,j:longint;
begin
while d>0 do
    begin
    x:=random(1,k); //рандомно определяем координаты
    y:=random(1,k);
    z:=random(0,3);  //определяем расположение корабля ← ↑ → ↓
    R:=0;
    case z of  //проверка на вместимость
    0:  for i:=x to x+f-1 do if (free(i,y)) and (i>0) and (i<k+1) then inc(R);  // ↓
    1:  for i:=x downto x-f+1 do if free(i,y) and (i>0) and (i<k+1) then inc(R); //  ↑ 
    2:  for j:=y to y+f-1 do if free(x,j) and (j>0) and (j<k+1) then inc(R); // → 
    3:  for j:=y downto y-f+1 do if free(x,j) and (j>0) and (j<k+1) then inc(R); // ← 
    end; 
    if (r=1) and ((i=1) and (j=k) or (i=k) and (j=i)) then else
      if R=f then //заполнение таблицы
      begin
       case z of
       0: begin
          for i:=x-1 to x+f do
          for j:=y-1 to y+1 do
          b[i,j]:='.';
          for i:=x to x+f-1 do b[i,y]:='x';
          inc(shipbt);x1[shipbt]:=x;x2[shipbt]:=x+f-1;y1[shipbt]:=y;y2[shipbt]:=y;
          end;
       1: begin
          for i:=x+1 downto x-f do
          for j:=y-1 to y+1 do
          b[i,j]:='.';
          for i:=x downto x-f+1 do b[i,y]:='x';
          inc(shipbt);x2[shipbt]:=x;x1[shipbt]:=x-f+1;y1[shipbt]:=y;y2[shipbt]:=y;
          end;
          
       2: begin
          for i:=x-1 to x+1 do
          for j:=y-1 to y+f do
          b[i,j]:='.';
          for j:=y to y+f-1 do b[x,j]:='x';
          inc(shipbt);x1[shipbt]:=x;x2[shipbt]:=x;y1[shipbt]:=y;y2[shipbt]:=y+f-1;
          end;
          
       3: begin
           for i:=x-1 to x+1 do
          for j:=y+1 downto y-f do
          b[i,j]:='.';
           for j:=y downto y-f+1 do b[x,j]:='x';
           inc(shipbt);x1[shipbt]:=x;x2[shipbt]:=x;y1[shipbt]:=y-f+1;y2[shipbt]:=y;
          end;
       end;
  
 
    dec(d);
    
    end;
end;
end;


//СОЗДАЮТСЯ КОРАБЛИ ПРОТИВНИКА
procedure create(k,s4,s3,s2,s1:longint);//процедура создает s4 4-палубных,s3 3-палубных, s2 2-палубных, s1 1-палубных кораблей
var i,j,x,y,z,R:longint;
begin
for i:=-3 to k+4 do
for j:=-3 to k+4 do
b[i,j]:='.';

ship(k,4,s4);
ship(k,3,s3);
ship(k,2,s2);
ship(k,1,s1);
  

end;


//СОЗДАЕМ НАШИ КОРАБЛИ
procedure mdown(x,y,m:longint);
var x1,y1,x2,y2,i,j,r:longint;

begin
writeArr(k);
if (m=1)  then
  begin
  x:=(x-(k+2)*40)div 40;
    y:=y div 40;
    inc(l);
    
  
  if l=1 then
    begin
    
    
    if (x in [1..k]) and (y in [1..k]) then
      begin
    z1:=x;z2:=y;
    end else begin l:=0;exit;end;
    end;
  if l=2 then
    begin
    x1:=z1;y1:=z2;
    if (x in [1..k]) and (y in [1..k]) then
      begin
    x2:=x;y2:=y;
    end else begin l:=0;exit;end;
    x:=min(x1,x2);x2:=max(x2,x1);x1:=x;
    y:=min(y1,y2);y2:=max(y1,y2);y1:=y;
    
    if (x1=x2) or (y1=y2) then
      case (abs(x1-x2)+abs(y1-y2)) of
      0: if (freebt(x1,y1)) and (w1<>0) then
                        begin
                        d[x1,y1]:='x';
                        inc(f);
                        m1[f]:=x1;n1[f]:=y1;
                        m2[f]:=x1;n2[f]:=y2;
                        dec(w1);inc(lol);
                        end;
     1: if (freebt(x1,y1)) and (freebt(x2,y2)) and (w2<>0) then
                        begin
                        d[x1,y1]:='x';
                        d[x2,y2]:='x';
                        inc(f);
                        m1[f]:=x1;n1[f]:=y1;
                        m2[f]:=x2;n2[f]:=y2;
                        dec(w2);inc(lol);
                        end;
     2: if w3<>0 then begin
        r:=0;
        for i:=x1 to x2 do
        for j:=y1 to y2 do
        if freebt(i,j) then inc(r);
        if r=3 then
          begin
          for i:=x1 to x2 do
        for j:=y1 to y2 do
        d[i,j]:='x';
        inc(f);
        m1[f]:=x1;n1[f]:=y1;
                        m2[f]:=x2;n2[f]:=y2;
                        dec(w3);inc(lol);
                        end;
                        
                        end;
    3:if w4=1 then begin
        r:=0;
        for i:=x1 to x2 do
        for j:=y1 to y2 do
        if freebt(i,j) then inc(r);
        if r=4 then
          begin
          for i:=x1 to x2 do
        for j:=y1 to y2 do
        d[i,j]:='x';
        inc(f);
        m1[f]:=x1;n1[f]:=y1;
                        m2[f]:=x2;n2[f]:=y2;
                        w4:=0;
                        inc(lol);
                        end;
                        
                        end;
                        
                       
end;
 writeArr(k);
l:=0;
end;
end;
end;



//ХОД ПРОТИВНИК
procedure stepbot(k:longint);
var i,j,x,y,r,f,l:longint;
begin
inc(shotbot);
c[0,0]:='1';
writeArr(k);
sleep(600);

x:=0;y:=0;
for i:=1 to k do
for j:=1 to k do
if c[i,j]='x' then
  
  if  (c[i-1,j]<>'x') and (c[i,j-1]<>'x') and (c[i+1,j]<>'x') and (c[i,j+1]<>'x') then
    while c[x,y]<>'*' do
    begin
    r:=random(4);
    case r of
    0: if (c[i-1,j]='*') and (i>1) then begin x:=i-1;y:=j;end;
    1: if (c[i+1,j]='*') and (i<k) then begin x:=i+1;y:=j;end;
    2: if (c[i,j-1]='*') and (j>1) then begin x:=i;y:=j-1;end;
    3: if (c[i,j+1]='*')and (j<k) then begin x:=i;y:=j+1;end;
    end;
    end else
    if (c[i-1,j]='x') or (c[i+1,j]='x') then
      begin
      f:=0;
      x:=i;y:=j;
      while f<>1 do
      begin
      l:=i;
      r:=random(2);
      case r of
      0:  begin 
          while c[i,j]='x' do 
          begin
            dec(l);
            if (c[l,j]='*')or(c[l,j]='.') then break;
            end;
          if (l>0) and (c[l,j]='*') then
            begin
            x:=l;y:=j;
            f:=1;
            end else l:=x;
            end;
      1:  begin 
          while c[i,j]='x' do 
            begin
            l+=1;
            if( c[l,j]='*')or(c[l,j]='.') then break;
            end;
          if (l<=k) and (c[l,j]='*') then
            begin
            x:=l;y:=j;
            f:=1;
            end else l:=x;
            end;
      end;
      end;
      end else
        if (c[i,j-1]='x') or (c[i,j+1]='x') then
      begin
      f:=0;
      l:=j;
      x:=i;y:=j;
      while f<>1 do
      begin
      r:=random(2);
      case r of
      0:  begin 
          while c[i,j]='x' do 
              begin
              dec(l);
              if(c[i,l]='*')or(c[i,l]='.') then break;
              end;
          if (l>0) and (c[i,l]='*') then
            begin
            x:=i;y:=l;
            f:=1;
            end else l:=y;
            end;
      1:  begin 
          while c[i,j]='x' do 
            begin
              inc(l);
              if (c[i,l]='*')or(c[i,l]='.')  then break;
              end;
          if (l<=k) and (c[i,l]='*') then
            begin
            x:=i;y:=l;
            f:=1;
            end else l:=y;
            end;
      end;
      end;
      end;
if x=0 then
while c[x,y]<>'*' do
begin
x:=random(1,k);
y:=random(1,k);
end;

c[x,y]:=d[x,y];
checkKill(ter);


if kil*kilbot<>0 then
begin




 setfontstyle(fsbold);
setfontsize(18);   
if c[x,y]='.' then
  begin
  step:=1;
 
  textout((k)*40,(k+4)*40,'Противник промахнулся');
  end;

if c[x,y]='x' then textout((k)*40,(k+4)*40,'Противник попал');

 if c[x,y]='k' then textout((k)*40,(k+4)*40,'Ваш корабль уничтожен');
end;







sleep(600);
writeArr(k);
end;

//ОСНОВНАЯ ПРОГРАММА
begin
kilbot:=1;
textout(200,200,'Укажите размеры поля( 5-10 ) ');
readln(k);
clearwindow;
for i:=0 to k+1 do
for j:=0 to k+1 do
c[i,j]:='*';

for i:=0 to k+1 do
for j:=0 to k+1 do
d[i,j]:='.';

case k of //В зависимости от размеров поля создаем разное кол-во кораблей
  5: begin kil:=3;s1:=1;s2:=1;s3:=1;end;
  6: begin kil:=4;s1:=1;s2:=2;s3:=1;end;
  7: begin kil:=7;s1:=4;s2:=2;s3:=1;end;
  8: begin kil:=8;s1:=3;s2:=3;s3:=2;end;
  9: begin kil:=9;s1:=3;s2:=3;s3:=2;s4:=1;end;
  10: begin kil:=10;s1:=4;s2:=3;s3:=2;s4:=1;end;
end;
w1:=s1;w2:=s2;w3:=s3;w4:=s4;kilbot:=kil;
for i:=0 to k+1 do
for j:=0 to k+1 do
c[i,j]:='*';
create(k,s4,s3,s2,s1);

ter:=kil;

for i:=1 to k do
for j:=1 to k do
  a[i,j]:='*';
  writeArr(k);
  l:=0;
  f:=0;
while (w1<>0)or(w2<>0)or(w3<>0)or(w4<>0) do
begin
onmousedown:=mdown;  


  end;
w1:=s1;w2:=s2;w3:=s3;w4:=s4;
step:=1;
while (kil<>0) and (kilbot<>0) do
if step=1 then
OnMouseDown:=MouseMove else
stepbot(k);
  if (kil=0) or (kilbot=0) then OnMouseDown:=stop;


writeArr(k);
setfontstyle(fsbold);
setfontsize(18);
setfontcolor(clred);
if kil=0 then
begin
rectangle(0,(k+2)*40,(10*k)*40,(k+15)*40);
textout((k+2)*40,(k+3)*40,'Поздравляю!');
str(max(shotbot,shot),s);
textout((k+2)*40,(k+4)*40+20,'Вы выиграли за '+s+' ходов!');
end else
begin
rectangle(0,(k+2)*40,(10*k)*40,(k+15)*40);
textout((k+2)*40,(k+3)*40,'В следующий раз повезет!');
str(max(shot,shotbot),s);
textout((k+2)*40,(k+4)*40+20,'Вы проиграли за '+s+' ходов!');
end;
end.
