require 'sqlite3'
require "./qd.rb"

class Questions
  attr_accessor :title, :body, :author_id

  def self.all
    data = Qunnection.instance.execute('SELECT * FROM user')
    data.map{|stuff| Questions.new(stuff)}
  end

  def self.find_by_id(id)
    q_id = Qunnection.instance.execute(<<-SQL, id)
    SELECT
    *
    FROM
    questions
    WHERE
    id = ?
    SQL

    # return q_id unless q_id.empty?
    Questions.new(q_id.first)
  end

  def self.find_by_title(title)
    q_title = Qunnection.instance.execute(<<-SQL, title)
    SELECT
      *
    FROM
      questions
    WHERE
      title = ?
    SQL

    # return q_title unless q_title.empty?
    Questions.new(q_title.first)
  end

  def self.find_by_author(author_id)
    authors = Qunnection.instance.execute(<<-SQL, author_id)
    SELECT
      *
    FROM
      Questions
    WHERE
      author_id = ?
    SQL
    Questions.new(authors.first)
  end

  def initialize(options)
    @id = options['id']
    @author_id = options['author_id']
    @title = options['title']
    @body = options['body']
  end
end