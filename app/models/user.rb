class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :orders
   has_many :addresses

   attr_accessor :login

   validates :username,
             :presence => true,
             :uniqueness => {
               :case_sensitive => false
             }

   def self.find_first_by_auth_conditions(warden_conditions)
     conditions = warden_conditions.dup
     if login = conditions.delete(:login)
       where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
     else
       if conditions[:username].nil?
         where(conditions).first
       else
         where(username: conditions[:username]).first
       end
     end
   end

   def first_name
     self.name.split(' ').first
   end

   def items_shipped
     shipped = []

     self.orders.each do | order |
       order.items.each do | item |
         if item.status.include?( 'Shipped' )
           shipped << item
         end
       end
     end

     shipped
   end
end
