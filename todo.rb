## more optimized rewrite using arrays
$todoFilePath = '/Users/michaelsefranek/code/homework/todo.txt'


class MyFile
	def setFilePath(filePathStr)
		@theFilePath = filePathStr
	end

	def openFileToRead
		@todoFile = File.open(@theFilePath, 'r+') ## opens file (gives it a memory address)
		return(@todoFile)
	end

	def getFileLinesToArray
		@fileTodoArr= @todoFile.readlines  # takes the lines of a file and puts them into an array
	end
	def closeFile
		@todoFile.close		
	end

end

def putsQs(qstArr)   ## prints all the numbers and questions
	for i in 1..qstArr.length
		puts "#{i}\. #{qstArr[i-1]}"
	end
end

def writeQsToFile(qstArr) ## writes our question array to file
	newQstnsFile = File.new($todoFilePath, 'w') 
	qstArr.each {|qstnStr| newQstnsFile.write qstnStr}
	newQstnsFile.close
end


toDoFile = MyFile.new

toDoFile.setFilePath($todoFilePath)

toDoFile.openFileToRead.getFileLinesToArray.closeFile

getFileLinesToArray($todoFilePath)

myCliQstnArr = ARGV  ## this will ideally be ["add", "question"] or []

if myCliQstnArr[0] == "add"
	myCliQstnArr[1] = myCliQstnArr[1]+ "\n"
	fileTodoArr+= [myCliQstnArr[1]]  ## adds new question to key element, an array, in a hash key
	writeQsToFile(fileQstsArr)
	putsQs(fileQstsArr)

elsif myCliQstnArr[0] == "rm"
	fileQstsArr.slice!(myCliQstnArr[1].to_i - 1)
	writeQsToFile(fileQstsArr)
	putsQs(fileQstsArr)

else
	questionFile = File.open($todoFilePath, 'r+')
	fileTodoArr= questionFile.readlines
	puts "To Do List:"
	putsQs(fileQstsArr)
	questionFile.close
end
