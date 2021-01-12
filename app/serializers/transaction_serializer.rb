class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount, :kind, :description, :account_id

end
