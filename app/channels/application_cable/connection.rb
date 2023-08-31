module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
    # ActionCableの接続が確立されたときに呼び出されるメソッド
    def connect
      self.current_user = find_verified_user
    end

    private
    # cookies.encrypted[:user_id]は、ブラウザに保存されているcookiesのuser_idを取得。
    def find_verified_user
      if verified_user = User.find_by(id: cookies.encrypted[:user_id])
        verified_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
