%COURSE-AI-ASSIGNMENT
:- consult('Kbase01.pl').
:- dynamic ecriteria/4.
:- dynamic aprocess/3.
:- dynamic adstatus/6.
:- dynamic user/2.

readString(String) :-
    current_input(Input),
    read_line_to_codes(Input, Codes),
    string_codes(String, Codes).

isUser(ID,Name) :-
	user(ID,Name).
isUser(ID,Name) :-
	\+user(ID, Name),
	write('I did not get your name, kindly specify What should I address you? '),
	read(Name),
	asserta(user(ID,Name)),
	!.

getNextID(ID, ID) :-
	\+user(ID,_).
getNextID(Curr, ID) :-
	user(Curr,_),
	Next is Curr+1,
	getNextID(Next, ID),
	!.

isPaid(Ref):-
    write('checking for '),write(Ref),write('.....\n'),
	adstatus(_,Ref,_,_,1,_),
	write("The fees is already paid, confirming seat..."),nl,
	Cnf is 1,
	assert(adstatus(_,Ref,_,_,_,Cnf)),
	nl,nl.
isPaid(Ref):-
	\+adstatus(_,Ref,_,_,1,_),
	write('The fees is not paid.Kindly pay to enable seat confirmation\n'),
	nl,!.

isConfirmed(Ref):-
    write('Checking for confirmation for '),write(Ref),write('.....\n'),
	adstatus(_,Ref,_,_,1,1),
	write("The fees has been paid and seat is confirmed"),nl.
isConfirmed(Ref):-
	\+adstatus(_,Ref,_,_,1,1),
	write('The seat is not confirmed yet. Kindly check your payment status and contact administrator\n'),
	!.

printlist([]).
printlist([H|T]) :-
    write(H),nl,write('\t'),
    printlist(T).

eligibilityCriteria(ID) :-
   write('Elgibility Criteria - B.E. degree.....'),nl,
   user(ID,Name),
   write('Kindly input CGPA [12th/PUC] Board Exam?'),nl,
   read(Cgpa),
   C is round(Cgpa),
   isEligible(C,Branches),
   write(Name),write(', '),
   printlist(Branches),
   assert(ecriteria(ID,Name,Cgpa,Branches)),nl,nl,nl,
   greetingMsg(ID).

appChoice(ID,1,NameAp):-
	lastDate(Date),
	write('The last day for submitting application is :'),
	write(Date),nl,
	assert(aprocess(ID,NameAp,'Deadline')),
	processApplication(ID).

appChoice(ID,2,NameAp) :-
    examDate(Date),
	write('The exam will be held on :'),
	write(Date),nl,
	assert(aprocess(ID,NameAp,'Exam date')),
	processApplication(ID).

appChoice(ID,3,NameAp) :-
    examCenters(Centers),
	write('The exam centers are : \n\t'),
	printlist(Centers),nl,nl,nl,nl,
	assert(aprocess(ID,NameAp,'Exam centers')),
	processApplication(ID).

appChoice(ID,4,NameAp) :-
    instruction(Inst),
	write('Kindly adhere to below instructions :\n\t'),
	printlist(Inst),nl,nl,nl,nl,
	assert(aprocess(ID,NameAp,'Special instructions')),
	processApplication(ID).

appChoice(ID,5,NameAp) :-
    syllabus(Syb),
	write('Kindly find the exam syllabus : \n\t'),printlist(Syb),nl,nl,nl,nl,
	assert(aprocess(ID,NameAp,'Syllabus')),
	processApplication(ID).

appChoice(ID,6,NameAp) :-
    scholarship(Schp),
	write('The exam centers are : \n\t'),
	printlist(Schp),nl,nl,nl,nl,
	assert(aprocess(ID,NameAp,'Scholarship')),
	processApplication(ID).

appChoice(ID,7,NameAp) :-
    write('GoodBye, '),write(NameAp),nl,nl,
	greetingMsg(ID).

appChoice(ID,Y,NameAp) :-
	write('Invalid choice '),write(NameAp),
	write(' '),write(Y),nl,
	processApplication(ID),!.

processApplication(ID) :-
    write("Application process --Kindly choose among below categories for guidance?"),nl,
	write('1. Deadline'),nl,
	write('2. Exam date'),nl,
	write('3. Exam centers'),nl,
	write('4. Special instructions'),nl,
	write('5. Syllabus'),nl,
	write('6. Scholarship'),nl,
	write('7. Quit'),nl,
	write('Enter 1/2/3/4/5/6/7 :  '),
	write(' > '),
        read(Y),
	user(ID,NameAp),
	appChoice(ID,Y,NameAp),
	write('\n').

