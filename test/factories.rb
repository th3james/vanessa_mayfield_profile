Factory.define :post do |p|
  p.sequence(:title) { |n| "Post #{n}"}
  p.body "This is a test post"
end

Factory.define :page do |p|
  p.sequence(:title) { |n| "Page #{n}"}
  p.body "This is a test page"
end
