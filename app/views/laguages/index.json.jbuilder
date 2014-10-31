json.array!(@laguages) do |laguage|
  json.extract! laguage, :id, :name, :version
  json.url laguage_url(laguage, format: :json)
end
