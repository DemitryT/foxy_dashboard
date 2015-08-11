require 'json'

ITEM = {
    "by": "owenwil",
    "descendants": 0,
    "id": 10033409,
    "score": 1,
    "text": "",
    "time": 1439196761,
    "title": "TypeKit is down",
    "type": "story",
    "url": "http://thenextweb.com/dd/2015/08/10/websites-are-looking-weird-because-web-font-service-typekit-is-down/"
}

HEADER = {
    'Accept'=>'*/*',
    'Content-Type'=>'application/json',
    'User-Agent'=>'HTTPClient/1.0 (2.6.0.1, ruby 2.2.2 (2015-04-13))'
}

def set_stub_request(uri, body)
  stub_request(:get, uri).
      with( headers: HEADER ).
      to_return(status: 200, body: body.to_json, headers: {})
end
