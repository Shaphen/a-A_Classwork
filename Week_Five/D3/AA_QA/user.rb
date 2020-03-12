require 'sqlite3'
require "./questions.rb"
require "./qd.rb"

class User
  attr_accessor :fname, :lname
  
  def self.find_by_id(id)
    users_id = Qunnection.instance.execute(<<-SQL, id)
    SELECT
    *
    FROM
    user
    WHERE
    id = ?
    SQL

    # return users_id unless users_id.empty?
    User.new(users_id.first)
  end

  def self.find_by_name(fname, lname)
    users_name = Qunnection.instance.execute(<<-SQL, fname, lname)
    SELECT
      *
    FROM
      user
    WHERE
      fname = ? AND lname = ?
    SQL
    # return users_name unless users_name.empty?
    User.new(users_name.first)
  end

  def self.all
    data = Qunnection.instance.execute('SELECT * FROM user')
    data.map{|stuff| User.new(stuff)}
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    questions = Questions.find_by_author(self)

    authors = Qunnection.instance.execute(<<-SQL, questions)
    SELECT
      *
    FROMn
      Questions
    WHERE
      id = ?
    SQL

    User.new(authors.first)
  end
end