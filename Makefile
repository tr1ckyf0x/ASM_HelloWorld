prepareDir:
	mkdir -p build

assemble:
	as -o build/HelloWorld.o HelloWorld.s

link:
	ld -o build/HelloWorld build/HelloWorld.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

build: prepareDir assemble link

clean:
	rm -rf build

cleanbuild: clean build

run:
	./build/HelloWorld

all: cleanbuild run