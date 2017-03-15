class HomeController < ApplicationController
	def index
		@books = Book.joins(copies: :loans).order('count(loans.id)').group('books.id').limit(5)
		@authors = Author.joins(books: {copies: :loans}).order('count(loans.id)').group('authors.id').limit(5)
	end
end
