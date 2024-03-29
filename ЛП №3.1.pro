database
    language(symbol)
    know(symbol,symbol)

predicates
    nondeterm choice(integer)
    menu
    nondeterm repeat

clauses
	language(english).
	language(japanese).
	language(italian).
	language(german).
	language(french).

	choice('1'):-   
		write("What is your name?\n"),
		readln(Name),
		language(Lang),
		write("Do you know ",Lang,"?\n"),
		readln(Answer),
		Answer="yes",
		assert(know(Name,Lang)),
		fail.

	choice('2'):- 
		write("What is the new language?\n"),
		readln(Line),
		assert(language(Line)).

	choice('3'):-
		write("Polyglots:\n"),
		know(Name,Lang),
		write(Name," knows ",Lang),nl.

	choice('4'):-
		write("Languages:\n"),
		language(Lang),
		write(Lang),nl.

	choice('s'):-		
		write("Input file name of database\n"),
		save("C:\Users\danys\Desktop\database"),
		write("Information saved successfully\n").

	choice('l'):-		
		existfile("C:\Users\danys\Desktop\database"),!,
		consult("C:\Users\danys\Desktop\database"),
		write("Information loaded successfully\n");
		write("No such file or wrong path!!\n").
	choice('d'):-		
		retractall(_),
		write("Information deleted successfully\n").

	choice('0'):- !.
	
	menu :-
		repeat,		
		write("------------------------------------\n"),
		write("Make your choice:\n"),
		write("1 - add information about you\n"),
		write("2 - add language to database\n"),
		write("3 - show all people\n"),
		write("4 - show all known languages\n"),
		write("s - save database in file\n"),
		write("l - load database from file\n"),
		write("d - delete database\n"),
		write("0 - exit\n"),
		readchar(Choice),
		choice(Choice),
		Choice='0',
		!.

	repeat.
	repeat:- repeat.	
goal
    menu.
