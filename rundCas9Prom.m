function [PromDNA]= rundCas9Prom(PromLength,NMatchesProm,MinGCProm,MaxGCProm,CatguideRNA);

numofguides=size(CatguideRNA);
numofguides=numofguides(1,1);
b=1;

catTS=[];
while b<=2
gc=0;
a=2;
new=[];
new(1,1)=1;
while a<=PromLength
    
    new1=1+floor(4*rand());
    if (new1==2 && new(1,a-1)==new1) || (new1==4 && new(1,a-1)==new1) %eliminate GG and CC
        continue
     
    elseif a>4 && new1==new(1,a-1) && new1==new(1,a-2) && new1==new(1,a-3) %eleiminate 4 consecutive identical bases
        continue
    
    else
        new=cat(2,new,new1);
        a=a+1;
    
    end
    
    
    
end
numofc=sum(new(:)==2);
numofg=sum(new(:)==4);
% buenosstring=num2str(new);
% buenosstring(buenosstring==' ')='';

elementos=numel(new);
if (numofc+numofg)>=elementos*MinGCProm && (numofc+numofg)<=elementos*MaxGCProm%&& TSsum==0
    gc=1;
    
end
if gc==1
    
    guide1=new; 
    guide1=num2str(guide1);
    guide1(guide1==' ')='';
    
for ng=1:numofguides

 buenosstring=CatguideRNA(ng,:);
 buenosstring(buenosstring=='A')='1';buenosstring(buenosstring=='C')='2';buenosstring(buenosstring=='T')='3';buenosstring(buenosstring=='G')='4';
for n=1:20-NMatchesProm+1%remove sequences with similairty to the guide RNAs
     newStr=buenosstring(1,n:n+NMatchesProm-1);
     newStr=num2str(newStr); newStr(newStr==' ')='';
     TS=~isempty(strfind(guide1,newStr));
     catTS=cat(2,catTS,TS);  
     newStr(newStr=='1')='a';newStr(newStr=='2')='c';newStr(newStr=='3')='t';newStr(newStr=='4')='g';
     newStr(newStr=='a')='3';newStr(newStr=='c')='4';newStr(newStr=='t')='1';newStr(newStr=='g')='2';
     newStr=fliplr(newStr);
     TS=~isempty(strfind(guide1,newStr));
     catTS=cat(2,catTS,TS);    
end
end
 TSsum=sum(catTS);
if TSsum==0
    b=3;

end
catTS=[];
end
end
new=num2str(new);
new(new=='1')='A';
new(new=='2')='C';
new(new=='3')='T';
new(new=='4')='G';
new(new==' ')='';

PromDNA=new;

end
