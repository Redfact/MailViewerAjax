require "faker"

class EmailsController < ApplicationController
  def index
    puts "Controller email"
    @emails = Email.all
  end

  def new
    @email=Email.create(
      object:Faker::Book.title,
      body:Faker::Hipster.paragraph(sentence_count: 10),
      read: [true,false].sample
    )
    
    respond_to do |format|
      format.html{ redirect_to :index}
      format.js
    end
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html{ redirect_to email_path(params[:id])}
      format.js
    end
  end

  def book_params
    params.permit(:body, :object ,:read)
  end

end
