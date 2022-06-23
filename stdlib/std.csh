abstract record fallible<returnType>;

final record success<returnType> extends fallible<returnType> {
	readonly returnType result;
}

record error<returnType> extends fallible<returnType> {
	readonly array<char> msg;
}

final record invalidOperation<T> extends error<T> {
	msg = "Attempted to perform an invalid operation";
}

final record pair<firstT, secondT> {
	readonly firstT first;
	readonly secondT second;
}

final record triple<firstT, secondT, thirdT> {
	readonly firstT first;
	readonly secondT second;
	readonly thirdT third;
}

global readonly float nan = 0f/0f;

global readonly auto forall = proc<T>(array<T> a, proc<nothing, T> todo) {
	for(int i = 0; i < #a; i++)
		todo(a[i]);
	return;
};

global readonly auto forallIndicies = proc<T>(array<T> a, proc<nothing, array<T>, int> todo) {
	for(int i = 0; i < #a; i++)
		todo(a, i);
	return;
};

$converts an int to float
global readonly auto itof = proc(int i) return float {
	return foreign[0](i);
};

$converts an int to string
global readonly auto itos = proc(int n) return array<char> {
	return foreign[6](n);
};

$converts a string to an int
global readonly auto stoi = proc(array<char> buffer) return int {
	return foreign[7](buffer);	
};

$converts a float to a string
global readonly auto ftos = proc(float n) return array<char> {
	return foreign[4](n);	
};

$converts a string to a float
global readonly auto stof = proc(array<char> buffer) return float {
	return foreign[5](buffer);
};

$converts a char to an int 
proc ctoi(char c) return int
	return foreign[15](c);

$converts an int to a char
proc itoc(int i) return char
	return foreign[14](i);