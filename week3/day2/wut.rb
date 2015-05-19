i = 0
result = []
while i < 10
  i += 1
  next if i.even?
  result << i
end

puts result

friends = ['sally', 'jane']
%w(bill bob jane sally).each do |name|
  next if friends.include?(name)
  puts "Go home #{name}"
end
