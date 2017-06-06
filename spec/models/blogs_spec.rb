require 'rails_helper'

describe Blog do
  # タイトルがあれば有効な状態であること
  it "is valid with title" do
    blog = Blog.new(title: 'aaa', content: 'bbb')
    expect(blog).to be_valid
  end

  # タイトルがなければ無効な状態であること
  it "is invalid without a title" do
    blog = Blog.new
    expect(blog).not_to be_valid
  end

#  it "is valid with title" do
#    blog = Blog.new
#    blog.valid?
#    expect(blog.errors[:title]).to include("を入力して下さい")
#  end
end
