class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :id, type: Integer  
  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String

  def self.search(search)
    if search
      any_of( {firstname: /#{search}/} , {lastname: /#{search}/} , {email: /#{search}/} ).all
    end
  end

end
