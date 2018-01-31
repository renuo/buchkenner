require 'rails_helper'

RSpec.describe 'books/edit', type: :view do
  let(:user) { create(:user) }
  before(:each) do
    @book = assign(:book, Book.create!(
                            title: 'MyString',
                            author: 'MyString',
                            isbn: 'MyString',
                            user: user
    ))
  end

  it 'renders the edit book form' do
    render

    assert_select 'form[action=?][method=?]', book_path(@book), 'post' do
      assert_select 'input[name=?]', 'book[title]'

      assert_select 'input[name=?]', 'book[author]'

      assert_select 'input[name=?]', 'book[isbn]'
    end
  end
end
