function [topCard,restofDeck] = dealcard(deckarray)
%dealcard Deals the top card of the deck
%   Checks the deck is a real deck and deals the top card
answer=isfield(deckarray,["Suit","Value","Score"]);
for i= 1:length(answer)
    if answer(i)==0
        error("Not an card array")
    end
end

if ~(length(deckarray)>=52)
    error("Not enough cards")
end 

topCard=deckarray(1);
deckarray(1)=[];
restofDeck=deckarray;

end

