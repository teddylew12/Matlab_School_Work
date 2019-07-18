function [rank] = calchand(handocards)
%CalcHand Calculates the rank of the 5 card hand
%{  Detailed explanation goes here
%1. Pair (must be Jacks or higher)
%2. Two pairs (can be any value)
%3. Three of a kind (can be any value)
%4. Straight (the values are all sequential)
%5. Flush (the suits are all the same, but the values are not sequential)
%6. Full House (a pair and three of a kind)
%7. Four of a kind (can be any value)
%8. Straight Flush (straight and a flush at the same time)
%9. Royal Flush (straight and a flush starting with 10 and ending with Ace)
%10. Five of a kind (only happens when playing with multiple decks)
%}
answer=isfield(handocards,["Suit","Value","Score"]);
for i= 1:length(answer)
    if answer(i)==0
        error("Not an card array")
    end
end
if ~(length(handocards)==5)
    error("Incorrect amount of cards")
end
rank=0;
[matchone,scoreindex,matchtwo,scoreindextwo]=pairorbetter(handocards);


if matchone==2 && matchtwo==0 &&scoreindex>11
    rank=1;
    return 
elseif matchone==2 && matchtwo==2 
    rank=2;
    return
elseif matchone==3 && matchtwo==0
    rank=3;
    return
elseif matchone==4 && matchtwo==0
    rank=7;
    return
elseif matchone==5 && matchtwo==0
    rank=10;
    return
elseif isastraight(handocards)
    rank=4;
    return
elseif isfullhouse(handocards)
    rank=6;
    return
elseif isaflush(handocards)
    rank=5;
    return
elseif isstrflush(handocards)
    rank=8;
    return
elseif isroyalflush(handocards)
    rank=9;
end
end
%Local functions
function [nummatches1,matchingindex1,nummatches2,matchingindex2] =pairorbetter(cards)
%pairorbetter Checks for 5,4,3 or 2 of a kind
    %Returns the number of matching cards in a hand
matchingindex1=0;
nummatches1=0;
matchingindex2=0;
nummatches2=0;
scorearray=zeros(1,5);

for i=1:5
    scorearray(i)=cards(i).Score;
end
i=1;
while ~isempty(scorearray)
    if nummatches1==0
        tocheck=scorearray(1);
        paircheck=scorearray==tocheck;
        if sum(paircheck)>=2
            matchingindex1=tocheck;
            nummatches1=sum(paircheck);
        end
    
    else
        tocheck=scorearray(1);
        paircheck=scorearray==tocheck;
        if sum(paircheck)>=2
            matchingindex2=tocheck;
            nummatches2=sum(paircheck);
        end
    end
    scorearray=scorearray(~paircheck);
    i=i+1;
end
end

function [flush]=isaflush(cards)
suitarray=strings(1,5);
for i=1:5
    suitarray(i)=cards(i).Suit;
end   
if sum(suitarray==suitarray(1)==5)
   flush= true;
else
   flush=false;
end
end
function [straight]=isastraight(cards)
scorearray=zeros(1,5);
for i=1:5
    scorearray(i)=cards(i).Score;
end   
scorearray=sort(scorearray);
target=ones(1,4);
if isequal(diff(scorearray),target)
    straight=true;
else
   straight=false;
end
end
function [fullhouse]=isfullhouse(cards)
[~,a,~,b]=pairorbetter(cards);
if a+b==5 && a~=5  
   fullhouse= true;
else
   fullhouse=false;
end
end
function [strflush]=isstrflush(cards)
if isastraight(cards)&& isflush(cards)&& cards(1).Score~=10 
   strflush= true;
else
   strflush=false;
end
end
function [royalflush]=isroyalflush(cards)
if isastraight(cards)&& isflush(cards)&& cards(1).Score==10 
   royalflush= true;
else
   royalflush=false;
end
end

