## more optimized rewrite using arrays

$qFilePath = '/Users/michaelsefranek/code/homework/questions.txt'
fileQstsArr = qsFile.readlines  # takes the lines of a file and puts them into an array
qsFile.close

def putsQs(qstArr)   ## prints all the numbers and questions in console
	for i in 1..qstArr.length
		puts "#{i}\. #{qstArr[i-1]}"
	end
end

def writeQsToFile(qstArr) ## writes our question array to file
	newQstnsFile = File.new($qFilePath, 'w') 
	qstArr.each {|qstnStr| newQstnsFile.write qstnStr}
	newQstnsFile.close
end

myCliQstnArr = ARGV  ## this will ideally be ["add", "question"] or []

if myCliQstnArr[0] == "add"
	myCliQstnArr[1] = myCliQstnArr[1]+ "\n"
	fileQstsArr += [myCliQstnArr[1]]  ## adds new question to key element, an array, in a hash key
	writeQsToFile(fileQstsArr)
	putsQs(fileQstsArr)

elsif myCliQstnArr[0] == "rm"
	fileQstsArr.slice!(myCliQstnArr[1].to_i - 1)
	writeQsToFile(fileQstsArr)
	putsQs(fileQstsArr)

else
	questionFile = File.open($qFilePath, 'r+')
	fileQstsArr = questionFile.readlines
	puts "Current Questions:"
	putsQs(fileQstsArr)
	questionFile.close
end

