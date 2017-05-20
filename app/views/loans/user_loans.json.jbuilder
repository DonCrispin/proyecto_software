i = 0
json.array!(@loans) do |loan|
	json.id loan.id
	json.copy_id loan.copy.id
	json.location loan.copy.location
  	json.booktitle loan.copy.book.title
end