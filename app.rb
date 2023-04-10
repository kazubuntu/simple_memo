# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader'
require 'erb'
require_relative 'models/memo'

helpers do
  def h(text)
    ERB::Util.html_escape(text)
  end
end

get '/' do
  redirect to('/memos')
end

get '/memos' do
  @memos = Memo.all
  erb :index
end

post '/memos' do
  Memo.new(params[:title], params[:content]).save
  redirect to('/memos')
end

get '/memos/new' do
  erb :new
end

get '/memos/:id/edit' do |id|
  @memo = Memo.find(id)
  erb :edit
end

get '/memos/:id' do |id|
  @memo = Memo.find(id)
  erb :show
end

patch '/memos/:id' do |id|
  Memo.new(params[:title], params[:content], id).update
  redirect to('/memos')
end

delete '/memos/:id' do |id|
  Memo.destroy(id)
  redirect to('/memos')
end
