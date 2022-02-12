derlecalistir: Program calistir

Program:InputProcessor Node DoublyLinkedList main
	g++ ./lib/InputProcessor.o ./lib/Node.o ./lib/DoublyLinkedList.o ./lib/main.o -o ./bin/program
InputProcessor:
	g++ -I "./include" -c ./src/InputProcessor.cpp -o ./lib/InputProcessor.o
Node:
	g++ -I "./include" -c ./src/Node.cpp -o ./lib/Node.o
DoublyLinkedList:
	g++ -I "./include" -c ./src/DoublyLinkedList.cpp -o ./lib/DoublyLinkedList.o
main:
	g++ -I "./include" -c ./src/main.cpp -o ./lib/main.o
calistir:
	./bin/program.exe