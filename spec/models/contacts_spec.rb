require 'rails_helper'

describe Contact do
  # お問い合わせ要素(name, email, content)があれば有効な状態であること
  it "is valid with title" do
    contact = Contact.new(name: 'aaa', email: 'aaabbb@example.com', content: 'bbb')
    expect(contact).to be_valid
  end

  # お問い合わせ要素(name, email, content)があれば有効な状態であること
  it "is invalid without elements for contact" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end
end
