function shuffledArray= shuffledeck(deckarray)
%shuffledeck Shuffles the entire deck of cards
%   Shuffles by swapping two cards at random a large number of times
answer=isfield(deckarray,["Suit","Value","Score"]);
for i= 1:length(answer)
    if answer(i)==0
        error("Not an card array")
    end
end
if ~(length(deckarray)>=52)
    error("Not enough cards")
end    
for i=1:1000
    randints=randi([1,length(deckarray)],1,2);
    temp=deckarray(randints(1));
    deckarray(randints(1))=deckarray(randints(2));
    deckarray(randints(2))=temp;
end
shuffledArray=deckarray;
end

