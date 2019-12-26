- controller 테스트

    ```
    require 'test_helper'

    class WelcomeControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get welcome_index_url
        assert_response :success
    end

    end
    ```

- model 테스트
    ```
    require 'test_helper'

    class ArticleTest < ActiveSupport::TestCase
    test "should not save article without title" do
    article = Article.new
    assert_not article.save, "Saved the article without a title"
    end
    test "should report error" do
        # some_undefined_variable is not defined elsewhere in the testcase
        assert_raises(NameError) do
        some_undefined_variable
        end
    end
    test "article_count" do
        assert_equal  2, Article.count
    end
    test "find all by name" do
        assert_equal 2, articles(:one, :two).length
    end

    def test_article
        assert_kind_of Article, Article.new
    end
    end
    ```
- service 테스트
    ?
