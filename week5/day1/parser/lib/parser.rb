require_relative '../db/setup'
require_relative 'student'
class RequestParser
  def initialize(request_string)
    @request_string = request_string
  end

  def parse
    # It is worth pointing out that this parse method makes a lot of assumptions and hard codes them into
    # our implementation here with no checks. This means the input we give it has to match exactly or an
    # error will be produced. It is always good to evaluate our assumptions in the code we write.

    #Take the given request_string and split it into parts
    method, url, http_version = @request_string.split(' ')
    url, query_param_string = url.split('?') # split out the query_params from the rest of the url
    uri_fragments = url.split('/') # split the existing url into fragments based on '/'
    protocol      = uri_fragments[0][0..-2] # Grab the first part of the url and remove the colon at the end
    domain_name   = uri_fragments[2] # Grab the 3rd element from the array, which is the domain name
    resource      = uri_fragments[3] # We are assuming that the first fragment after the domain name is a resource
    id            = uri_fragments[4] # And that the element after that is the id of that resource

    # We need all the query_params as a hash so lets do that.
    pairs = query_param_string.split('&') # First we break up all the query params into pairs by splitting on the &
    pairs.map! { |pair| pair.split('=') } # Then we iterate over each pair and split on the = so we now have nested arrays
    params = {} #create an empty Hash to store the query params
    pairs.each do |pair|
      params.store(pair.first.to_sym, pair.last) # Iterate over each pair and assign the second element in the array
                                                 # to the first element (as a key) in the hash
    end
    return { #Then we just return all the variables we created together in a single big hash
      method: method,
      full_url: url,
      http_version: http_version,
      protocol: protocol,
      domain_name: domain_name,
      resource: resource,
      id: id,
      params: params
    }
  end
end

system('clear')
request = RequestParser.new('GET http://localhost:3000/students?limit=10 HTTP/1.1').parse

if request[:resource] == 'students' #If the requested resource is one we know we have
  params = request[:params]
  puts "200 OK" #Put out a response code of 200 OK
  if params[:name] != nil #if the params include the key 'name' then look for that user
    puts Student.where(name: params[:name])
  else
    students = Student.all.limit(params[:limit]) #Grab all the students witha limit of what was given to us in the URL
    students.each do |student|
      puts student.name #print out each student's name
    end
  end
else #return the status code 404 if it is not a resource
  puts "404 NOT FOUND"
end
