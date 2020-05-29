require "faker"

class EmailsController < ApplicationController
  def index
    puts "Controller email index"
    @emails = Email.all
  end

  def new
    @email=Email.create(
      object:Faker::Book.title,
      body:Faker::Hipster.paragraph(sentence_count: 10),
      read: [true,false].sample
    )
    
    respond_to do |format|
      format.html{ redirect_to emails_path}
      format.js
    end
  end

  def update
    puts "Controller email upt"
    read = params[:email][:read] 
    @email=Email.find(params[:id])
    @email.update(read: read)
    respond_to do |format|
      format.html{ redirect_to emails_path }
      format.js
    end
  end

  def show
    puts "Controller email show"
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html{ redirect_to email_path(params[:id])}
      format.js
    end
  end

  def destroy
    puts "Controller email destroy"
    Email.find(params[:id]).destroy
    respond_to do |format|
      format.html{ redirect_to emails_path}
      format.js
    end
  end

  def book_params
    params.permit(:body, :object ,:read)
  end

end
