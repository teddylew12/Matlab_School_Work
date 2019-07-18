function []  = printcard(card,handnum)
%printcard Prints the suit and value of the card and where it is in your
%hand
%   Needs one card array and will output suit of value
answer=isfield(card,["Suit","Value","Score"]);
for i= 1:length(answer)
    if answer(i)==0
        error("Not an card array")
    end
end
if ~(length(card)==1)
    error("Incorrect amount of cards")
end 

fprintf("%d: %s of %s \n",handnum, card.Value,card.Suit);
end

