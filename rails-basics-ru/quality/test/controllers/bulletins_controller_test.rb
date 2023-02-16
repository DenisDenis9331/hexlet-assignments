require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'open root page' do
    get root_url
    assert_response :success
    assert_select 'body' do
      assert_select 'ul' do
        assert_select 'li', 2
      end
    end
    assert_select 'h1', 'Home#index'
  end

  test 'opens one bulletin page' do
    bulletin = Bulletin.create(title: 'Title 1', body: 'Body 1', published: true)

    get bulletin_url(bulletin.id)
    assert_response :success
    assert_select 'h1', 'bulletin page'
    assert_select 'h4', 'Title 1'
    assert_select 'p', 'Body 1'
  end

  test 'opens one bulletin page with fixture' do
    bulletin_url = bulletins(:one)
    get bulletin_url(bulletins)
    assert_response :success
    assert_select 'h1', 'bulletin page'
    assert_select 'h4', 'MyString'
    assert_select 'p', 'MyText'
  end
end
