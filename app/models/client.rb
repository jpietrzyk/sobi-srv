class Client < ActiveRecord::Base
  validates :bike_id, presence: true, type: { type: :integer }
  validates :token, presence: true, length: { is: 690 }

  # sorry we have to clear connections for sqlite
  after_save :reset_sqlite_connection

  private

  def reset_sqlite_connection
    ActiveRecord::Base.clear_active_connections!
    # ActiveRecord::Base.connection.execute("BEGIN TRANSACTION; END;")
  end
end
