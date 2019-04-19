class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      @@items.all.each do |item|
      resp.write "#{item.price}"
      end
    elsif !req.path.match(/items/)
      resp.write "Route not found"
      resp.status = 404
    end
  end
end
