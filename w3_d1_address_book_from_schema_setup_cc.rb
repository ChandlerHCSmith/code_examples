require 'sqlite3'


$db = SQLite3::Database.new('w3_d1_book.db')


module AddressBookDB
  extend self
  def  setup
    $db.execute(
      <<-SQL
      CREATE TABLE contacts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name VARCHAR(64) NOT NULL,
        last_name VARCHAR(64) NOT NULL,
        company VARCHAR(64) NOT NULL,
        phone_number INTEGER NOT NULL,
        email_address VARCHAR(128) NOT NULL,
        created_at DATETIME NOT NULL,
        updated_at DATETIME NOT NULL);
      SQL
    )

    $db.execute(
      <<-SQL
      CREATE TABLE groups (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        group_name VARCHAR(64));
      SQL
    )

    $db.execute(
      <<-SQL
      CREATE TABLE groups_contacts_relations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        group_id INTEGER NOT NULL,
        contact_id INTEGER NOT NULL,
        FOREIGN KEY (group_id) REFERENCES groups(id),
        FOREIGN KEY(contact_id) REFERENCES contacts(id));
      SQL
    )
  end
end

AddressBookDB.setup