admissionStatus(ID) :- write("Let Me Find The Admission Status"),nl,
    write('Enter your hallticket number'),
	read(Ht),
	student(Ht,Score),
	write("The score is: "),write(Score),nl,
	write("The basic required score for various branches are:\n\t"),
	write("Computer Science : "),basicScore(cs,R1),write(R1),nl,
	write("\tElectronics and Telecommunication : "),basicScore(et,R2),write(R2),nl,
	write("\tElectrical and Electronics : "),basicScore(ee,R3),write(R3),nl,
	write("\tMechanical : "),basicScore(mech,R4),write(R4),nl,
	write("\tCivil : "),basicScore(civil,R5),write(R5),nl,
	Scr is round(Score/10),nl,
	write("Seat allotted in : "),
	allotted(Scr,Seat),
	printlist(Seat),
	write(" Engineering"),nl,
	write("Congratulations "),
	user(ID,Name),write(Name),
	assert(adstatus(ID,Ht,Score,Seat,_,_)),
	nl,nl,nl,nl,
	greetingMsg(ID).

processAdmission(ID,1,Ref) :-
    write('The Fee structure \n\t'),
	fee(Fee),
	printlist(Fee),
	user(ID,Name),write(Name),
	write(', Reference '),write(Ref),
	write(' please pay earliest.'),nl,nl,
	admission(ID).

processAdmission(ID,2,Ref) :-
    write('The payment'),nl,
	payment(Pay),
	printlist(Pay),nl,
	write('Enter 1 to confirm payment is done'),
	read(Val),
	verifypaid(Val,Paid),
	assert(adstatus(ID,Ref,_,_,Paid,_)),
	nl,nl,nl,
	admission(ID).

processAdmission(ID,3,Ref) :-
    write('The status '),nl,
	isPaid(Ref),nl,
	admission(ID).

processAdmission(ID,4,Ref) :-
    write('Confirming......'),nl,
	isConfirmed(Ref),nl,
	admission(ID).

processAdmission(ID,5,Ref) :-
    write('GoodBye'),write(Ref),write(' from admission menu'),nl,nl,nl,nl,
	greetingMsg(ID).

processAdmission(ID,Z,Ref) :-
	write('Invalid choice '),write(Ref),
	write(' '),write(Z),nl,
	admission(ID),!.

admission(ID) :- write("Admission Process"),nl,
    write('Enter your hallticket number'),
	read(Ref),
	write('1. Fee Structure'),nl,
	write('2. Payment details'),nl,
	write('3. Payment Status'),nl,
	write('4. Confirmation'),nl,
	write('5. Quit'),nl,
	write('Enter 1/2/3/4/5 :  '),
	write(' > '),
    read(Z),
	processAdmission(ID,Z,Ref),
	write('\n').

userChoice(ID,1) :-
	eligibilityCriteria(ID), !.

userChoice(ID,2) :-
	processApplication(ID),!.

userChoice(ID,3) :-
	admissionStatus(ID),!.

userChoice(ID,4) :-
	admission(ID),!.

userChoice(ID,5) :-
    write('You are exiting the course counselor chatbot support. Bye '),
	user(ID,Name),write(Name),
	undo.

userChoice(ID,M_op) :-
	write('Invalid choice '),write(M_op),nl,
	greetingMsg(ID),!.

greetingMsg(ID) :-
    write('User Menu'), nl,
	write('Select among the following options'), nl,
	write('1. Eligibility criteria'),nl,
	write('2. Application process'),nl,
	write('3. Application status'),nl,
	write('4. Admission'),nl,
	write('5. Quit'),nl,
	write('Enter 1/2/3/4/5 :  '),
	write(' > '),
    read(M_op),
    userChoice(ID,M_op).

greetingMsg() :-
    write('Hi! I am the course counselor chatbot designed to guide users through university admission process'), nl,
	getNextID(0, ID),
	write('Enter your name :'),
	readString(Name),
	asserta(user(ID,Name)),
	write('User Menu'), nl,
	write('Select among the following options'), nl,
	write('1. Eligibility criteria'),nl,
	write('2. Application process'),nl,
	write('3. Application status'),nl,
	write('4. Admission'),nl,
	write('5. Quit'),nl,
	write('Enter 1/2/3/4/5 :  '),
	write(' > '),
    read(M_op),
    userChoice(ID,M_op),
	write('\n').

main() :-
    greetingMsg().

go() :-
    main, !.

undo:- retract(user(_,_)),fail.
undo:- retract(ecriteria(_,_,_,_)),fail.
undo:- retract(aprocess(_,_,_)),fail.
undo:- retract(adstatus(_,_,_,_,_,_)),fail.
undo.

























