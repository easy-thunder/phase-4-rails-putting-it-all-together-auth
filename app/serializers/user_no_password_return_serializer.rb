class UserNoPasswordReturnSerializer < ActiveModel::Serializer
  attributes :id, :username, :image_url, :bio
end
