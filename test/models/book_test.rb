require 'test_helper'
require 'es_client'
require 'oj'

# curl -XPUT 'http://localhost:9200/omni/book/_mapping' -d '{"book": {"properties": {"title": {"type": "string", "store": "yes"}, "price": {"type": "double"}}}}}'


class BookTest < ActiveSupport::TestCase
  def test_es_search_by_id
    es_book = Book.es_find({id: 1})
    assert_equal es_book["title"], "book1"
  end

  def test_es_search_should_failed_with_non_existed_id
    es_book = Book.es_find({id: "not_existed"})
    assert_equal es_book, nil
  end
end
