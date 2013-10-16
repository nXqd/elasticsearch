require 'test_helper'
require 'es_client'

# curl -XPUT 'http://localhost:9200/omni/book/_mapping' -d '{"book": {"properties": {"title": {"type": "string", "store": "yes"}, "price": {"type": "double"}}}}}'

class Book
  include ActiveModel::Model
  attr_accessor :attr
end

module Elasticable
  extend ActiveModel::Concern
end

class BookTest < ActiveSupport::TestCase
  def es_where_by_id
  end
end
