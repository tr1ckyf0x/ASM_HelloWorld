prepareDir:
	mkdir -p build

link: HelloWorld.o
	ld -o build/HelloWorld build/HelloWorld.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64 

asm: HelloWorld.s
	as -o build/HelloWorld.o HelloWorld.s

build: prepareDir asm link

clean:
	rm -rf build

cleanbuild: clean build

run:
	./build/HelloWorld

all: cleanbuild run