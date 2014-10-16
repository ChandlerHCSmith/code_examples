require 'sqlite3'

$db = SQLite3::Database.open "w3_d1_book.db"

class Contact
  attr_reader :id
  def initialize(args)
    @first_name = args[:first_name]
    @last_name = args[:last_name]
    @company = args[:company]
    @phone_number = args[:phone_number]
    @email_address = args[:email_address]
  end

  def add
      $db.execute(
        <<-SQL
          INSERT INTO contacts
          (first_name, last_name, company, phone_number, email_address, created_at, updated_at)
          VALUES
          ("#{@first_name}", "#{@last_name}", "#{@company}", "#{@phone_number}", "#{@email_address}", DATETIME('now'), DATETIME('now'))
          SQL
        )
     @id = $db.last_insert_row_id
  end

  def delete
    $db.execute (
      <<-SQL
      DELETE
      FROM contacts
      WHERE id = "#{@id}";
      SQL
      )

    $db.execute (
      <<-SQL
      DELETE
      FROM groups_contacts_relations
      WHERE contact_id = "#{@id}";
      SQL
      )

  end

  def update_email(new_email)
    $db.execute (
      <<-SQL
      UPDATE contacts
      SET email_address = ?
      WHERE email_address = "#{@email_address}";
      SQL
      )
  end

  def self.delete(*ids)
    ids.each {|id| $db.execute (
      <<-SQL
      DELETE
      FROM contacts
      WHERE id = "#{id}";
      SQL
      )

    $db.execute (
      <<-SQL
      DELETE
      FROM groups_contacts_relations
      WHERE contact_id = "#{id}";
      SQL
      )
    }
  end

  def assign_group_memberships(*ids)
      ids.each{|id|
          $db.execute(
            <<-SQL
            INSERT INTO groups_contacts_relations
            (group_id,contact_id)
            VALUES
            ("#{id}", "#{@id}");
            SQL
            )
      }
  end

end

class Group

  def initialize(group_name)
    @group_name = group_name
  end

  def add
      $db.execute(
        <<-SQL
          INSERT INTO groups
          (group_name, created_at, updated_at)
          VALUES
          ("#{@group_name}", DATETIME('now'), DATETIME('now'))
          SQL
        )
     @id = $db.last_insert_row_id
  end

  def delete
    $db.execute (
      <<-SQL
      DELETE
      FROM groups
      WHERE id = "#{@id}";
      SQL
      )

    $db.execute (
      <<-SQL
      DELETE
      FROM groups_contacts_relations
      WHERE group_id = "#{@id}";
      SQL
      )
  end

  def self.delete(*ids)
    ids.each {|id| $db.execute (
      <<-SQL
      DELETE
      FROM contacts
      WHERE id = "#{id}";
      SQL
      )
    $db.execute (
      <<-SQL
      DELETE
      FROM groups_contacts_relations
      WHERE group_id = "#{id}";
      SQL
      )
  }
  end

end


contact = Contact.new({:first_name => "Melissa",
                        :last_name => "McCoy",
                        :company => "NewCodingGEn",
                        :phone_number => 5555555555,
                        :email_address => "mmy@ncg.com"}
                        )
contact.add

p $db.execute("SELECT * FROM contacts")
p $db.execute("SELECT * FROM groups_contacts_relations")
