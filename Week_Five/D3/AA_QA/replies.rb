require 'sqlite3'
require "./qd.rb"

class Replies
  attr_accessor :body, :reply_id, :owner_id, :ord

  def self.find_by_id(id)
    users_id = Qunnection.instance.execute(<<-SQL, id)
    SELECT
      *
    FROM
      replies
    WHERE
      id = ?
    SQL

    # return users_id unless users_id.empty?
    Replies.new(users_id.first)
  end

  def self.find_by_owner(owner_id)
    owners = Qunnection.instance.execute(<<-SQL, owner_id)
    SELECT
      *
    FROM
      replies
    WHERE
      owner_id = ?
    SQL
    raise "NOT VALID ID" unless owners.first
    Replies.new(owners.first)
  end

  def self.find_by_reply(reply_id)
    replies = Qunnection.instance.execute(<<-SQL, reply_id)
    SELECT
    *
    FROM
    replies
    WHERE
    reply_id = ?
    SQL
    raise "NOT VALID ID" unless replies.first
    Replies.new(replies.first)
  end

  def self.all
    data = Qunnection.instance.execute('SELECT * FROM replies')
    data.map{|stuff| Replies.new(stuff)}
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @reply_id = options['reply_id']
    @owner_id = options['owner_id']
  end
end