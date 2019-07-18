%{
Theodore Lewitt
ITP 168 Spring 2019
Homework 7
lewitt@usc.edu
%}
clear;clc;
%%Initialization
cash=100;
allowed=false;
while ~allowed
    numdecks=input("How many decks do you want to use?");
    if mod(numdecks,1)==0
        if numdecks>0
            allowed=true;
            numdecks=int16(numdecks);
        else
            fprintf("Error,must be an positive integer")
        end
    else
        fprintf("Error, must use a integer")
    end
end
%Start round
playing=true;
while playing
%Create Decks
    fullDeck=initdeck(numdecks);
%shuffleDecks
    fullDeck=shuffledeck(fullDeck);
%Deal 5 cards and store in user's hand
    cardStruct=struct("Suit",[],"Value",[],"Score",[]);
    userHand=repmat(cardStruct,1,5);
    for i=1:5
        [card,deck]=dealcard(fullDeck);
        userHand(i)=card;
        fullDeck=deck;
    end
%ask for a bet
    allowed=false;
    while ~allowed
        bet=input("How much do you want to bet?");
        if mod(bet,1)==0
            if bet>0
                if bet<=cash
                    allowed=true;
                else
                    fprintf("You dont have enough money for this bet!\n")
                end
            else
                fprintf("Error,must be an positive integer\n")
            end
        else
            fprintf("Error, must use a integer\n")
        end
    end
    %Print the hand
    
    for i=1:5
        printcard(userHand(i),i)
    end
    %Calc hand rank
    handrank=calchand(userHand);
    %Print hand Rank
    fprintf("Here is your current rank: %d \n",handrank)
    %Ask user to choose which cards to swap
    x=zeros(1,5);
    cnt=0;
    cont=true;
    while cont
        num=input("Input a index of a card to switch, or 0 to quit: ");
        if cnt<=5    
            if mod(num,1)==0 && num>0 &&num<=5
                if sum(x==num)==0
                    cnt=cnt+1;
                    x(cnt)=num;
                else
                    fprintf("Can't type duplicate numbers!")
                end
            elseif num==0
                   cont=false;
            else
                fprintf("Oops, enter a valid index! \n")
            end
        else
            pfrintf("You can only switch 5 cards!\n")
        end
        
    end
    x=x(1:cnt);
    x=flip(sort(x));
    %Delete Swapped cards
    
    %Deal new Cards
    if cnt>0
        for i=1:length(x)
            userHand(x(i))=[];
        end    
        while length(userHand)<5 
            [newcard,deck]=dealcard(fullDeck);
            fullDeck=deck;
            userHand=[userHand newcard]; 
            disp(length(userHand))
        end
    end
    %Calc new hand rank
    newhandrank=calchand(userHand);
    fprintf("Here is your updated card rank: %d\n",handrank)
    %Display new Cards
    for i=1:5
        printcard(userHand(i),i)
    end
    %If rank>0, calc winning multiplier
    winnings=0;
    if newhandrank>0 
        switch newhandrank
            case 1
                winnings=1;
            case 2
                winnings=2;
            case 3
                winnings=3;
            case 4
                winnings=5;
            case 5
                winnings=7;
            case 6
                winnings=8;
            case 7
                winnings=10;
            case 8
                winnings=15;
            case 9
                winnings=20;
            case 10
                winnings=35;
        end
    end    
    %If rank>0, display rank and mult and calc winnings
    fprintf("Rank %d, winnings %d \n",newhandrank,bet*winnings)
    %Decrease cash by bet and add winnings
    cash=cash-bet+bet*winnings;
    %Ask to do it again?
  
    inp=upper(input("Want to keep playing?(Y or N)\n",'s'));
    if inp=='N'
        playing=false;
    else
        fprintf("Alright playing again!")
    end
    
    
end
%Repeat or exit and display cash
fprintf("Your final cash amount is %d \n",cash)