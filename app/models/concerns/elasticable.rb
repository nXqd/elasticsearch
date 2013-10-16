require_dependency 'es_client'

module Elasticable
  extend ActiveSupport::Concern
  INDEX_NAME = 'omni'

  included do
    define_model_callbacks :search_by_id
    define_model_callbacks :my_name
  end

  def self.search_by_id(id)
    client = ESClient.new
    client.get INDEX_NAME, type: model_name, id: id
  end

  # after save new product, then reindex elastic search

  # after create new product then create new index
  private
  def model_name
    name.downcase
  end
end
