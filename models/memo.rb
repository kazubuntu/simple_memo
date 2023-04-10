# frozen_string_literal: true

require 'json'

PATH_OF_MEMOS = 'db/memos.json'

class Memo
  attr_reader :id, :title, :content

  def initialize(title, content, id = new_id)
    @title = title
    @content = content
    @id = id
  end

  def save
    memos = Memo.read_memos
    memos[id] = { title:, content: }
    Memo.write_memos(memos)
  end

  alias update save

  private

  def new_id
    memos = Memo.read_memos
    memos.empty? ? 1 : memos.keys.map(&:to_i).max + 1
  end

  class << self
    def all
      memos = read_memos
      memos.map do |id, memo|
        Memo.new(memo['title'], memo['content'], id)
      end
    end

    def find(id)
      memo = read_memos[id]
      Memo.new(memo['title'], memo['content'], id)
    end

    def destroy(id)
      memos = read_memos
      memos.delete(id)
      write_memos(memos)
    end

    def read_memos
      File.open(PATH_OF_MEMOS) do |f|
        JSON.parse(f.read)
      end
    end

    def write_memos(memos)
      File.open(PATH_OF_MEMOS, 'w') do |f|
        JSON.dump(memos, f)
      end
    end
  end
end
