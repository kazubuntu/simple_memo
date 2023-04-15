# frozen_string_literal: true

require 'pg'

class Memo
  attr_reader :title, :content, :id

  def initialize(title, content, id = nil)
    @title = title
    @content = content
    @id = id
  end

  def save
    Memo.connect.exec_params('INSERT INTO memos (title, content) VALUES ($1, $2)', [title, content])
  end

  def update
    Memo.connect.exec_params('UPDATE memos SET title = $1, content = $2 WHERE id = $3', [title, content, id])
  end

  class << self
    def connect
      @connect ||= PG.connect(dbname: 'simple_memo')
    end

    def all
      connect.exec_params('SELECT * FROM memos ORDER BY id') do |memos|
        memos.map do |memo|
          Memo.new(memo['title'], memo['content'], memo['id'])
        end
      end
    end

    def find(id)
      memos = connect.exec_params('SELECT * FROM memos WHERE id = $1', [id])
      Memo.new(memos[0]['title'], memos[0]['content'], memos[0]['id'])
    end

    def destroy(id)
      connect.exec_params('DELETE FROM memos WHERE id = $1', [id])
    end
  end
end
