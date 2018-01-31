require 'rails_helper'

RSpec.describe 'books/new', type: :view do
  let(:user) { create(:user) }
  before(:each) do
    assign(:book, Book.new(
                    title: 'MyString',
                    author: 'MyString',
                    isbn: 'MyString',
                    user: user
    ))
  end

  it 'renders new book form' do
    render

    assert_select 'form[action=?][method=?]', books_path, 'post' do
      assert_select 'input[name=?]', 'book[title]'

      assert_select 'input[name=?]', 'book[author]'

      assert_select 'input[name=?]', 'book[isbn]'
    end
  end
end
